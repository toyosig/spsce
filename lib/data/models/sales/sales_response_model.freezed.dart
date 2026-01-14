// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesResponseModel {

 String? get message; bool? get success; List<SalesOrderModel>? get orders;
/// Create a copy of SalesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesResponseModelCopyWith<SalesResponseModel> get copyWith => _$SalesResponseModelCopyWithImpl<SalesResponseModel>(this as SalesResponseModel, _$identity);

  /// Serializes this SalesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.orders, orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,const DeepCollectionEquality().hash(orders));

@override
String toString() {
  return 'SalesResponseModel(message: $message, success: $success, orders: $orders)';
}


}

/// @nodoc
abstract mixin class $SalesResponseModelCopyWith<$Res>  {
  factory $SalesResponseModelCopyWith(SalesResponseModel value, $Res Function(SalesResponseModel) _then) = _$SalesResponseModelCopyWithImpl;
@useResult
$Res call({
 String? message, bool? success, List<SalesOrderModel>? orders
});




}
/// @nodoc
class _$SalesResponseModelCopyWithImpl<$Res>
    implements $SalesResponseModelCopyWith<$Res> {
  _$SalesResponseModelCopyWithImpl(this._self, this._then);

  final SalesResponseModel _self;
  final $Res Function(SalesResponseModel) _then;

/// Create a copy of SalesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? success = freezed,Object? orders = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,orders: freezed == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<SalesOrderModel>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SalesResponseModel implements SalesResponseModel {
  const _SalesResponseModel({this.message, this.success, final  List<SalesOrderModel>? orders}): _orders = orders;
  factory _SalesResponseModel.fromJson(Map<String, dynamic> json) => _$SalesResponseModelFromJson(json);

@override final  String? message;
@override final  bool? success;
 final  List<SalesOrderModel>? _orders;
@override List<SalesOrderModel>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SalesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesResponseModelCopyWith<_SalesResponseModel> get copyWith => __$SalesResponseModelCopyWithImpl<_SalesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._orders, _orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'SalesResponseModel(message: $message, success: $success, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$SalesResponseModelCopyWith<$Res> implements $SalesResponseModelCopyWith<$Res> {
  factory _$SalesResponseModelCopyWith(_SalesResponseModel value, $Res Function(_SalesResponseModel) _then) = __$SalesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? message, bool? success, List<SalesOrderModel>? orders
});




}
/// @nodoc
class __$SalesResponseModelCopyWithImpl<$Res>
    implements _$SalesResponseModelCopyWith<$Res> {
  __$SalesResponseModelCopyWithImpl(this._self, this._then);

  final _SalesResponseModel _self;
  final $Res Function(_SalesResponseModel) _then;

/// Create a copy of SalesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? success = freezed,Object? orders = freezed,}) {
  return _then(_SalesResponseModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<SalesOrderModel>?,
  ));
}


}

// dart format on
