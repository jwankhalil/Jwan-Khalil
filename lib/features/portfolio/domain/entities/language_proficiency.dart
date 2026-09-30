import 'package:equatable/equatable.dart';

class LanguageProficiency extends Equatable {
  const LanguageProficiency({
    required this.id,
    required this.name,
    required this.proficiency,
  });

  final String id;
  final String name;
  final String proficiency;

  @override
  List<Object?> get props => [id, name, proficiency];
}
