import 'package:equatable/equatable.dart';

class Education extends Equatable {
  const Education({
    required this.id,
    required this.degree,
    required this.institution,
    this.startDate,
    this.endDate,
    this.isCurrent = false,
  });

  final String id;
  final String degree;
  final String institution;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isCurrent;

  @override
  List<Object?> get props =>
      [id, degree, institution, startDate, endDate, isCurrent];
}
