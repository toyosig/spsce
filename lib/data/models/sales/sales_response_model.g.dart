// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesResponseModel _$SalesResponseModelFromJson(Map<String, dynamic> json) =>
    _SalesResponseModel(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => SalesOrderModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SalesResponseModelToJson(_SalesResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'orders': instance.orders,
    };
