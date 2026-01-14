// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_order_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CancelOrderResponseModel {

 String? get message; bool? get success; String? get error;
/// Create a copy of CancelOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelOrderResponseModelCopyWith<CancelOrderResponseModel> get copyWith => _$CancelOrderResponseModelCopyWithImpl<CancelOrderResponseModel>(this as CancelOrderResponseModel, _$identity);

  /// Serializes this CancelOrderResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,error);

@override
String toString() {
  return 'CancelOrderResponseModel(message: $message, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class $CancelOrderResponseModelCopyWith<$Res>  {
  factory $CancelOrderResponseModelCopyWith(CancelOrderResponseModel value, $Res Function(CancelOrderResponseModel) _then) = _$CancelOrderResponseModelCopyWithImpl;
@useResult
$Res call({
 String? message, bool? success, String? error
});




}
/// @nodoc
class _$CancelOrderResponseModelCopyWithImpl<$Res>
    implements $CancelOrderResponseModelCopyWith<$Res> {
  _$CancelOrderResponseModelCopyWithImpl(this._self, this._then);

  final CancelOrderResponseModel _self;
  final $Res Function(CancelOrderResponseModel) _then;

/// Create a copy of CancelOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? success = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CancelOrderResponseModel implements CancelOrderResponseModel {
  const _CancelOrderResponseModel({this.message, this.success, this.error});
  factory _CancelOrderResponseModel.fromJson(Map<String, dynamic> json) => _$CancelOrderResponseModelFromJson(json);

@override final  String? message;
@override final  bool? success;
@override final  String? error;

/// Create a copy of CancelOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelOrderResponseModelCopyWith<_CancelOrderResponseModel> get copyWith => __$CancelOrderResponseModelCopyWithImpl<_CancelOrderResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CancelOrderResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOrderResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,error);

@override
String toString() {
  return 'CancelOrderResponseModel(message: $message, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CancelOrderResponseModelCopyWith<$Res> implements $CancelOrderResponseModelCopyWith<$Res> {
  factory _$CancelOrderResponseModelCopyWith(_CancelOrderResponseModel value, $Res Function(_CancelOrderResponseModel) _then) = __$CancelOrderResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? message, bool? success, String? error
});




}
/// @nodoc
class __$CancelOrderResponseModelCopyWithImpl<$Res>
    implements _$CancelOrderResponseModelCopyWith<$Res> {
  __$CancelOrderResponseModelCopyWithImpl(this._self, this._then);

  final _CancelOrderResponseModel _self;
  final $Res Function(_CancelOrderResponseModel) _then;

/// Create a copy of CancelOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? success = freezed,Object? error = freezed,}) {
  return _then(_CancelOrderResponseModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
