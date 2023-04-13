import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'service_request.g.dart';

@JsonSerializable()
@CopyWith()
class ServiceRequest {
  final int? id;
  final String? description;
  final String? location;
  final List<String>? media;
  final String? requestType;
  final String? title;
  final int? serviceWorkerId;
  final String? status;
  final int? studentId;
  final String? studentName;
  final String? studentNumber;
  final String? timeCreated;

  ServiceRequest({
    required this.description,
    required this.location,
    required this.media,
    required this.requestType,
    required this.title,
    required this.serviceWorkerId,
    required this.status,
    required this.studentId,
    required this.id,
    required this.studentName,
    required this.studentNumber,
    required this.timeCreated,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) => _$ServiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceRequestToJson(this);
}
