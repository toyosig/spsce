// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesOrderModel {

 String? get id; String? get buyerId; AuthUserModel? get buyer; String? get fullName; String? get phoneNumber; String? get address1; String? get address2; String? get city; String? get state; String? get paymentType; String? get paymentId; String? get paymentStatus; double? get marketplaceFee; double? get total; bool? get dispatch; bool? get deliver; String? get createdAt; List<SalesOrderItemModel>? get items;
/// Create a copy of SalesOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesOrderModelCopyWith<SalesOrderModel> get copyWith => _$SalesOrderModelCopyWithImpl<SalesOrderModel>(this as SalesOrderModel, _$identity);

  /// Serializes this SalesOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.marketplaceFee, marketplaceFee) || other.marketplaceFee == marketplaceFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.dispatch, dispatch) || other.dispatch == dispatch)&&(identical(other.deliver, deliver) || other.deliver == deliver)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyerId,buyer,fullName,phoneNumber,address1,address2,city,state,paymentType,paymentId,paymentStatus,marketplaceFee,total,dispatch,deliver,createdAt,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SalesOrderModel(id: $id, buyerId: $buyerId, buyer: $buyer, fullName: $fullName, phoneNumber: $phoneNumber, address1: $address1, address2: $address2, city: $city, state: $state, paymentType: $paymentType, paymentId: $paymentId, paymentStatus: $paymentStatus, marketplaceFee: $marketplaceFee, total: $total, dispatch: $dispatch, deliver: $deliver, createdAt: $createdAt, items: $items)';
}


}

/// @nodoc
abstract mixin class $SalesOrderModelCopyWith<$Res>  {
  factory $SalesOrderModelCopyWith(SalesOrderModel value, $Res Function(SalesOrderModel) _then) = _$SalesOrderModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? buyerId, AuthUserModel? buyer, String? fullName, String? phoneNumber, String? address1, String? address2, String? city, String? state, String? paymentType, String? paymentId, String? paymentStatus, double? marketplaceFee, double? total, bool? dispatch, bool? deliver, String? createdAt, List<SalesOrderItemModel>? items
});


$AuthUserModelCopyWith<$Res>? get buyer;

}
/// @nodoc
class _$SalesOrderModelCopyWithImpl<$Res>
    implements $SalesOrderModelCopyWith<$Res> {
  _$SalesOrderModelCopyWithImpl(this._self, this._then);

  final SalesOrderModel _self;
  final $Res Function(SalesOrderModel) _then;

/// Create a copy of SalesOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? buyerId = freezed,Object? buyer = freezed,Object? fullName = freezed,Object? phoneNumber = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? city = freezed,Object? state = freezed,Object? paymentType = freezed,Object? paymentId = freezed,Object? paymentStatus = freezed,Object? marketplaceFee = freezed,Object? total = freezed,Object? dispatch = freezed,Object? deliver = freezed,Object? createdAt = freezed,Object? items = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,buyer: freezed == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,marketplaceFee: freezed == marketplaceFee ? _self.marketplaceFee : marketplaceFee // ignore: cast_nullable_to_non_nullable
as double?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,dispatch: freezed == dispatch ? _self.dispatch : dispatch // ignore: cast_nullable_to_non_nullable
as bool?,deliver: freezed == deliver ? _self.deliver : deliver // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SalesOrderItemModel>?,
  ));
}
/// Create a copy of SalesOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get buyer {
    if (_self.buyer == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.buyer!, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SalesOrderModel implements SalesOrderModel {
  const _SalesOrderModel({this.id, this.buyerId, this.buyer, this.fullName, this.phoneNumber, this.address1, this.address2, this.city, this.state, this.paymentType, this.paymentId, this.paymentStatus, this.marketplaceFee, this.total, this.dispatch, this.deliver, this.createdAt, final  List<SalesOrderItemModel>? items}): _items = items;
  factory _SalesOrderModel.fromJson(Map<String, dynamic> json) => _$SalesOrderModelFromJson(json);

@override final  String? id;
@override final  String? buyerId;
@override final  AuthUserModel? buyer;
@override final  String? fullName;
@override final  String? phoneNumber;
@override final  String? address1;
@override final  String? address2;
@override final  String? city;
@override final  String? state;
@override final  String? paymentType;
@override final  String? paymentId;
@override final  String? paymentStatus;
@override final  double? marketplaceFee;
@override final  double? total;
@override final  bool? dispatch;
@override final  bool? deliver;
@override final  String? createdAt;
 final  List<SalesOrderItemModel>? _items;
@override List<SalesOrderItemModel>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SalesOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesOrderModelCopyWith<_SalesOrderModel> get copyWith => __$SalesOrderModelCopyWithImpl<_SalesOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.marketplaceFee, marketplaceFee) || other.marketplaceFee == marketplaceFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.dispatch, dispatch) || other.dispatch == dispatch)&&(identical(other.deliver, deliver) || other.deliver == deliver)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyerId,buyer,fullName,phoneNumber,address1,address2,city,state,paymentType,paymentId,paymentStatus,marketplaceFee,total,dispatch,deliver,createdAt,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SalesOrderModel(id: $id, buyerId: $buyerId, buyer: $buyer, fullName: $fullName, phoneNumber: $phoneNumber, address1: $address1, address2: $address2, city: $city, state: $state, paymentType: $paymentType, paymentId: $paymentId, paymentStatus: $paymentStatus, marketplaceFee: $marketplaceFee, total: $total, dispatch: $dispatch, deliver: $deliver, createdAt: $createdAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SalesOrderModelCopyWith<$Res> implements $SalesOrderModelCopyWith<$Res> {
  factory _$SalesOrderModelCopyWith(_SalesOrderModel value, $Res Function(_SalesOrderModel) _then) = __$SalesOrderModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? buyerId, AuthUserModel? buyer, String? fullName, String? phoneNumber, String? address1, String? address2, String? city, String? state, String? paymentType, String? paymentId, String? paymentStatus, double? marketplaceFee, double? total, bool? dispatch, bool? deliver, String? createdAt, List<SalesOrderItemModel>? items
});


