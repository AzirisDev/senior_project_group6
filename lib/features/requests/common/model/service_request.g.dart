// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) =>
    ServiceRequest(
      description: json['description'] as String?,
      location: json['location'] as String?,
      media: json['media'] as String?,
      requestType: json['requestType'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ServiceRequestToJson(ServiceRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'location': instance.location,
      'media': instance.media,
      'requestType': instance.requestType,
      'title': instance.title,
    };
