// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) =>
    ServiceRequest(
      description: json['description'] as String?,
      location: json['location'] as String?,
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
      requestType: json['requestType'] as String?,
      title: json['title'] as String?,
      serviceWorkerId: json['serviceWorkerId'] as int?,
      status: json['status'] as String?,
      studentId: json['studentId'] as int?,
      id: json['id'] as int?,
      studentName: json['studentName'] as String?,
      studentNumber: json['studentNumber'] as String?,
      timeCreated: json['timeCreated'] as String?,
    );

Map<String, dynamic> _$ServiceRequestToJson(ServiceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'location': instance.location,
      'media': instance.media,
      'requestType': instance.requestType,
      'title': instance.title,
      'serviceWorkerId': instance.serviceWorkerId,
      'status': instance.status,
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'studentNumber': instance.studentNumber,
      'timeCreated': instance.timeCreated,
    };