@override $AuthUserModelCopyWith<$Res>? get buyer;

}
/// @nodoc
class __$SalesOrderModelCopyWithImpl<$Res>
    implements _$SalesOrderModelCopyWith<$Res> {
  __$SalesOrderModelCopyWithImpl(this._self, this._then);

  final _SalesOrderModel _self;
  final $Res Function(_SalesOrderModel) _then;

/// Create a copy of SalesOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? buyerId = freezed,Object? buyer = freezed,Object? fullName = freezed,Object? phoneNumber = freezed,Object? address1 = freezed,Object? address2 = freezed,Object? city = freezed,Object? state = freezed,Object? paymentType = freezed,Object? paymentId = freezed,Object? paymentStatus = freezed,Object? marketplaceFee = freezed,Object? total = freezed,Object? dispatch = freezed,Object? deliver = freezed,Object? createdAt = freezed,Object? items = freezed,}) {
  return _then(_SalesOrderModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,buyer: freezed == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,marketplaceFee: freezed == marketplaceFee ? _self.marketplaceFee : marketplaceFee // ignore: cast_nullable_to_non_nullable
as double?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,dispatch: freezed == dispatch ? _self.dispatch : dispatch // ignore: cast_nullable_to_non_nullable
as bool?,deliver: freezed == deliver ? _self.deliver : deliver // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SalesOrderItemModel>?,
  ));
}

/// Create a copy of SalesOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get buyer {
    if (_self.buyer == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.buyer!, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}
}


/// @nodoc
mixin _$SalesOrderItemModel {

 String? get id; String? get productId; int? get quantity; String? get sellerId; String? get sellerUsername; double? get decidedPrice; String? get productTitle; double? get productPrice; String? get conversationId; bool? get isDirect; ProductsData? get product; String? get status;
/// Create a copy of SalesOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesOrderItemModelCopyWith<SalesOrderItemModel> get copyWith => _$SalesOrderItemModelCopyWithImpl<SalesOrderItemModel>(this as SalesOrderItemModel, _$identity);

  /// Serializes this SalesOrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesOrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.sellerUsername, sellerUsername) || other.sellerUsername == sellerUsername)&&(identical(other.decidedPrice, decidedPrice) || other.decidedPrice == decidedPrice)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.isDirect, isDirect) || other.isDirect == isDirect)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,quantity,sellerId,sellerUsername,decidedPrice,productTitle,productPrice,conversationId,isDirect,product,status);

@override
String toString() {
  return 'SalesOrderItemModel(id: $id, productId: $productId, quantity: $quantity, sellerId: $sellerId, sellerUsername: $sellerUsername, decidedPrice: $decidedPrice, productTitle: $productTitle, productPrice: $productPrice, conversationId: $conversationId, isDirect: $isDirect, product: $product, status: $status)';
}


}

/// @nodoc
abstract mixin class $SalesOrderItemModelCopyWith<$Res>  {
  factory $SalesOrderItemModelCopyWith(SalesOrderItemModel value, $Res Function(SalesOrderItemModel) _then) = _$SalesOrderItemModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? productId, int? quantity, String? sellerId, String? sellerUsername, double? decidedPrice, String? productTitle, double? productPrice, String? conversationId, bool? isDirect, ProductsData? product, String? status
});


