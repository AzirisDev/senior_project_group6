import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'student.g.dart';

@JsonSerializable()
@CopyWith()
class Student {
  final String? department;
  final String? fullName;
  final String? phoneNumber;
  final String? role;
  final String? specialization;
  final String? status;
  final String? universityEmail;

  Student({
    required this.department,
    required this.fullName,
    required this.phoneNumber,
    required this.role,
    required this.specialization,
    required this.status,
    required this.universityEmail,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
