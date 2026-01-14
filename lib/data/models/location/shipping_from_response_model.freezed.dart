// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_from_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShippingFromResponseModel {

 bool? get success; String? get message; List<ShippingFromModel>? get data;
/// Create a copy of ShippingFromResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingFromResponseModelCopyWith<ShippingFromResponseModel> get copyWith => _$ShippingFromResponseModelCopyWithImpl<ShippingFromResponseModel>(this as ShippingFromResponseModel, _$identity);

  /// Serializes this ShippingFromResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingFromResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ShippingFromResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ShippingFromResponseModelCopyWith<$Res>  {
  factory $ShippingFromResponseModelCopyWith(ShippingFromResponseModel value, $Res Function(ShippingFromResponseModel) _then) = _$ShippingFromResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<ShippingFromModel>? data
});




}
/// @nodoc
class _$ShippingFromResponseModelCopyWithImpl<$Res>
    implements $ShippingFromResponseModelCopyWith<$Res> {
  _$ShippingFromResponseModelCopyWithImpl(this._self, this._then);

  final ShippingFromResponseModel _self;
  final $Res Function(ShippingFromResponseModel) _then;

/// Create a copy of ShippingFromResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ShippingFromModel>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShippingFromResponseModel implements ShippingFromResponseModel {
  const _ShippingFromResponseModel({this.success, this.message, final  List<ShippingFromModel>? data}): _data = data;
  factory _ShippingFromResponseModel.fromJson(Map<String, dynamic> json) => _$ShippingFromResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<ShippingFromModel>? _data;
@override List<ShippingFromModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ShippingFromResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingFromResponseModelCopyWith<_ShippingFromResponseModel> get copyWith => __$ShippingFromResponseModelCopyWithImpl<_ShippingFromResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingFromResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingFromResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ShippingFromResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ShippingFromResponseModelCopyWith<$Res> implements $ShippingFromResponseModelCopyWith<$Res> {
  factory _$ShippingFromResponseModelCopyWith(_ShippingFromResponseModel value, $Res Function(_ShippingFromResponseModel) _then) = __$ShippingFromResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<ShippingFromModel>? data
});




}
/// @nodoc
class __$ShippingFromResponseModelCopyWithImpl<$Res>
    implements _$ShippingFromResponseModelCopyWith<$Res> {
  __$ShippingFromResponseModelCopyWithImpl(this._self, this._then);

  final _ShippingFromResponseModel _self;
  final $Res Function(_ShippingFromResponseModel) _then;

/// Create a copy of ShippingFromResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ShippingFromResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ShippingFromModel>?,
  ));
}


}

// dart format on
