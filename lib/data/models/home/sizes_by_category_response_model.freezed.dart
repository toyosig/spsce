// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sizes_by_category_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SizesByCategoryResponseModel {

 bool get success; String get message; SizesByCategoryData get data;
/// Create a copy of SizesByCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizesByCategoryResponseModelCopyWith<SizesByCategoryResponseModel> get copyWith => _$SizesByCategoryResponseModelCopyWithImpl<SizesByCategoryResponseModel>(this as SizesByCategoryResponseModel, _$identity);

  /// Serializes this SizesByCategoryResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizesByCategoryResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SizesByCategoryResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SizesByCategoryResponseModelCopyWith<$Res>  {
  factory $SizesByCategoryResponseModelCopyWith(SizesByCategoryResponseModel value, $Res Function(SizesByCategoryResponseModel) _then) = _$SizesByCategoryResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, SizesByCategoryData data
});


$SizesByCategoryDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SizesByCategoryResponseModelCopyWithImpl<$Res>
    implements $SizesByCategoryResponseModelCopyWith<$Res> {
  _$SizesByCategoryResponseModelCopyWithImpl(this._self, this._then);

  final SizesByCategoryResponseModel _self;
  final $Res Function(SizesByCategoryResponseModel) _then;

/// Create a copy of SizesByCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SizesByCategoryData,
  ));
}
/// Create a copy of SizesByCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SizesByCategoryDataCopyWith<$Res> get data {
  
  return $SizesByCategoryDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SizesByCategoryResponseModel implements SizesByCategoryResponseModel {
  const _SizesByCategoryResponseModel({required this.success, required this.message, required this.data});
  factory _SizesByCategoryResponseModel.fromJson(Map<String, dynamic> json) => _$SizesByCategoryResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override final  SizesByCategoryData data;

/// Create a copy of SizesByCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizesByCategoryResponseModelCopyWith<_SizesByCategoryResponseModel> get copyWith => __$SizesByCategoryResponseModelCopyWithImpl<_SizesByCategoryResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SizesByCategoryResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizesByCategoryResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SizesByCategoryResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SizesByCategoryResponseModelCopyWith<$Res> implements $SizesByCategoryResponseModelCopyWith<$Res> {
  factory _$SizesByCategoryResponseModelCopyWith(_SizesByCategoryResponseModel value, $Res Function(_SizesByCategoryResponseModel) _then) = __$SizesByCategoryResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, SizesByCategoryData data
});


@override $SizesByCategoryDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SizesByCategoryResponseModelCopyWithImpl<$Res>
    implements _$SizesByCategoryResponseModelCopyWith<$Res> {
  __$SizesByCategoryResponseModelCopyWithImpl(this._self, this._then);

  final _SizesByCategoryResponseModel _self;
  final $Res Function(_SizesByCategoryResponseModel) _then;

/// Create a copy of SizesByCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_SizesByCategoryResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SizesByCategoryData,
  ));
}

/// Create a copy of SizesByCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SizesByCategoryDataCopyWith<$Res> get data {
  
  return $SizesByCategoryDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SizesByCategoryData {

 String get categoryId; String get categoryName; Map<String, List<SizeValue>> get sizes;
/// Create a copy of SizesByCategoryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizesByCategoryDataCopyWith<SizesByCategoryData> get copyWith => _$SizesByCategoryDataCopyWithImpl<SizesByCategoryData>(this as SizesByCategoryData, _$identity);

  /// Serializes this SizesByCategoryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizesByCategoryData&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&const DeepCollectionEquality().equals(other.sizes, sizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,const DeepCollectionEquality().hash(sizes));

@override
String toString() {
  return 'SizesByCategoryData(categoryId: $categoryId, categoryName: $categoryName, sizes: $sizes)';
}


}

