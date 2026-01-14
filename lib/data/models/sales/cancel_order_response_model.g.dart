// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CancelOrderResponseModel _$CancelOrderResponseModelFromJson(
  Map<String, dynamic> json,
) => _CancelOrderResponseModel(
  message: json['message'] as String?,
  success: json['success'] as bool?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$CancelOrderResponseModelToJson(
  _CancelOrderResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'error': instance.error,
};
