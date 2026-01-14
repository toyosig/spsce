// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catregory_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesResponseModel {

 bool? get success; String? get message; List<CategoryData>? get data;
/// Create a copy of CategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesResponseModelCopyWith<CategoriesResponseModel> get copyWith => _$CategoriesResponseModelCopyWithImpl<CategoriesResponseModel>(this as CategoriesResponseModel, _$identity);

  /// Serializes this CategoriesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CategoriesResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CategoriesResponseModelCopyWith<$Res>  {
  factory $CategoriesResponseModelCopyWith(CategoriesResponseModel value, $Res Function(CategoriesResponseModel) _then) = _$CategoriesResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<CategoryData>? data
});




}
/// @nodoc
class _$CategoriesResponseModelCopyWithImpl<$Res>
    implements $CategoriesResponseModelCopyWith<$Res> {
  _$CategoriesResponseModelCopyWithImpl(this._self, this._then);

  final CategoriesResponseModel _self;
  final $Res Function(CategoriesResponseModel) _then;

/// Create a copy of CategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CategoryData>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CategoriesResponseModel implements CategoriesResponseModel {
  const _CategoriesResponseModel({this.success, this.message, final  List<CategoryData>? data}): _data = data;
  factory _CategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$CategoriesResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<CategoryData>? _data;
@override List<CategoryData>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesResponseModelCopyWith<_CategoriesResponseModel> get copyWith => __$CategoriesResponseModelCopyWithImpl<_CategoriesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CategoriesResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CategoriesResponseModelCopyWith<$Res> implements $CategoriesResponseModelCopyWith<$Res> {
  factory _$CategoriesResponseModelCopyWith(_CategoriesResponseModel value, $Res Function(_CategoriesResponseModel) _then) = __$CategoriesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<CategoryData>? data
});




}
/// @nodoc
class __$CategoriesResponseModelCopyWithImpl<$Res>
    implements _$CategoriesResponseModelCopyWith<$Res> {
  __$CategoriesResponseModelCopyWithImpl(this._self, this._then);

  final _CategoriesResponseModel _self;
  final $Res Function(_CategoriesResponseModel) _then;

/// Create a copy of CategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_CategoriesResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CategoryData>?,
  ));
}


}

// dart format on