/// @nodoc
abstract mixin class $SizesByCategoryDataCopyWith<$Res>  {
  factory $SizesByCategoryDataCopyWith(SizesByCategoryData value, $Res Function(SizesByCategoryData) _then) = _$SizesByCategoryDataCopyWithImpl;
@useResult
$Res call({
 String categoryId, String categoryName, Map<String, List<SizeValue>> sizes
});




}
/// @nodoc
class _$SizesByCategoryDataCopyWithImpl<$Res>
    implements $SizesByCategoryDataCopyWith<$Res> {
  _$SizesByCategoryDataCopyWithImpl(this._self, this._then);

  final SizesByCategoryData _self;
  final $Res Function(SizesByCategoryData) _then;

/// Create a copy of SizesByCategoryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categoryName = null,Object? sizes = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as Map<String, List<SizeValue>>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SizesByCategoryData implements SizesByCategoryData {
  const _SizesByCategoryData({required this.categoryId, required this.categoryName, required final  Map<String, List<SizeValue>> sizes}): _sizes = sizes;
  factory _SizesByCategoryData.fromJson(Map<String, dynamic> json) => _$SizesByCategoryDataFromJson(json);

@override final  String categoryId;
@override final  String categoryName;
 final  Map<String, List<SizeValue>> _sizes;
@override Map<String, List<SizeValue>> get sizes {
  if (_sizes is EqualUnmodifiableMapView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sizes);
}


/// Create a copy of SizesByCategoryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizesByCategoryDataCopyWith<_SizesByCategoryData> get copyWith => __$SizesByCategoryDataCopyWithImpl<_SizesByCategoryData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SizesByCategoryDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizesByCategoryData&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&const DeepCollectionEquality().equals(other._sizes, _sizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,const DeepCollectionEquality().hash(_sizes));

@override
String toString() {
  return 'SizesByCategoryData(categoryId: $categoryId, categoryName: $categoryName, sizes: $sizes)';
}


}

/// @nodoc
abstract mixin class _$SizesByCategoryDataCopyWith<$Res> implements $SizesByCategoryDataCopyWith<$Res> {
  factory _$SizesByCategoryDataCopyWith(_SizesByCategoryData value, $Res Function(_SizesByCategoryData) _then) = __$SizesByCategoryDataCopyWithImpl;
@override @useResult
$Res call({
 String categoryId, String categoryName, Map<String, List<SizeValue>> sizes
});




}
/// @nodoc
class __$SizesByCategoryDataCopyWithImpl<$Res>
    implements _$SizesByCategoryDataCopyWith<$Res> {
  __$SizesByCategoryDataCopyWithImpl(this._self, this._then);

  final _SizesByCategoryData _self;
  final $Res Function(_SizesByCategoryData) _then;

/// Create a copy of SizesByCategoryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categoryName = null,Object? sizes = null,}) {
  return _then(_SizesByCategoryData(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as Map<String, List<SizeValue>>,
  ));
}


}


/// @nodoc
mixin _$SizeValue {

 String get id; String get value;
/// Create a copy of SizeValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizeValueCopyWith<SizeValue> get copyWith => _$SizeValueCopyWithImpl<SizeValue>(this as SizeValue, _$identity);

  /// Serializes this SizeValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeValue&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'SizeValue(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class $SizeValueCopyWith<$Res>  {
  factory $SizeValueCopyWith(SizeValue value, $Res Function(SizeValue) _then) = _$SizeValueCopyWithImpl;
@useResult
$Res call({
 String id, String value
});




}
/// @nodoc
class _$SizeValueCopyWithImpl<$Res>
    implements $SizeValueCopyWith<$Res> {
  _$SizeValueCopyWithImpl(this._self, this._then);

  final SizeValue _self;
  final $Res Function(SizeValue) _then;

/// Create a copy of SizeValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SizeValue implements SizeValue {
  const _SizeValue({required this.id, required this.value});
  factory _SizeValue.fromJson(Map<String, dynamic> json) => _$SizeValueFromJson(json);

@override final  String id;
@override final  String value;

/// Create a copy of SizeValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizeValueCopyWith<_SizeValue> get copyWith => __$SizeValueCopyWithImpl<_SizeValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SizeValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizeValue&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'SizeValue(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SizeValueCopyWith<$Res> implements $SizeValueCopyWith<$Res> {
  factory _$SizeValueCopyWith(_SizeValue value, $Res Function(_SizeValue) _then) = __$SizeValueCopyWithImpl;
@override @useResult
$Res call({
 String id, String value
});




}
/// @nodoc
class __$SizeValueCopyWithImpl<$Res>
    implements _$SizeValueCopyWith<$Res> {
  __$SizeValueCopyWithImpl(this._self, this._then);

  final _SizeValue _self;
  final $Res Function(_SizeValue) _then;

/// Create a copy of SizeValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? value = null,}) {
  return _then(_SizeValue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
