// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainCategoryResponse {

 bool get success; String get message; List<MainCategory> get data;
/// Create a copy of MainCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainCategoryResponseCopyWith<MainCategoryResponse> get copyWith => _$MainCategoryResponseCopyWithImpl<MainCategoryResponse>(this as MainCategoryResponse, _$identity);

  /// Serializes this MainCategoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainCategoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'MainCategoryResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $MainCategoryResponseCopyWith<$Res>  {
  factory $MainCategoryResponseCopyWith(MainCategoryResponse value, $Res Function(MainCategoryResponse) _then) = _$MainCategoryResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<MainCategory> data
});




}
/// @nodoc
class _$MainCategoryResponseCopyWithImpl<$Res>
    implements $MainCategoryResponseCopyWith<$Res> {
  _$MainCategoryResponseCopyWithImpl(this._self, this._then);

  final MainCategoryResponse _self;
  final $Res Function(MainCategoryResponse) _then;

/// Create a copy of MainCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MainCategory>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MainCategoryResponse implements MainCategoryResponse {
  const _MainCategoryResponse({required this.success, required this.message, required final  List<MainCategory> data}): _data = data;
  factory _MainCategoryResponse.fromJson(Map<String, dynamic> json) => _$MainCategoryResponseFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<MainCategory> _data;
@override List<MainCategory> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of MainCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainCategoryResponseCopyWith<_MainCategoryResponse> get copyWith => __$MainCategoryResponseCopyWithImpl<_MainCategoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MainCategoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainCategoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MainCategoryResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MainCategoryResponseCopyWith<$Res> implements $MainCategoryResponseCopyWith<$Res> {
  factory _$MainCategoryResponseCopyWith(_MainCategoryResponse value, $Res Function(_MainCategoryResponse) _then) = __$MainCategoryResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<MainCategory> data
});




}
/// @nodoc
class __$MainCategoryResponseCopyWithImpl<$Res>
    implements _$MainCategoryResponseCopyWith<$Res> {
  __$MainCategoryResponseCopyWithImpl(this._self, this._then);

  final _MainCategoryResponse _self;
  final $Res Function(_MainCategoryResponse) _then;

/// Create a copy of MainCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_MainCategoryResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MainCategory>,
  ));
}


}


/// @nodoc
mixin _$MainCategory {

 String get id; String get logo; String get name;
/// Create a copy of MainCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainCategoryCopyWith<MainCategory> get copyWith => _$MainCategoryCopyWithImpl<MainCategory>(this as MainCategory, _$identity);

  /// Serializes this MainCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logo,name);

@override
String toString() {
  return 'MainCategory(id: $id, logo: $logo, name: $name)';
}


}

/// @nodoc
abstract mixin class $MainCategoryCopyWith<$Res>  {
  factory $MainCategoryCopyWith(MainCategory value, $Res Function(MainCategory) _then) = _$MainCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String logo, String name
});




}
/// @nodoc
class _$MainCategoryCopyWithImpl<$Res>
    implements $MainCategoryCopyWith<$Res> {
  _$MainCategoryCopyWithImpl(this._self, this._then);

  final MainCategory _self;
  final $Res Function(MainCategory) _then;

/// Create a copy of MainCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? logo = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MainCategory implements MainCategory {
  const _MainCategory({required this.id, required this.logo, required this.name});
  factory _MainCategory.fromJson(Map<String, dynamic> json) => _$MainCategoryFromJson(json);

@override final  String id;
@override final  String logo;
@override final  String name;

/// Create a copy of MainCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainCategoryCopyWith<_MainCategory> get copyWith => __$MainCategoryCopyWithImpl<_MainCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MainCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logo,name);

@override
String toString() {
  return 'MainCategory(id: $id, logo: $logo, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MainCategoryCopyWith<$Res> implements $MainCategoryCopyWith<$Res> {
  factory _$MainCategoryCopyWith(_MainCategory value, $Res Function(_MainCategory) _then) = __$MainCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String logo, String name
});




}
/// @nodoc
class __$MainCategoryCopyWithImpl<$Res>
    implements _$MainCategoryCopyWith<$Res> {
  __$MainCategoryCopyWithImpl(this._self, this._then);

  final _MainCategory _self;
  final $Res Function(_MainCategory) _then;

/// Create a copy of MainCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? logo = null,Object? name = null,}) {
  return _then(_MainCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
