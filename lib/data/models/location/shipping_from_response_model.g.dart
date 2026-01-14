// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_from_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShippingFromResponseModel _$ShippingFromResponseModelFromJson(
  Map<String, dynamic> json,
) => _ShippingFromResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ShippingFromModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ShippingFromResponseModelToJson(
  _ShippingFromResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
