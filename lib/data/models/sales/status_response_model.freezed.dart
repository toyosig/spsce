// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusResponseModel {

 String? get message; bool? get success;
/// Create a copy of StatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusResponseModelCopyWith<StatusResponseModel> get copyWith => _$StatusResponseModelCopyWithImpl<StatusResponseModel>(this as StatusResponseModel, _$identity);

  /// Serializes this StatusResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'StatusResponseModel(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class $StatusResponseModelCopyWith<$Res>  {
  factory $StatusResponseModelCopyWith(StatusResponseModel value, $Res Function(StatusResponseModel) _then) = _$StatusResponseModelCopyWithImpl;
@useResult
$Res call({
 String? message, bool? success
});




}
/// @nodoc
class _$StatusResponseModelCopyWithImpl<$Res>
    implements $StatusResponseModelCopyWith<$Res> {
  _$StatusResponseModelCopyWithImpl(this._self, this._then);

  final StatusResponseModel _self;
  final $Res Function(StatusResponseModel) _then;

/// Create a copy of StatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? success = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StatusResponseModel implements StatusResponseModel {
  const _StatusResponseModel({this.message, this.success});
  factory _StatusResponseModel.fromJson(Map<String, dynamic> json) => _$StatusResponseModelFromJson(json);

@override final  String? message;
@override final  bool? success;

/// Create a copy of StatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusResponseModelCopyWith<_StatusResponseModel> get copyWith => __$StatusResponseModelCopyWithImpl<_StatusResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'StatusResponseModel(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class _$StatusResponseModelCopyWith<$Res> implements $StatusResponseModelCopyWith<$Res> {
  factory _$StatusResponseModelCopyWith(_StatusResponseModel value, $Res Function(_StatusResponseModel) _then) = __$StatusResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? message, bool? success
});




}
/// @nodoc
class __$StatusResponseModelCopyWithImpl<$Res>
    implements _$StatusResponseModelCopyWith<$Res> {
  __$StatusResponseModelCopyWithImpl(this._self, this._then);

  final _StatusResponseModel _self;
  final $Res Function(_StatusResponseModel) _then;

/// Create a copy of StatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? success = freezed,}) {
  return _then(_StatusResponseModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
