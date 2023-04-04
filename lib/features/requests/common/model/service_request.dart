import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'service_request.g.dart';

@JsonSerializable()
@CopyWith()
class ServiceRequest {
  final String? description;
  final String? location;
  final String? media;
  final String? requestType;
  final String? title;

  ServiceRequest({
    required this.description,
    required this.location,
    required this.media,
    required this.requestType,
    required this.title,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceRequestToJson(this);
}
