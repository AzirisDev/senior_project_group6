import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'data_response.g.dart';

@JsonSerializable()
@CopyWith()
class DataResponse extends Equatable {
  final Object? data;
  final String? message;
  final String? status;

  const DataResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);

  @override
  List<Object?> get props => [data, message, status];
}
