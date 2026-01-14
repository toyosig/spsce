// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesOrderModel _$SalesOrderModelFromJson(Map<String, dynamic> json) =>
    _SalesOrderModel(
      id: json['id'] as String?,
      buyerId: json['buyerId'] as String?,
      buyer:
          json['buyer'] == null
              ? null
              : AuthUserModel.fromJson(json['buyer'] as Map<String, dynamic>),
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      paymentType: json['paymentType'] as String?,
      paymentId: json['paymentId'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      marketplaceFee: (json['marketplaceFee'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      dispatch: json['dispatch'] as bool?,
      deliver: json['deliver'] as bool?,
      createdAt: json['createdAt'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => SalesOrderItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$SalesOrderModelToJson(_SalesOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyerId': instance.buyerId,
      'buyer': instance.buyer,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'paymentType': instance.paymentType,
      'paymentId': instance.paymentId,
      'paymentStatus': instance.paymentStatus,
      'marketplaceFee': instance.marketplaceFee,
      'total': instance.total,
      'dispatch': instance.dispatch,
      'deliver': instance.deliver,
      'createdAt': instance.createdAt,
      'items': instance.items,
    };

_SalesOrderItemModel _$SalesOrderItemModelFromJson(Map<String, dynamic> json) =>
    _SalesOrderItemModel(
      id: json['id'] as String?,
      productId: json['productId'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      sellerId: json['sellerId'] as String?,
      sellerUsername: json['sellerUsername'] as String?,
      decidedPrice: (json['decidedPrice'] as num?)?.toDouble(),
      productTitle: json['productTitle'] as String?,
      productPrice: (json['productPrice'] as num?)?.toDouble(),
      conversationId: json['conversationId'] as String?,
      isDirect: json['isDirect'] as bool?,
      product:
          json['product'] == null
              ? null
              : ProductsData.fromJson(json['product'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SalesOrderItemModelToJson(
  _SalesOrderItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'quantity': instance.quantity,
  'sellerId': instance.sellerId,
  'sellerUsername': instance.sellerUsername,
  'decidedPrice': instance.decidedPrice,
  'productTitle': instance.productTitle,
  'productPrice': instance.productPrice,
  'conversationId': instance.conversationId,
  'isDirect': instance.isDirect,
  'product': instance.product,
  'status': instance.status,
};
