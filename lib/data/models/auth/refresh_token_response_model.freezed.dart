// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshTokenResponseModel {

@JsonKey(name: 'statusCode') int? get statusCode;@JsonKey(name: 'success') bool? get success;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'access_token') String? get accessToken;@JsonKey(name: 'refresh_token') String? get refreshToken;@JsonKey(name: 'expires_in') int? get expiresIn;@JsonKey(name: 'error') String? get error;
/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenResponseModelCopyWith<RefreshTokenResponseModel> get copyWith => _$RefreshTokenResponseModelCopyWithImpl<RefreshTokenResponseModel>(this as RefreshTokenResponseModel, _$identity);

  /// Serializes this RefreshTokenResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message,accessToken,refreshToken,expiresIn,error);

@override
String toString() {
  return 'RefreshTokenResponseModel(statusCode: $statusCode, success: $success, message: $message, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, error: $error)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenResponseModelCopyWith<$Res>  {
  factory $RefreshTokenResponseModelCopyWith(RefreshTokenResponseModel value, $Res Function(RefreshTokenResponseModel) _then) = _$RefreshTokenResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'success') bool? success,@JsonKey(name: 'message') String? message,@JsonKey(name: 'access_token') String? accessToken,@JsonKey(name: 'refresh_token') String? refreshToken,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'error') String? error
});




}
/// @nodoc
class _$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  _$RefreshTokenResponseModelCopyWithImpl(this._self, this._then);

  final RefreshTokenResponseModel _self;
  final $Res Function(RefreshTokenResponseModel) _then;

/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? success = freezed,Object? message = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresIn = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RefreshTokenResponseModel implements RefreshTokenResponseModel {
  const _RefreshTokenResponseModel({@JsonKey(name: 'statusCode') this.statusCode, @JsonKey(name: 'success') this.success, @JsonKey(name: 'message') this.message, @JsonKey(name: 'access_token') this.accessToken, @JsonKey(name: 'refresh_token') this.refreshToken, @JsonKey(name: 'expires_in') this.expiresIn, @JsonKey(name: 'error') this.error});
  factory _RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseModelFromJson(json);

@override@JsonKey(name: 'statusCode') final  int? statusCode;
@override@JsonKey(name: 'success') final  bool? success;
@override@JsonKey(name: 'message') final  String? message;
@override@JsonKey(name: 'access_token') final  String? accessToken;
@override@JsonKey(name: 'refresh_token') final  String? refreshToken;
@override@JsonKey(name: 'expires_in') final  int? expiresIn;
@override@JsonKey(name: 'error') final  String? error;

/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenResponseModelCopyWith<_RefreshTokenResponseModel> get copyWith => __$RefreshTokenResponseModelCopyWithImpl<_RefreshTokenResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message,accessToken,refreshToken,expiresIn,error);

@override
String toString() {
  return 'RefreshTokenResponseModel(statusCode: $statusCode, success: $success, message: $message, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenResponseModelCopyWith<$Res> implements $RefreshTokenResponseModelCopyWith<$Res> {
  factory _$RefreshTokenResponseModelCopyWith(_RefreshTokenResponseModel value, $Res Function(_RefreshTokenResponseModel) _then) = __$RefreshTokenResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'success') bool? success,@JsonKey(name: 'message') String? message,@JsonKey(name: 'access_token') String? accessToken,@JsonKey(name: 'refresh_token') String? refreshToken,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'error') String? error
});




}
/// @nodoc
class __$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements _$RefreshTokenResponseModelCopyWith<$Res> {
  __$RefreshTokenResponseModelCopyWithImpl(this._self, this._then);

  final _RefreshTokenResponseModel _self;
  final $Res Function(_RefreshTokenResponseModel) _then;

/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? success = freezed,Object? message = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresIn = freezed,Object? error = freezed,}) {
  return _then(_RefreshTokenResponseModel(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
