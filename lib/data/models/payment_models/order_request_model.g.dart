// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) =>
    _OrderRequest(
      items:
          (json['items'] as List<dynamic>)
              .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      shippingInfo: ShippingInfo.fromJson(
        json['shippingInfo'] as Map<String, dynamic>,
      ),
      paymentInfo: PaymentInfo.fromJson(
        json['paymentInfo'] as Map<String, dynamic>,
      ),
      marketplaceFee: (json['marketplaceFee'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderRequestToJson(_OrderRequest instance) =>
    <String, dynamic>{
      'items': instance.items,
      'shippingInfo': instance.shippingInfo,
      'paymentInfo': instance.paymentInfo,
      'marketplaceFee': instance.marketplaceFee,
      'total': instance.total,
    };

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  productId: json['productId'] as String,
  quantity: (json['quantity'] as num).toInt(),
  decidedPrice: (json['decidedPrice'] as num).toDouble(),
  actualPrice: (json['actualPrice'] as num).toDouble(),
  offerId: json['offerId'] as String?,
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'decidedPrice': instance.decidedPrice,
      'actualPrice': instance.actualPrice,
      'offerId': instance.offerId,
    };

_ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) =>
    _ShippingInfo(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$ShippingInfoToJson(_ShippingInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
    };

_PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) => _PaymentInfo(
  type: json['type'] as String,
  paymentId: json['paymentId'] as String,
);

Map<String, dynamic> _$PaymentInfoToJson(_PaymentInfo instance) =>
    <String, dynamic>{'type': instance.type, 'paymentId': instance.paymentId};