$ProductsDataCopyWith<$Res>? get product;

}
/// @nodoc
class _$SalesOrderItemModelCopyWithImpl<$Res>
    implements $SalesOrderItemModelCopyWith<$Res> {
  _$SalesOrderItemModelCopyWithImpl(this._self, this._then);

  final SalesOrderItemModel _self;
  final $Res Function(SalesOrderItemModel) _then;

/// Create a copy of SalesOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? productId = freezed,Object? quantity = freezed,Object? sellerId = freezed,Object? sellerUsername = freezed,Object? decidedPrice = freezed,Object? productTitle = freezed,Object? productPrice = freezed,Object? conversationId = freezed,Object? isDirect = freezed,Object? product = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,sellerUsername: freezed == sellerUsername ? _self.sellerUsername : sellerUsername // ignore: cast_nullable_to_non_nullable
as String?,decidedPrice: freezed == decidedPrice ? _self.decidedPrice : decidedPrice // ignore: cast_nullable_to_non_nullable
as double?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,isDirect: freezed == isDirect ? _self.isDirect : isDirect // ignore: cast_nullable_to_non_nullable
as bool?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SalesOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductsDataCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SalesOrderItemModel implements SalesOrderItemModel {
  const _SalesOrderItemModel({this.id, this.productId, this.quantity, this.sellerId, this.sellerUsername, this.decidedPrice, this.productTitle, this.productPrice, this.conversationId, this.isDirect, this.product, this.status});
  factory _SalesOrderItemModel.fromJson(Map<String, dynamic> json) => _$SalesOrderItemModelFromJson(json);

@override final  String? id;
@override final  String? productId;
@override final  int? quantity;
@override final  String? sellerId;
@override final  String? sellerUsername;
@override final  double? decidedPrice;
@override final  String? productTitle;
@override final  double? productPrice;
@override final  String? conversationId;
@override final  bool? isDirect;
@override final  ProductsData? product;
@override final  String? status;

/// Create a copy of SalesOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesOrderItemModelCopyWith<_SalesOrderItemModel> get copyWith => __$SalesOrderItemModelCopyWithImpl<_SalesOrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesOrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesOrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.sellerUsername, sellerUsername) || other.sellerUsername == sellerUsername)&&(identical(other.decidedPrice, decidedPrice) || other.decidedPrice == decidedPrice)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.isDirect, isDirect) || other.isDirect == isDirect)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,quantity,sellerId,sellerUsername,decidedPrice,productTitle,productPrice,conversationId,isDirect,product,status);

@override
String toString() {
  return 'SalesOrderItemModel(id: $id, productId: $productId, quantity: $quantity, sellerId: $sellerId, sellerUsername: $sellerUsername, decidedPrice: $decidedPrice, productTitle: $productTitle, productPrice: $productPrice, conversationId: $conversationId, isDirect: $isDirect, product: $product, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SalesOrderItemModelCopyWith<$Res> implements $SalesOrderItemModelCopyWith<$Res> {
  factory _$SalesOrderItemModelCopyWith(_SalesOrderItemModel value, $Res Function(_SalesOrderItemModel) _then) = __$SalesOrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? productId, int? quantity, String? sellerId, String? sellerUsername, double? decidedPrice, String? productTitle, double? productPrice, String? conversationId, bool? isDirect, ProductsData? product, String? status
});


@override $ProductsDataCopyWith<$Res>? get product;

}
/// @nodoc
class __$SalesOrderItemModelCopyWithImpl<$Res>
    implements _$SalesOrderItemModelCopyWith<$Res> {
  __$SalesOrderItemModelCopyWithImpl(this._self, this._then);

  final _SalesOrderItemModel _self;
  final $Res Function(_SalesOrderItemModel) _then;

/// Create a copy of SalesOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? productId = freezed,Object? quantity = freezed,Object? sellerId = freezed,Object? sellerUsername = freezed,Object? decidedPrice = freezed,Object? productTitle = freezed,Object? productPrice = freezed,Object? conversationId = freezed,Object? isDirect = freezed,Object? product = freezed,Object? status = freezed,}) {
  return _then(_SalesOrderItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,sellerUsername: freezed == sellerUsername ? _self.sellerUsername : sellerUsername // ignore: cast_nullable_to_non_nullable
as String?,decidedPrice: freezed == decidedPrice ? _self.decidedPrice : decidedPrice // ignore: cast_nullable_to_non_nullable
as double?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,isDirect: freezed == isDirect ? _self.isDirect : isDirect // ignore: cast_nullable_to_non_nullable
as bool?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SalesOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductsDataCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
