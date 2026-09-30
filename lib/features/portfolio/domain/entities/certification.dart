import 'package:equatable/equatable.dart';

class Certification extends Equatable {
  const Certification({
    required this.id,
    required this.title,
    required this.issuer,
    this.credentialUrl,
  });

  final String id;
  final String title;
  final String issuer;
  final String? credentialUrl;

  @override
  List<Object?> get props => [id, title, issuer, credentialUrl];
}
