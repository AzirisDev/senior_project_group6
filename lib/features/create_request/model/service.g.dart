// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as int?,
      departmentType: json['departmentType'] as String?,
      adminId: json['adminId'] as int?,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'departmentType': instance.departmentType,
      'adminId': instance.adminId,
    };
