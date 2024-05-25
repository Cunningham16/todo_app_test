// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      content: json['content'] as String?,
      date: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['date'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'content': instance.content,
      'date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.date, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
