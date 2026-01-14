// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'policy_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PolicyResponse {

 bool get success; String get message; List<PolicyData> get data;
/// Create a copy of PolicyResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicyResponseCopyWith<PolicyResponse> get copyWith => _$PolicyResponseCopyWithImpl<PolicyResponse>(this as PolicyResponse, _$identity);

  /// Serializes this PolicyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PolicyResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $PolicyResponseCopyWith<$Res>  {
  factory $PolicyResponseCopyWith(PolicyResponse value, $Res Function(PolicyResponse) _then) = _$PolicyResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<PolicyData> data
});




}
/// @nodoc
class _$PolicyResponseCopyWithImpl<$Res>
    implements $PolicyResponseCopyWith<$Res> {
  _$PolicyResponseCopyWithImpl(this._self, this._then);

  final PolicyResponse _self;
  final $Res Function(PolicyResponse) _then;

/// Create a copy of PolicyResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PolicyData>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PolicyResponse implements PolicyResponse {
  const _PolicyResponse({required this.success, required this.message, required final  List<PolicyData> data}): _data = data;
  factory _PolicyResponse.fromJson(Map<String, dynamic> json) => _$PolicyResponseFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<PolicyData> _data;
@override List<PolicyData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of PolicyResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PolicyResponseCopyWith<_PolicyResponse> get copyWith => __$PolicyResponseCopyWithImpl<_PolicyResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PolicyResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PolicyResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PolicyResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PolicyResponseCopyWith<$Res> implements $PolicyResponseCopyWith<$Res> {
  factory _$PolicyResponseCopyWith(_PolicyResponse value, $Res Function(_PolicyResponse) _then) = __$PolicyResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<PolicyData> data
});




}
/// @nodoc
class __$PolicyResponseCopyWithImpl<$Res>
    implements _$PolicyResponseCopyWith<$Res> {
  __$PolicyResponseCopyWithImpl(this._self, this._then);

  final _PolicyResponse _self;
  final $Res Function(_PolicyResponse) _then;

/// Create a copy of PolicyResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_PolicyResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PolicyData>,
  ));
}


}


/// @nodoc
mixin _$PolicyData {

 String get id; String get content; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicyDataCopyWith<PolicyData> get copyWith => _$PolicyDataCopyWithImpl<PolicyData>(this as PolicyData, _$identity);

  /// Serializes this PolicyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyData&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,createdAt,updatedAt);

@override
String toString() {
  return 'PolicyData(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PolicyDataCopyWith<$Res>  {
  factory $PolicyDataCopyWith(PolicyData value, $Res Function(PolicyData) _then) = _$PolicyDataCopyWithImpl;
@useResult
$Res call({
 String id, String content, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$PolicyDataCopyWithImpl<$Res>
    implements $PolicyDataCopyWith<$Res> {
  _$PolicyDataCopyWithImpl(this._self, this._then);

  final PolicyData _self;
  final $Res Function(PolicyData) _then;

/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PolicyData implements PolicyData {
  const _PolicyData({required this.id, required this.content, required this.createdAt, required this.updatedAt});
  factory _PolicyData.fromJson(Map<String, dynamic> json) => _$PolicyDataFromJson(json);

@override final  String id;
@override final  String content;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PolicyDataCopyWith<_PolicyData> get copyWith => __$PolicyDataCopyWithImpl<_PolicyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PolicyDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PolicyData&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,createdAt,updatedAt);

@override
String toString() {
  return 'PolicyData(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PolicyDataCopyWith<$Res> implements $PolicyDataCopyWith<$Res> {
  factory _$PolicyDataCopyWith(_PolicyData value, $Res Function(_PolicyData) _then) = __$PolicyDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String content, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$PolicyDataCopyWithImpl<$Res>
    implements _$PolicyDataCopyWith<$Res> {
  __$PolicyDataCopyWithImpl(this._self, this._then);

  final _PolicyData _self;
  final $Res Function(_PolicyData) _then;

/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PolicyData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
