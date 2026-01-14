import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_notification.freezed.dart';
part 'toggle_notification.g.dart';

@freezed
abstract class ToggleNotificationModel with _$ToggleNotificationModel {
  const factory ToggleNotificationModel({
    required bool success,
    required String message,
    bool? pushNotification,
    bool? emailNotification,
  }) = _ToggleNotificationModel;

  factory ToggleNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$ToggleNotificationModelFromJson(json);
}
