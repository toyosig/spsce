import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_toggle_model.freezed.dart';
part 'follow_toggle_model.g.dart';

@freezed
abstract class FollowToggleModel with _$FollowToggleModel {
  const factory FollowToggleModel({
    required int statusCode,
    required bool success,
    required String message,
  }) = _FollowToggleModel;

  factory FollowToggleModel.fromJson(Map<String, dynamic> json) =>
      _$FollowToggleModelFromJson(json);
}
