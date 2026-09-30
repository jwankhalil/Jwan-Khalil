import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/mesh_background.dart';
import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';
import 'package:portfolio/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:portfolio/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/about_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/contact_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/education_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/experience_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/hero_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/portfolio_footer.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/portfolio_nav_bar.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/projects_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/skills_section.dart';
import 'package:portfolio/injection_container.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PortfolioCubit>(),
      child: const _PortfolioView(),
    );
  }
}

class _PortfolioView extends StatefulWidget {
  const _PortfolioView();

  @override
  State<_PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<_PortfolioView> {
  final _scrollController = ScrollController();
  final _sectionKeys = <String, GlobalKey>{
    'about': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'skills': GlobalKey(),
    'education': GlobalKey(),
    'contact': GlobalKey(),
  };
  String? _loadedLanguageCode;
  double _scrollProgress = 0;
  String? _activeSectionId;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageCode = context.locale.languageCode;
    if (_loadedLanguageCode == languageCode) return;
    _loadedLanguageCode = languageCode;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<PortfolioCubit>().load(languageCode: languageCode);
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    final max = position.maxScrollExtent;
    final progress = max <= 0 ? 0.0 : (position.pixels / max).clamp(0.0, 1.0);

    String? active;
    double bestDistance = double.infinity;
    final viewportTop = position.pixels + AppDimens.navHeight + 24;

    for (final entry in _sectionKeys.entries) {
      final ctx = entry.value.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final offset = box.localToGlobal(Offset.zero).dy + position.pixels;
      final distance = (offset - viewportTop).abs();
      if (offset <= viewportTop + 120 && distance < bestDistance) {
        bestDistance = distance;
        active = entry.key;
      }
    }

    // Prefer the last section that has started entering the upper viewport.
    for (final entry in _sectionKeys.entries) {
      final ctx = entry.value.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final globalY = box.localToGlobal(Offset.zero).dy;
      if (globalY <= AppDimens.navHeight + 140) {
        active = entry.key;
      }
    }

    if (progress != _scrollProgress || active != _activeSectionId) {
      setState(() {
        _scrollProgress = progress;
        _activeSectionId = active;
      });
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  Future<void> _scrollTo(String id) async {
    final key = _sectionKeys[id];
    final ctx = key?.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MeshBackground(),
          BlocBuilder<PortfolioCubit, PortfolioState>(
            builder: (context, state) {
              return state.when(
                initial: () => const _LoadingBody(),
                loading: () => const _LoadingBody(),
                error: (failure) => _ErrorBody(
                  message: failure.messageKey.tr(),
                  onRetry: () => context.read<PortfolioCubit>().load(
                        languageCode: context.locale.languageCode,
                      ),
                ),
                success: (content) => _SuccessBody(
                  content: content,
                  scrollController: _scrollController,
                  sectionKeys: _sectionKeys,
                  onNavigate: _scrollTo,
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
              builder: (context, state) {
                final name = state.maybeWhen(
                  success: (c) => c.profile.fullName,
                  orElse: () => 'Jwan Khalil',
                );
                return PortfolioNavBar(
                  brandName: name,
                  onNavigate: _scrollTo,
                  scrollProgress: _scrollProgress,
                  activeSectionId: _activeSectionId,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessBody extends StatelessWidget {
  const _SuccessBody({
    required this.content,
    required this.scrollController,
    required this.sectionKeys,
    required this.onNavigate,
  });

  final PortfolioContent content;
  final ScrollController scrollController;
  final Map<String, GlobalKey> sectionKeys;
  final void Function(String id) onNavigate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const SizedBox(height: AppDimens.navHeight + 2),
          Padding(
            padding: context.pagePadding,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppDimens.maxContentWidth,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroSection(
                      profile: content.profile,
                      onContactTap: () => onNavigate('contact'),
                      onProjectsTap: () => onNavigate('projects'),
                    ),
                    KeyedSubtree(
                      key: sectionKeys['about'],
                      child: AboutSection(profile: content.profile),
                    ),
                    KeyedSubtree(
                      key: sectionKeys['experience'],
                      child: ExperienceSection(
                        experiences: content.experiences,
                      ),
                    ),
                    KeyedSubtree(
                      key: sectionKeys['projects'],
                      child: ProjectsSection(projects: content.projects),
                    ),
                    KeyedSubtree(
                      key: sectionKeys['skills'],
                      child: SkillsSection(
                        skillsByCategory: content.skillsByCategory,
                      ),
                    ),
                    KeyedSubtree(
                      key: sectionKeys['education'],
                      child: EducationSection(
                        educations: content.educations,
                        certifications: content.certifications,
                        languages: content.languages,
                      ),
                    ),
                    KeyedSubtree(
                      key: sectionKeys['contact'],
                      child: ContactSection(profile: content.profile),
                    ),
                    PortfolioFooter(name: content.profile.fullName),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: CircularProgressIndicator(color: colors.accent),
          ),
          const SizedBox(height: AppDimens.space16),
          Text('common.loading'.tr(), style: AppTextStyles.bodyMedium(colors)),
        ],
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.space24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: colors.danger, size: 40),
            const SizedBox(height: AppDimens.space16),
            Text(message, style: AppTextStyles.bodyLarge(colors)),
            const SizedBox(height: AppDimens.space24),
            ElevatedButton(
              onPressed: onRetry,
              child: Text('common.retry'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
