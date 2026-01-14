// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_order_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfirmOrderRequestModel {

 String get paymentType; String get paymentId; String get paymentStatus; double get marketplaceFee; double get decidedPrice; double get total; List<ProductsData> get items; ShippingInfo get shippingInfo;
/// Create a copy of ConfirmOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmOrderRequestModelCopyWith<ConfirmOrderRequestModel> get copyWith => _$ConfirmOrderRequestModelCopyWithImpl<ConfirmOrderRequestModel>(this as ConfirmOrderRequestModel, _$identity);

  /// Serializes this ConfirmOrderRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmOrderRequestModel&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.marketplaceFee, marketplaceFee) || other.marketplaceFee == marketplaceFee)&&(identical(other.decidedPrice, decidedPrice) || other.decidedPrice == decidedPrice)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.shippingInfo, shippingInfo) || other.shippingInfo == shippingInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentType,paymentId,paymentStatus,marketplaceFee,decidedPrice,total,const DeepCollectionEquality().hash(items),shippingInfo);

@override
String toString() {
  return 'ConfirmOrderRequestModel(paymentType: $paymentType, paymentId: $paymentId, paymentStatus: $paymentStatus, marketplaceFee: $marketplaceFee, decidedPrice: $decidedPrice, total: $total, items: $items, shippingInfo: $shippingInfo)';
}


}

/// @nodoc
abstract mixin class $ConfirmOrderRequestModelCopyWith<$Res>  {
  factory $ConfirmOrderRequestModelCopyWith(ConfirmOrderRequestModel value, $Res Function(ConfirmOrderRequestModel) _then) = _$ConfirmOrderRequestModelCopyWithImpl;
@useResult
$Res call({
 String paymentType, String paymentId, String paymentStatus, double marketplaceFee, double decidedPrice, double total, List<ProductsData> items, ShippingInfo shippingInfo
});


$ShippingInfoCopyWith<$Res> get shippingInfo;

}
/// @nodoc
class _$ConfirmOrderRequestModelCopyWithImpl<$Res>
    implements $ConfirmOrderRequestModelCopyWith<$Res> {
  _$ConfirmOrderRequestModelCopyWithImpl(this._self, this._then);

  final ConfirmOrderRequestModel _self;
  final $Res Function(ConfirmOrderRequestModel) _then;

/// Create a copy of ConfirmOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentType = null,Object? paymentId = null,Object? paymentStatus = null,Object? marketplaceFee = null,Object? decidedPrice = null,Object? total = null,Object? items = null,Object? shippingInfo = null,}) {
  return _then(_self.copyWith(
paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,marketplaceFee: null == marketplaceFee ? _self.marketplaceFee : marketplaceFee // ignore: cast_nullable_to_non_nullable
as double,decidedPrice: null == decidedPrice ? _self.decidedPrice : decidedPrice // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductsData>,shippingInfo: null == shippingInfo ? _self.shippingInfo : shippingInfo // ignore: cast_nullable_to_non_nullable
as ShippingInfo,
  ));
}
/// Create a copy of ConfirmOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingInfoCopyWith<$Res> get shippingInfo {
  
  return $ShippingInfoCopyWith<$Res>(_self.shippingInfo, (value) {
    return _then(_self.copyWith(shippingInfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ConfirmOrderRequestModel implements ConfirmOrderRequestModel {
  const _ConfirmOrderRequestModel({required this.paymentType, required this.paymentId, required this.paymentStatus, required this.marketplaceFee, required this.decidedPrice, required this.total, required final  List<ProductsData> items, required this.shippingInfo}): _items = items;
  factory _ConfirmOrderRequestModel.fromJson(Map<String, dynamic> json) => _$ConfirmOrderRequestModelFromJson(json);

@override final  String paymentType;
@override final  String paymentId;
@override final  String paymentStatus;
@override final  double marketplaceFee;
@override final  double decidedPrice;
@override final  double total;
 final  List<ProductsData> _items;
@override List<ProductsData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ShippingInfo shippingInfo;

/// Create a copy of ConfirmOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmOrderRequestModelCopyWith<_ConfirmOrderRequestModel> get copyWith => __$ConfirmOrderRequestModelCopyWithImpl<_ConfirmOrderRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmOrderRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmOrderRequestModel&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.marketplaceFee, marketplaceFee) || other.marketplaceFee == marketplaceFee)&&(identical(other.decidedPrice, decidedPrice) || other.decidedPrice == decidedPrice)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.shippingInfo, shippingInfo) || other.shippingInfo == shippingInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentType,paymentId,paymentStatus,marketplaceFee,decidedPrice,total,const DeepCollectionEquality().hash(_items),shippingInfo);

@override
String toString() {
  return 'ConfirmOrderRequestModel(paymentType: $paymentType, paymentId: $paymentId, paymentStatus: $paymentStatus, marketplaceFee: $marketplaceFee, decidedPrice: $decidedPrice, total: $total, items: $items, shippingInfo: $shippingInfo)';
}


}

/// @nodoc
abstract mixin class _$ConfirmOrderRequestModelCopyWith<$Res> implements $ConfirmOrderRequestModelCopyWith<$Res> {
  factory _$ConfirmOrderRequestModelCopyWith(_ConfirmOrderRequestModel value, $Res Function(_ConfirmOrderRequestModel) _then) = __$ConfirmOrderRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String paymentType, String paymentId, String paymentStatus, double marketplaceFee, double decidedPrice, double total, List<ProductsData> items, ShippingInfo shippingInfo
});


@override $ShippingInfoCopyWith<$Res> get shippingInfo;

}
/// @nodoc
class __$ConfirmOrderRequestModelCopyWithImpl<$Res>
    implements _$ConfirmOrderRequestModelCopyWith<$Res> {
  __$ConfirmOrderRequestModelCopyWithImpl(this._self, this._then);

  final _ConfirmOrderRequestModel _self;
  final $Res Function(_ConfirmOrderRequestModel) _then;

/// Create a copy of ConfirmOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentType = null,Object? paymentId = null,Object? paymentStatus = null,Object? marketplaceFee = null,Object? decidedPrice = null,Object? total = null,Object? items = null,Object? shippingInfo = null,}) {
  return _then(_ConfirmOrderRequestModel(
paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,marketplaceFee: null == marketplaceFee ? _self.marketplaceFee : marketplaceFee // ignore: cast_nullable_to_non_nullable
as double,decidedPrice: null == decidedPrice ? _self.decidedPrice : decidedPrice // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductsData>,shippingInfo: null == shippingInfo ? _self.shippingInfo : shippingInfo // ignore: cast_nullable_to_non_nullable
as ShippingInfo,
  ));
}

/// Create a copy of ConfirmOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingInfoCopyWith<$Res> get shippingInfo {
  
  return $ShippingInfoCopyWith<$Res>(_self.shippingInfo, (value) {
    return _then(_self.copyWith(shippingInfo: value));
  });
}
}

// dart format on
