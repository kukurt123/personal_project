import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
@HiveType(typeId: 1)
abstract class HistoryModel with _$HistoryModel {
  factory HistoryModel({@HiveField(0) String placeName}) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
