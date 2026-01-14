// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfirmOrderRequestModel _$ConfirmOrderRequestModelFromJson(
  Map<String, dynamic> json,
) => _ConfirmOrderRequestModel(
  paymentType: json['paymentType'] as String,
  paymentId: json['paymentId'] as String,
  paymentStatus: json['paymentStatus'] as String,
  marketplaceFee: (json['marketplaceFee'] as num).toDouble(),
  decidedPrice: (json['decidedPrice'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
  items:
      (json['items'] as List<dynamic>)
          .map((e) => ProductsData.fromJson(e as Map<String, dynamic>))
          .toList(),
  shippingInfo: ShippingInfo.fromJson(
    json['shippingInfo'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ConfirmOrderRequestModelToJson(
  _ConfirmOrderRequestModel instance,
) => <String, dynamic>{
  'paymentType': instance.paymentType,
  'paymentId': instance.paymentId,
  'paymentStatus': instance.paymentStatus,
  'marketplaceFee': instance.marketplaceFee,
  'decidedPrice': instance.decidedPrice,
  'total': instance.total,
  'items': instance.items,
  'shippingInfo': instance.shippingInfo,
};
