// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retry_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RetryOrderResponseModel _$RetryOrderResponseModelFromJson(
  Map<String, dynamic> json,
) => _RetryOrderResponseModel(
  message: json['message'] as String?,
  error: json['error'] as String?,
  success: json['success'] as bool?,
  reference: json['reference'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$RetryOrderResponseModelToJson(
  _RetryOrderResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'error': instance.error,
  'success': instance.success,
  'reference': instance.reference,
  'amount': instance.amount,
};
