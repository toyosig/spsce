// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_users_review_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersReviewResponseModel {

 int? get statusCode; String? get message; UsersReviewData? get data;
/// Create a copy of UsersReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersReviewResponseModelCopyWith<UsersReviewResponseModel> get copyWith => _$UsersReviewResponseModelCopyWithImpl<UsersReviewResponseModel>(this as UsersReviewResponseModel, _$identity);

  /// Serializes this UsersReviewResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersReviewResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,data);

@override
String toString() {
  return 'UsersReviewResponseModel(statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $UsersReviewResponseModelCopyWith<$Res>  {
  factory $UsersReviewResponseModelCopyWith(UsersReviewResponseModel value, $Res Function(UsersReviewResponseModel) _then) = _$UsersReviewResponseModelCopyWithImpl;
@useResult
$Res call({
 int? statusCode, String? message, UsersReviewData? data
});


$UsersReviewDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$UsersReviewResponseModelCopyWithImpl<$Res>
    implements $UsersReviewResponseModelCopyWith<$Res> {
  _$UsersReviewResponseModelCopyWithImpl(this._self, this._then);

  final UsersReviewResponseModel _self;
  final $Res Function(UsersReviewResponseModel) _then;

/// Create a copy of UsersReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UsersReviewData?,
  ));
}
/// Create a copy of UsersReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsersReviewDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UsersReviewDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UsersReviewResponseModel implements UsersReviewResponseModel {
  const _UsersReviewResponseModel({this.statusCode, this.message, this.data});
  factory _UsersReviewResponseModel.fromJson(Map<String, dynamic> json) => _$UsersReviewResponseModelFromJson(json);

@override final  int? statusCode;
@override final  String? message;
@override final  UsersReviewData? data;

/// Create a copy of UsersReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersReviewResponseModelCopyWith<_UsersReviewResponseModel> get copyWith => __$UsersReviewResponseModelCopyWithImpl<_UsersReviewResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersReviewResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersReviewResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,data);

@override
String toString() {
  return 'UsersReviewResponseModel(statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$UsersReviewResponseModelCopyWith<$Res> implements $UsersReviewResponseModelCopyWith<$Res> {
  factory _$UsersReviewResponseModelCopyWith(_UsersReviewResponseModel value, $Res Function(_UsersReviewResponseModel) _then) = __$UsersReviewResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, String? message, UsersReviewData? data
});


@override $UsersReviewDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$UsersReviewResponseModelCopyWithImpl<$Res>
    implements _$UsersReviewResponseModelCopyWith<$Res> {
  __$UsersReviewResponseModelCopyWithImpl(this._self, this._then);

  final _UsersReviewResponseModel _self;
  final $Res Function(_UsersReviewResponseModel) _then;

/// Create a copy of UsersReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_UsersReviewResponseModel(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UsersReviewData?,
  ));
}

/// Create a copy of UsersReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsersReviewDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UsersReviewDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
