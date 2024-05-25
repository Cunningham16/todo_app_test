import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel(
      {String? id,
      required String userId,
      required String title,
      required bool isCompleted,
      String? content,
      @TimestampConverter() DateTime? date}) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) =>
      _$TaskModelFromJson(json);
}
