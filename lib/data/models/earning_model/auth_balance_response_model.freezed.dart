// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_balance_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthBalanceResponseModel {

 int? get statusCode; bool? get success; String? get message; String? get error; BalanceDataModel? get data;
/// Create a copy of AuthBalanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthBalanceResponseModelCopyWith<AuthBalanceResponseModel> get copyWith => _$AuthBalanceResponseModelCopyWithImpl<AuthBalanceResponseModel>(this as AuthBalanceResponseModel, _$identity);

  /// Serializes this AuthBalanceResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBalanceResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message,error,data);

@override
String toString() {
  return 'AuthBalanceResponseModel(statusCode: $statusCode, success: $success, message: $message, error: $error, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthBalanceResponseModelCopyWith<$Res>  {
  factory $AuthBalanceResponseModelCopyWith(AuthBalanceResponseModel value, $Res Function(AuthBalanceResponseModel) _then) = _$AuthBalanceResponseModelCopyWithImpl;
@useResult
$Res call({
 int? statusCode, bool? success, String? message, String? error, BalanceDataModel? data
});


$BalanceDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$AuthBalanceResponseModelCopyWithImpl<$Res>
    implements $AuthBalanceResponseModelCopyWith<$Res> {
  _$AuthBalanceResponseModelCopyWithImpl(this._self, this._then);

  final AuthBalanceResponseModel _self;
  final $Res Function(AuthBalanceResponseModel) _then;

/// Create a copy of AuthBalanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? success = freezed,Object? message = freezed,Object? error = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BalanceDataModel?,
  ));
}
/// Create a copy of AuthBalanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BalanceDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AuthBalanceResponseModel implements AuthBalanceResponseModel {
  const _AuthBalanceResponseModel({this.statusCode, this.success, this.message, this.error, this.data});
  factory _AuthBalanceResponseModel.fromJson(Map<String, dynamic> json) => _$AuthBalanceResponseModelFromJson(json);

@override final  int? statusCode;
@override final  bool? success;
@override final  String? message;
@override final  String? error;
@override final  BalanceDataModel? data;

/// Create a copy of AuthBalanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthBalanceResponseModelCopyWith<_AuthBalanceResponseModel> get copyWith => __$AuthBalanceResponseModelCopyWithImpl<_AuthBalanceResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthBalanceResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthBalanceResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message,error,data);

@override
String toString() {
  return 'AuthBalanceResponseModel(statusCode: $statusCode, success: $success, message: $message, error: $error, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthBalanceResponseModelCopyWith<$Res> implements $AuthBalanceResponseModelCopyWith<$Res> {
  factory _$AuthBalanceResponseModelCopyWith(_AuthBalanceResponseModel value, $Res Function(_AuthBalanceResponseModel) _then) = __$AuthBalanceResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, bool? success, String? message, String? error, BalanceDataModel? data
});


@override $BalanceDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$AuthBalanceResponseModelCopyWithImpl<$Res>
    implements _$AuthBalanceResponseModelCopyWith<$Res> {
  __$AuthBalanceResponseModelCopyWithImpl(this._self, this._then);

  final _AuthBalanceResponseModel _self;
  final $Res Function(_AuthBalanceResponseModel) _then;

/// Create a copy of AuthBalanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? success = freezed,Object? message = freezed,Object? error = freezed,Object? data = freezed,}) {
  return _then(_AuthBalanceResponseModel(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BalanceDataModel?,
  ));
}

/// Create a copy of AuthBalanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BalanceDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
