import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
class MainUser {
  final int? id;
  final String? message;
  final String? role;
  final String? status;

  MainUser({
    required this.id,
    required this.message,
    required this.role,
    required this.status,
  });

  factory MainUser.fromJson(Map<String, dynamic> json) =>
      _$MainUserFromJson(json);

  Map<String, dynamic> toJson() => _$MainUserToJson(this);
}
