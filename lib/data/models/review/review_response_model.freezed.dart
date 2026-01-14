// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewResponseModel {

 int? get statusCode; String? get message; ReviewDataModel? get data; String? get error;
/// Create a copy of ReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewResponseModelCopyWith<ReviewResponseModel> get copyWith => _$ReviewResponseModelCopyWithImpl<ReviewResponseModel>(this as ReviewResponseModel, _$identity);

  /// Serializes this ReviewResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,data,error);

@override
String toString() {
  return 'ReviewResponseModel(statusCode: $statusCode, message: $message, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $ReviewResponseModelCopyWith<$Res>  {
  factory $ReviewResponseModelCopyWith(ReviewResponseModel value, $Res Function(ReviewResponseModel) _then) = _$ReviewResponseModelCopyWithImpl;
@useResult
$Res call({
 int? statusCode, String? message, ReviewDataModel? data, String? error
});


$ReviewDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$ReviewResponseModelCopyWithImpl<$Res>
    implements $ReviewResponseModelCopyWith<$Res> {
  _$ReviewResponseModelCopyWithImpl(this._self, this._then);

  final ReviewResponseModel _self;
  final $Res Function(ReviewResponseModel) _then;

/// Create a copy of ReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ReviewDataModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ReviewDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ReviewResponseModel implements ReviewResponseModel {
  const _ReviewResponseModel({this.statusCode, this.message, this.data, this.error});
  factory _ReviewResponseModel.fromJson(Map<String, dynamic> json) => _$ReviewResponseModelFromJson(json);

@override final  int? statusCode;
@override final  String? message;
@override final  ReviewDataModel? data;
@override final  String? error;

/// Create a copy of ReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewResponseModelCopyWith<_ReviewResponseModel> get copyWith => __$ReviewResponseModelCopyWithImpl<_ReviewResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,data,error);

@override
String toString() {
  return 'ReviewResponseModel(statusCode: $statusCode, message: $message, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ReviewResponseModelCopyWith<$Res> implements $ReviewResponseModelCopyWith<$Res> {
  factory _$ReviewResponseModelCopyWith(_ReviewResponseModel value, $Res Function(_ReviewResponseModel) _then) = __$ReviewResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, String? message, ReviewDataModel? data, String? error
});


@override $ReviewDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$ReviewResponseModelCopyWithImpl<$Res>
    implements _$ReviewResponseModelCopyWith<$Res> {
  __$ReviewResponseModelCopyWithImpl(this._self, this._then);

  final _ReviewResponseModel _self;
  final $Res Function(_ReviewResponseModel) _then;

/// Create a copy of ReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,Object? error = freezed,}) {
  return _then(_ReviewResponseModel(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ReviewDataModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ReviewDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
