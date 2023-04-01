// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainUser _$MainUserFromJson(Map<String, dynamic> json) => MainUser(
      id: json['id'] as String,
      message: json['message'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$MainUserToJson(MainUser instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'role': instance.role,
      'status': instance.status,
    };
