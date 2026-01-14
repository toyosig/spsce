// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retry_order_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RetryOrderResponseModel {

 String? get message; String? get error; bool? get success; String? get reference; double? get amount;
/// Create a copy of RetryOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetryOrderResponseModelCopyWith<RetryOrderResponseModel> get copyWith => _$RetryOrderResponseModelCopyWithImpl<RetryOrderResponseModel>(this as RetryOrderResponseModel, _$identity);

  /// Serializes this RetryOrderResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetryOrderResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,error,success,reference,amount);

@override
String toString() {
  return 'RetryOrderResponseModel(message: $message, error: $error, success: $success, reference: $reference, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $RetryOrderResponseModelCopyWith<$Res>  {
  factory $RetryOrderResponseModelCopyWith(RetryOrderResponseModel value, $Res Function(RetryOrderResponseModel) _then) = _$RetryOrderResponseModelCopyWithImpl;
@useResult
$Res call({
 String? message, String? error, bool? success, String? reference, double? amount
});




}
/// @nodoc
class _$RetryOrderResponseModelCopyWithImpl<$Res>
    implements $RetryOrderResponseModelCopyWith<$Res> {
  _$RetryOrderResponseModelCopyWithImpl(this._self, this._then);

  final RetryOrderResponseModel _self;
  final $Res Function(RetryOrderResponseModel) _then;

/// Create a copy of RetryOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? error = freezed,Object? success = freezed,Object? reference = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RetryOrderResponseModel implements RetryOrderResponseModel {
  const _RetryOrderResponseModel({this.message, this.error, this.success, this.reference, this.amount});
  factory _RetryOrderResponseModel.fromJson(Map<String, dynamic> json) => _$RetryOrderResponseModelFromJson(json);

@override final  String? message;
@override final  String? error;
@override final  bool? success;
@override final  String? reference;
@override final  double? amount;

/// Create a copy of RetryOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetryOrderResponseModelCopyWith<_RetryOrderResponseModel> get copyWith => __$RetryOrderResponseModelCopyWithImpl<_RetryOrderResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RetryOrderResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryOrderResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,error,success,reference,amount);

@override
String toString() {
  return 'RetryOrderResponseModel(message: $message, error: $error, success: $success, reference: $reference, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$RetryOrderResponseModelCopyWith<$Res> implements $RetryOrderResponseModelCopyWith<$Res> {
  factory _$RetryOrderResponseModelCopyWith(_RetryOrderResponseModel value, $Res Function(_RetryOrderResponseModel) _then) = __$RetryOrderResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? error, bool? success, String? reference, double? amount
});




}
/// @nodoc
class __$RetryOrderResponseModelCopyWithImpl<$Res>
    implements _$RetryOrderResponseModelCopyWith<$Res> {
  __$RetryOrderResponseModelCopyWithImpl(this._self, this._then);

  final _RetryOrderResponseModel _self;
  final $Res Function(_RetryOrderResponseModel) _then;

/// Create a copy of RetryOrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? error = freezed,Object? success = freezed,Object? reference = freezed,Object? amount = freezed,}) {
  return _then(_RetryOrderResponseModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
