// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HelpRequestModel {

 List<String> get reasons; String get description; String get orderId;
/// Create a copy of HelpRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpRequestModelCopyWith<HelpRequestModel> get copyWith => _$HelpRequestModelCopyWithImpl<HelpRequestModel>(this as HelpRequestModel, _$identity);

  /// Serializes this HelpRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpRequestModel&&const DeepCollectionEquality().equals(other.reasons, reasons)&&(identical(other.description, description) || other.description == description)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reasons),description,orderId);

@override
String toString() {
  return 'HelpRequestModel(reasons: $reasons, description: $description, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $HelpRequestModelCopyWith<$Res>  {
  factory $HelpRequestModelCopyWith(HelpRequestModel value, $Res Function(HelpRequestModel) _then) = _$HelpRequestModelCopyWithImpl;
@useResult
$Res call({
 List<String> reasons, String description, String orderId
});




}
/// @nodoc
class _$HelpRequestModelCopyWithImpl<$Res>
    implements $HelpRequestModelCopyWith<$Res> {
  _$HelpRequestModelCopyWithImpl(this._self, this._then);

  final HelpRequestModel _self;
  final $Res Function(HelpRequestModel) _then;

/// Create a copy of HelpRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reasons = null,Object? description = null,Object? orderId = null,}) {
  return _then(_self.copyWith(
reasons: null == reasons ? _self.reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HelpRequestModel implements HelpRequestModel {
  const _HelpRequestModel({required final  List<String> reasons, required this.description, required this.orderId}): _reasons = reasons;
  factory _HelpRequestModel.fromJson(Map<String, dynamic> json) => _$HelpRequestModelFromJson(json);

 final  List<String> _reasons;
@override List<String> get reasons {
  if (_reasons is EqualUnmodifiableListView) return _reasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasons);
}

@override final  String description;
@override final  String orderId;

/// Create a copy of HelpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpRequestModelCopyWith<_HelpRequestModel> get copyWith => __$HelpRequestModelCopyWithImpl<_HelpRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HelpRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpRequestModel&&const DeepCollectionEquality().equals(other._reasons, _reasons)&&(identical(other.description, description) || other.description == description)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reasons),description,orderId);

@override
String toString() {
  return 'HelpRequestModel(reasons: $reasons, description: $description, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$HelpRequestModelCopyWith<$Res> implements $HelpRequestModelCopyWith<$Res> {
  factory _$HelpRequestModelCopyWith(_HelpRequestModel value, $Res Function(_HelpRequestModel) _then) = __$HelpRequestModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> reasons, String description, String orderId
});




}
/// @nodoc
class __$HelpRequestModelCopyWithImpl<$Res>
    implements _$HelpRequestModelCopyWith<$Res> {
  __$HelpRequestModelCopyWithImpl(this._self, this._then);

  final _HelpRequestModel _self;
  final $Res Function(_HelpRequestModel) _then;

/// Create a copy of HelpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reasons = null,Object? description = null,Object? orderId = null,}) {
  return _then(_HelpRequestModel(
reasons: null == reasons ? _self._reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
