// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToggleNotificationModel {

 bool get success; String get message; bool? get pushNotification; bool? get emailNotification;
/// Create a copy of ToggleNotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleNotificationModelCopyWith<ToggleNotificationModel> get copyWith => _$ToggleNotificationModelCopyWithImpl<ToggleNotificationModel>(this as ToggleNotificationModel, _$identity);

  /// Serializes this ToggleNotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleNotificationModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.pushNotification, pushNotification) || other.pushNotification == pushNotification)&&(identical(other.emailNotification, emailNotification) || other.emailNotification == emailNotification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,pushNotification,emailNotification);

@override
String toString() {
  return 'ToggleNotificationModel(success: $success, message: $message, pushNotification: $pushNotification, emailNotification: $emailNotification)';
}


}

/// @nodoc
abstract mixin class $ToggleNotificationModelCopyWith<$Res>  {
  factory $ToggleNotificationModelCopyWith(ToggleNotificationModel value, $Res Function(ToggleNotificationModel) _then) = _$ToggleNotificationModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, bool? pushNotification, bool? emailNotification
});




}
/// @nodoc
class _$ToggleNotificationModelCopyWithImpl<$Res>
    implements $ToggleNotificationModelCopyWith<$Res> {
  _$ToggleNotificationModelCopyWithImpl(this._self, this._then);

  final ToggleNotificationModel _self;
  final $Res Function(ToggleNotificationModel) _then;

/// Create a copy of ToggleNotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? pushNotification = freezed,Object? emailNotification = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pushNotification: freezed == pushNotification ? _self.pushNotification : pushNotification // ignore: cast_nullable_to_non_nullable
as bool?,emailNotification: freezed == emailNotification ? _self.emailNotification : emailNotification // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ToggleNotificationModel implements ToggleNotificationModel {
  const _ToggleNotificationModel({required this.success, required this.message, this.pushNotification, this.emailNotification});
  factory _ToggleNotificationModel.fromJson(Map<String, dynamic> json) => _$ToggleNotificationModelFromJson(json);

@override final  bool success;
@override final  String message;
@override final  bool? pushNotification;
@override final  bool? emailNotification;

/// Create a copy of ToggleNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleNotificationModelCopyWith<_ToggleNotificationModel> get copyWith => __$ToggleNotificationModelCopyWithImpl<_ToggleNotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToggleNotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleNotificationModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.pushNotification, pushNotification) || other.pushNotification == pushNotification)&&(identical(other.emailNotification, emailNotification) || other.emailNotification == emailNotification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,pushNotification,emailNotification);

@override
String toString() {
  return 'ToggleNotificationModel(success: $success, message: $message, pushNotification: $pushNotification, emailNotification: $emailNotification)';
}


}

/// @nodoc
abstract mixin class _$ToggleNotificationModelCopyWith<$Res> implements $ToggleNotificationModelCopyWith<$Res> {
  factory _$ToggleNotificationModelCopyWith(_ToggleNotificationModel value, $Res Function(_ToggleNotificationModel) _then) = __$ToggleNotificationModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, bool? pushNotification, bool? emailNotification
});




}
/// @nodoc
class __$ToggleNotificationModelCopyWithImpl<$Res>
    implements _$ToggleNotificationModelCopyWith<$Res> {
  __$ToggleNotificationModelCopyWithImpl(this._self, this._then);

  final _ToggleNotificationModel _self;
  final $Res Function(_ToggleNotificationModel) _then;

/// Create a copy of ToggleNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? pushNotification = freezed,Object? emailNotification = freezed,}) {
  return _then(_ToggleNotificationModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pushNotification: freezed == pushNotification ? _self.pushNotification : pushNotification // ignore: cast_nullable_to_non_nullable
as bool?,emailNotification: freezed == emailNotification ? _self.emailNotification : emailNotification // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
