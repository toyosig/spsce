// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_toggle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowToggleModel {

 int get statusCode; bool get success; String get message;
/// Create a copy of FollowToggleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowToggleModelCopyWith<FollowToggleModel> get copyWith => _$FollowToggleModelCopyWithImpl<FollowToggleModel>(this as FollowToggleModel, _$identity);

  /// Serializes this FollowToggleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowToggleModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message);

@override
String toString() {
  return 'FollowToggleModel(statusCode: $statusCode, success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $FollowToggleModelCopyWith<$Res>  {
  factory $FollowToggleModelCopyWith(FollowToggleModel value, $Res Function(FollowToggleModel) _then) = _$FollowToggleModelCopyWithImpl;
@useResult
$Res call({
 int statusCode, bool success, String message
});




}
/// @nodoc
class _$FollowToggleModelCopyWithImpl<$Res>
    implements $FollowToggleModelCopyWith<$Res> {
  _$FollowToggleModelCopyWithImpl(this._self, this._then);

  final FollowToggleModel _self;
  final $Res Function(FollowToggleModel) _then;

/// Create a copy of FollowToggleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FollowToggleModel implements FollowToggleModel {
  const _FollowToggleModel({required this.statusCode, required this.success, required this.message});
  factory _FollowToggleModel.fromJson(Map<String, dynamic> json) => _$FollowToggleModelFromJson(json);

@override final  int statusCode;
@override final  bool success;
@override final  String message;

/// Create a copy of FollowToggleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowToggleModelCopyWith<_FollowToggleModel> get copyWith => __$FollowToggleModelCopyWithImpl<_FollowToggleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowToggleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowToggleModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,success,message);

@override
String toString() {
  return 'FollowToggleModel(statusCode: $statusCode, success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FollowToggleModelCopyWith<$Res> implements $FollowToggleModelCopyWith<$Res> {
  factory _$FollowToggleModelCopyWith(_FollowToggleModel value, $Res Function(_FollowToggleModel) _then) = __$FollowToggleModelCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, bool success, String message
});




}
/// @nodoc
class __$FollowToggleModelCopyWithImpl<$Res>
    implements _$FollowToggleModelCopyWith<$Res> {
  __$FollowToggleModelCopyWithImpl(this._self, this._then);

  final _FollowToggleModel _self;
  final $Res Function(_FollowToggleModel) _then;

/// Create a copy of FollowToggleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? success = null,Object? message = null,}) {
  return _then(_FollowToggleModel(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
