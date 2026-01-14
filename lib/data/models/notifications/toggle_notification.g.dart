// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToggleNotificationModel _$ToggleNotificationModelFromJson(
  Map<String, dynamic> json,
) => _ToggleNotificationModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  pushNotification: json['pushNotification'] as bool?,
  emailNotification: json['emailNotification'] as bool?,
);

Map<String, dynamic> _$ToggleNotificationModelToJson(
  _ToggleNotificationModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'pushNotification': instance.pushNotification,
  'emailNotification': instance.emailNotification,
};
