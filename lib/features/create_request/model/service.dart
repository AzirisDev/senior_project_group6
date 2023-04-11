import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'service.g.dart';

@JsonSerializable()
@CopyWith()
class Service {
  final int? id;
  final String? departmentType;
  final int? adminId;

  Service({
    required this.id,
    required this.departmentType,
    required this.adminId,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
