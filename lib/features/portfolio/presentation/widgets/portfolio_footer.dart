import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppDimens.space32),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: Column(
        children: [
          Text(
            'footer.built_with'.tr(),
            style: AppTextStyles.bodySmall(colors),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimens.space8),
          Text(
            '© $year $name. ${'footer.rights'.tr()}',
            style: AppTextStyles.labelMedium(colors),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
