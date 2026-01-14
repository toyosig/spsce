// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brands_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrandResponseModel {

 bool? get success; String? get message; List<BrandModel>? get data;
/// Create a copy of BrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandResponseModelCopyWith<BrandResponseModel> get copyWith => _$BrandResponseModelCopyWithImpl<BrandResponseModel>(this as BrandResponseModel, _$identity);

  /// Serializes this BrandResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BrandResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $BrandResponseModelCopyWith<$Res>  {
  factory $BrandResponseModelCopyWith(BrandResponseModel value, $Res Function(BrandResponseModel) _then) = _$BrandResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<BrandModel>? data
});




}
/// @nodoc
class _$BrandResponseModelCopyWithImpl<$Res>
    implements $BrandResponseModelCopyWith<$Res> {
  _$BrandResponseModelCopyWithImpl(this._self, this._then);

  final BrandResponseModel _self;
  final $Res Function(BrandResponseModel) _then;

/// Create a copy of BrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<BrandModel>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BrandResponseModel implements BrandResponseModel {
  const _BrandResponseModel({this.success, this.message, final  List<BrandModel>? data}): _data = data;
  factory _BrandResponseModel.fromJson(Map<String, dynamic> json) => _$BrandResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<BrandModel>? _data;
@override List<BrandModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandResponseModelCopyWith<_BrandResponseModel> get copyWith => __$BrandResponseModelCopyWithImpl<_BrandResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'BrandResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BrandResponseModelCopyWith<$Res> implements $BrandResponseModelCopyWith<$Res> {
  factory _$BrandResponseModelCopyWith(_BrandResponseModel value, $Res Function(_BrandResponseModel) _then) = __$BrandResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<BrandModel>? data
});




}
/// @nodoc
class __$BrandResponseModelCopyWithImpl<$Res>
    implements _$BrandResponseModelCopyWith<$Res> {
  __$BrandResponseModelCopyWithImpl(this._self, this._then);

  final _BrandResponseModel _self;
  final $Res Function(_BrandResponseModel) _then;

/// Create a copy of BrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_BrandResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<BrandModel>?,
  ));
}


}

// dart format on
