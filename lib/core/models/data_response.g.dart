// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      data: json['data'],
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };
