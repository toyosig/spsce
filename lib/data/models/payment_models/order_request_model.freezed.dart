// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderRequest {

 List<OrderItem> get items; ShippingInfo get shippingInfo; PaymentInfo get paymentInfo; double get marketplaceFee; double get total;
/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderRequestCopyWith<OrderRequest> get copyWith => _$OrderRequestCopyWithImpl<OrderRequest>(this as OrderRequest, _$identity);

  /// Serializes this OrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderRequest&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.shippingInfo, shippingInfo) || other.shippingInfo == shippingInfo)&&(identical(other.paymentInfo, paymentInfo) || other.paymentInfo == paymentInfo)&&(identical(other.marketplaceFee, marketplaceFee) || other.marketplaceFee == marketplaceFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),shippingInfo,paymentInfo,marketplaceFee,total);

@override
String toString() {
  return 'OrderRequest(items: $items, shippingInfo: $shippingInfo, paymentInfo: $paymentInfo, marketplaceFee: $marketplaceFee, total: $total)';
}


}

/// @nodoc
abstract mixin class $OrderRequestCopyWith<$Res>  {
  factory $OrderRequestCopyWith(OrderRequest value, $Res Function(OrderRequest) _then) = _$OrderRequestCopyWithImpl;
@useResult
$Res call({
 List<OrderItem> items, ShippingInfo shippingInfo, PaymentInfo paymentInfo, double marketplaceFee, double total
});


$ShippingInfoCopyWith<$Res> get shippingInfo;$PaymentInfoCopyWith<$Res> get paymentInfo;

}
/// @nodoc
class _$OrderRequestCopyWithImpl<$Res>
    implements $OrderRequestCopyWith<$Res> {
  _$OrderRequestCopyWithImpl(this._self, this._then);

  final OrderRequest _self;
  final $Res Function(OrderRequest) _then;

/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? shippingInfo = null,Object? paymentInfo = null,Object? marketplaceFee = null,Object? total = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,shippingInfo: null == shippingInfo ? _self.shippingInfo : shippingInfo // ignore: cast_nullable_to_non_nullable
as ShippingInfo,paymentInfo: null == paymentInfo ? _self.paymentInfo : paymentInfo // ignore: cast_nullable_to_non_nullable
as PaymentInfo,marketplaceFee: null == marketplaceFee ? _self.marketplaceFee : marketplaceFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingInfoCopyWith<$Res> get shippingInfo {
  
  return $ShippingInfoCopyWith<$Res>(_self.shippingInfo, (value) {
    return _then(_self.copyWith(shippingInfo: value));
  });
}/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentInfoCopyWith<$Res> get paymentInfo {
  
  return $PaymentInfoCopyWith<$Res>(_self.paymentInfo, (value) {
    return _then(_self.copyWith(paymentInfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _OrderRequest implements OrderRequest {
  const _OrderRequest({required final  List<OrderItem> items, required this.shippingInfo, required this.paymentInfo, required this.marketplaceFee, required this.total}): _items = items;
  factory _OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);

 final  List<OrderItem> _items;
@override List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ShippingInfo shippingInfo;
@override final  PaymentInfo paymentInfo;
@override final  double marketplaceFee;
@override final  double total;

/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderRequestCopyWith<_OrderRequest> get copyWith => __$OrderRequestCopyWithImpl<_OrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderRequest&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.shippingInfo, shippingInfo) || other.shippingInfo == shippingInfo)&&(identical(other.paymentInfo, paymentInfo) || other.paymentInfo == paymentInfo)&&(identical(other.marketplaceFee, marketplaceFee) || other.marketplaceFee == marketplaceFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),shippingInfo,paymentInfo,marketplaceFee,total);

@override
String toString() {
  return 'OrderRequest(items: $items, shippingInfo: $shippingInfo, paymentInfo: $paymentInfo, marketplaceFee: $marketplaceFee, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OrderRequestCopyWith<$Res> implements $OrderRequestCopyWith<$Res> {
  factory _$OrderRequestCopyWith(_OrderRequest value, $Res Function(_OrderRequest) _then) = __$OrderRequestCopyWithImpl;
@override @useResult
$Res call({
 List<OrderItem> items, ShippingInfo shippingInfo, PaymentInfo paymentInfo, double marketplaceFee, double total
});


@override $ShippingInfoCopyWith<$Res> get shippingInfo;@override $PaymentInfoCopyWith<$Res> get paymentInfo;

}
/// @nodoc
class __$OrderRequestCopyWithImpl<$Res>
    implements _$OrderRequestCopyWith<$Res> {
  __$OrderRequestCopyWithImpl(this._self, this._then);

  final _OrderRequest _self;
  final $Res Function(_OrderRequest) _then;

/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? shippingInfo = null,Object? paymentInfo = null,Object? marketplaceFee = null,Object? total = null,}) {
  return _then(_OrderRequest(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,shippingInfo: null == shippingInfo ? _self.shippingInfo : shippingInfo // ignore: cast_nullable_to_non_nullable
as ShippingInfo,paymentInfo: null == paymentInfo ? _self.paymentInfo : paymentInfo // ignore: cast_nullable_to_non_nullable
as PaymentInfo,marketplaceFee: null == marketplaceFee ? _self.marketplaceFee : marketplaceFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingInfoCopyWith<$Res> get shippingInfo {
  
  return $ShippingInfoCopyWith<$Res>(_self.shippingInfo, (value) {
    return _then(_self.copyWith(shippingInfo: value));
  });
}/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentInfoCopyWith<$Res> get paymentInfo {
  
  return $PaymentInfoCopyWith<$Res>(_self.paymentInfo, (value) {
    return _then(_self.copyWith(paymentInfo: value));
  });
}
}


/// @nodoc
mixin _$OrderItem {

 String get productId; int get quantity; double get decidedPrice; double get actualPrice; String? get offerId;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.decidedPrice, decidedPrice) || other.decidedPrice == decidedPrice)&&(identical(other.actualPrice, actualPrice) || other.actualPrice == actualPrice)&&(identical(other.offerId, offerId) || other.offerId == offerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity,decidedPrice,actualPrice,offerId);

@override
String toString() {
  return 'OrderItem(productId: $productId, quantity: $quantity, decidedPrice: $decidedPrice, actualPrice: $actualPrice, offerId: $offerId)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String productId, int quantity, double decidedPrice, double actualPrice, String? offerId
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? quantity = null,Object? decidedPrice = null,Object? actualPrice = null,Object? offerId = freezed,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,decidedPrice: null == decidedPrice ? _self.decidedPrice : decidedPrice // ignore: cast_nullable_to_non_nullable
as double,actualPrice: null == actualPrice ? _self.actualPrice : actualPrice // ignore: cast_nullable_to_non_nullable
as double,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.productId, required this.quantity, required this.decidedPrice, required this.actualPrice, this.offerId});
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  String productId;
@override final  int quantity;
@override final  double decidedPrice;
@override final  double actualPrice;
@override final  String? offerId;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.decidedPrice, decidedPrice) || other.decidedPrice == decidedPrice)&&(identical(other.actualPrice, actualPrice) || other.actualPrice == actualPrice)&&(identical(other.offerId, offerId) || other.offerId == offerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity,decidedPrice,actualPrice,offerId);

@override
String toString() {
  return 'OrderItem(productId: $productId, quantity: $quantity, decidedPrice: $decidedPrice, actualPrice: $actualPrice, offerId: $offerId)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String productId, int quantity, double decidedPrice, double actualPrice, String? offerId
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantity = null,Object? decidedPrice = null,Object? actualPrice = null,Object? offerId = freezed,}) {
  return _then(_OrderItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,decidedPrice: null == decidedPrice ? _self.decidedPrice : decidedPrice // ignore: cast_nullable_to_non_nullable
as double,actualPrice: null == actualPrice ? _self.actualPrice : actualPrice // ignore: cast_nullable_to_non_nullable
as double,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ShippingInfo {

 String get fullName; String get phoneNumber; String get address1; String get address2; String get city; String get state;
/// Create a copy of ShippingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingInfoCopyWith<ShippingInfo> get copyWith => _$ShippingInfoCopyWithImpl<ShippingInfo>(this as ShippingInfo, _$identity);

  /// Serializes this ShippingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingInfo&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,address1,address2,city,state);

@override
String toString() {
  return 'ShippingInfo(fullName: $fullName, phoneNumber: $phoneNumber, address1: $address1, address2: $address2, city: $city, state: $state)';
}


}

/// @nodoc
abstract mixin class $ShippingInfoCopyWith<$Res>  {
  factory $ShippingInfoCopyWith(ShippingInfo value, $Res Function(ShippingInfo) _then) = _$ShippingInfoCopyWithImpl;
@useResult
$Res call({
 String fullName, String phoneNumber, String address1, String address2, String city, String state
});




}
/// @nodoc
class _$ShippingInfoCopyWithImpl<$Res>
    implements $ShippingInfoCopyWith<$Res> {
  _$ShippingInfoCopyWithImpl(this._self, this._then);

  final ShippingInfo _self;
  final $Res Function(ShippingInfo) _then;

/// Create a copy of ShippingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? phoneNumber = null,Object? address1 = null,Object? address2 = null,Object? city = null,Object? state = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address1: null == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String,address2: null == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShippingInfo implements ShippingInfo {
  const _ShippingInfo({required this.fullName, required this.phoneNumber, required this.address1, required this.address2, required this.city, required this.state});
  factory _ShippingInfo.fromJson(Map<String, dynamic> json) => _$ShippingInfoFromJson(json);

@override final  String fullName;
@override final  String phoneNumber;
@override final  String address1;
@override final  String address2;
@override final  String city;
@override final  String state;

/// Create a copy of ShippingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingInfoCopyWith<_ShippingInfo> get copyWith => __$ShippingInfoCopyWithImpl<_ShippingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingInfo&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,address1,address2,city,state);

@override
String toString() {
  return 'ShippingInfo(fullName: $fullName, phoneNumber: $phoneNumber, address1: $address1, address2: $address2, city: $city, state: $state)';
}


}

/// @nodoc
abstract mixin class _$ShippingInfoCopyWith<$Res> implements $ShippingInfoCopyWith<$Res> {
  factory _$ShippingInfoCopyWith(_ShippingInfo value, $Res Function(_ShippingInfo) _then) = __$ShippingInfoCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String phoneNumber, String address1, String address2, String city, String state
});




}
/// @nodoc
class __$ShippingInfoCopyWithImpl<$Res>
    implements _$ShippingInfoCopyWith<$Res> {
  __$ShippingInfoCopyWithImpl(this._self, this._then);

  final _ShippingInfo _self;
  final $Res Function(_ShippingInfo) _then;

/// Create a copy of ShippingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? phoneNumber = null,Object? address1 = null,Object? address2 = null,Object? city = null,Object? state = null,}) {
  return _then(_ShippingInfo(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address1: null == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String,address2: null == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaymentInfo {

 String get type; String get paymentId;
/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentInfoCopyWith<PaymentInfo> get copyWith => _$PaymentInfoCopyWithImpl<PaymentInfo>(this as PaymentInfo, _$identity);

  /// Serializes this PaymentInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentInfo&&(identical(other.type, type) || other.type == type)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,paymentId);

@override
String toString() {
  return 'PaymentInfo(type: $type, paymentId: $paymentId)';
}


}

/// @nodoc
abstract mixin class $PaymentInfoCopyWith<$Res>  {
  factory $PaymentInfoCopyWith(PaymentInfo value, $Res Function(PaymentInfo) _then) = _$PaymentInfoCopyWithImpl;
@useResult
$Res call({
 String type, String paymentId
});




}
/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._self, this._then);

  final PaymentInfo _self;
  final $Res Function(PaymentInfo) _then;

/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? paymentId = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PaymentInfo implements PaymentInfo {
  const _PaymentInfo({required this.type, required this.paymentId});
  factory _PaymentInfo.fromJson(Map<String, dynamic> json) => _$PaymentInfoFromJson(json);

@override final  String type;
@override final  String paymentId;

/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentInfoCopyWith<_PaymentInfo> get copyWith => __$PaymentInfoCopyWithImpl<_PaymentInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentInfo&&(identical(other.type, type) || other.type == type)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,paymentId);

@override
String toString() {
  return 'PaymentInfo(type: $type, paymentId: $paymentId)';
}


}

/// @nodoc
abstract mixin class _$PaymentInfoCopyWith<$Res> implements $PaymentInfoCopyWith<$Res> {
  factory _$PaymentInfoCopyWith(_PaymentInfo value, $Res Function(_PaymentInfo) _then) = __$PaymentInfoCopyWithImpl;
@override @useResult
$Res call({
 String type, String paymentId
});




}
/// @nodoc
class __$PaymentInfoCopyWithImpl<$Res>
    implements _$PaymentInfoCopyWith<$Res> {
  __$PaymentInfoCopyWithImpl(this._self, this._then);

  final _PaymentInfo _self;
  final $Res Function(_PaymentInfo) _then;

/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? paymentId = null,}) {
  return _then(_PaymentInfo(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
