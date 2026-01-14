// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_brand_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddBrandResponseModel {

 bool? get success; String? get error; String? get message; BrandModel? get data;
/// Create a copy of AddBrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddBrandResponseModelCopyWith<AddBrandResponseModel> get copyWith => _$AddBrandResponseModelCopyWithImpl<AddBrandResponseModel>(this as AddBrandResponseModel, _$identity);

  /// Serializes this AddBrandResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddBrandResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,error,message,data);

@override
String toString() {
  return 'AddBrandResponseModel(success: $success, error: $error, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $AddBrandResponseModelCopyWith<$Res>  {
  factory $AddBrandResponseModelCopyWith(AddBrandResponseModel value, $Res Function(AddBrandResponseModel) _then) = _$AddBrandResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? error, String? message, BrandModel? data
});


$BrandModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$AddBrandResponseModelCopyWithImpl<$Res>
    implements $AddBrandResponseModelCopyWith<$Res> {
  _$AddBrandResponseModelCopyWithImpl(this._self, this._then);

  final AddBrandResponseModel _self;
  final $Res Function(AddBrandResponseModel) _then;

/// Create a copy of AddBrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? error = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BrandModel?,
  ));
}
/// Create a copy of AddBrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AddBrandResponseModel implements AddBrandResponseModel {
  const _AddBrandResponseModel({this.success, this.error, this.message, this.data});
  factory _AddBrandResponseModel.fromJson(Map<String, dynamic> json) => _$AddBrandResponseModelFromJson(json);

@override final  bool? success;
@override final  String? error;
@override final  String? message;
@override final  BrandModel? data;

/// Create a copy of AddBrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddBrandResponseModelCopyWith<_AddBrandResponseModel> get copyWith => __$AddBrandResponseModelCopyWithImpl<_AddBrandResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddBrandResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddBrandResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,error,message,data);

@override
String toString() {
  return 'AddBrandResponseModel(success: $success, error: $error, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AddBrandResponseModelCopyWith<$Res> implements $AddBrandResponseModelCopyWith<$Res> {
  factory _$AddBrandResponseModelCopyWith(_AddBrandResponseModel value, $Res Function(_AddBrandResponseModel) _then) = __$AddBrandResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? error, String? message, BrandModel? data
});


@override $BrandModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$AddBrandResponseModelCopyWithImpl<$Res>
    implements _$AddBrandResponseModelCopyWith<$Res> {
  __$AddBrandResponseModelCopyWithImpl(this._self, this._then);

  final _AddBrandResponseModel _self;
  final $Res Function(_AddBrandResponseModel) _then;

/// Create a copy of AddBrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? error = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_AddBrandResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BrandModel?,
  ));
}

/// Create a copy of AddBrandResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
