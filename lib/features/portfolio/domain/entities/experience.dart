import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  const Experience({
    required this.id,
    required this.company,
    required this.role,
    required this.startDate,
    required this.highlights,
    this.employmentType,
    this.location,
    this.endDate,
    this.isCurrent = false,
  });

  final String id;
  final String company;
  final String role;
  final String? employmentType;
  final String? location;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isCurrent;
  final List<String> highlights;

  @override
  List<Object?> get props => [
        id,
        company,
        role,
        employmentType,
        location,
        startDate,
        endDate,
        isCurrent,
        highlights,
      ];
}
