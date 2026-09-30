import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  const Skill({
    required this.id,
    required this.category,
    required this.name,
    this.iconKey,
  });

  final String id;
  final String category;
  final String name;
  final String? iconKey;

  @override
  List<Object?> get props => [id, category, name, iconKey];
}
