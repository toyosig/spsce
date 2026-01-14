// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_like_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToggleLikeData {

 bool get liked; ProductsData get product;
/// Create a copy of ToggleLikeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleLikeDataCopyWith<ToggleLikeData> get copyWith => _$ToggleLikeDataCopyWithImpl<ToggleLikeData>(this as ToggleLikeData, _$identity);

  /// Serializes this ToggleLikeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleLikeData&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,liked,product);

@override
String toString() {
  return 'ToggleLikeData(liked: $liked, product: $product)';
}


}

/// @nodoc
abstract mixin class $ToggleLikeDataCopyWith<$Res>  {
  factory $ToggleLikeDataCopyWith(ToggleLikeData value, $Res Function(ToggleLikeData) _then) = _$ToggleLikeDataCopyWithImpl;
@useResult
$Res call({
 bool liked, ProductsData product
});


$ProductsDataCopyWith<$Res> get product;

}
/// @nodoc
class _$ToggleLikeDataCopyWithImpl<$Res>
    implements $ToggleLikeDataCopyWith<$Res> {
  _$ToggleLikeDataCopyWithImpl(this._self, this._then);

  final ToggleLikeData _self;
  final $Res Function(ToggleLikeData) _then;

/// Create a copy of ToggleLikeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? liked = null,Object? product = null,}) {
  return _then(_self.copyWith(
liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData,
  ));
}
/// Create a copy of ToggleLikeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res> get product {
  
  return $ProductsDataCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ToggleLikeData implements ToggleLikeData {
  const _ToggleLikeData({required this.liked, required this.product});
  factory _ToggleLikeData.fromJson(Map<String, dynamic> json) => _$ToggleLikeDataFromJson(json);

@override final  bool liked;
@override final  ProductsData product;

/// Create a copy of ToggleLikeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleLikeDataCopyWith<_ToggleLikeData> get copyWith => __$ToggleLikeDataCopyWithImpl<_ToggleLikeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToggleLikeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleLikeData&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,liked,product);

@override
String toString() {
  return 'ToggleLikeData(liked: $liked, product: $product)';
}


}

/// @nodoc
abstract mixin class _$ToggleLikeDataCopyWith<$Res> implements $ToggleLikeDataCopyWith<$Res> {
  factory _$ToggleLikeDataCopyWith(_ToggleLikeData value, $Res Function(_ToggleLikeData) _then) = __$ToggleLikeDataCopyWithImpl;
@override @useResult
$Res call({
 bool liked, ProductsData product
});


@override $ProductsDataCopyWith<$Res> get product;

}
/// @nodoc
class __$ToggleLikeDataCopyWithImpl<$Res>
    implements _$ToggleLikeDataCopyWith<$Res> {
  __$ToggleLikeDataCopyWithImpl(this._self, this._then);

  final _ToggleLikeData _self;
  final $Res Function(_ToggleLikeData) _then;

/// Create a copy of ToggleLikeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? liked = null,Object? product = null,}) {
  return _then(_ToggleLikeData(
liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData,
  ));
}

/// Create a copy of ToggleLikeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res> get product {
  
  return $ProductsDataCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$ToggleLikeResponseModel {

 bool? get success; String? get message; ToggleLikeData? get data;
/// Create a copy of ToggleLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleLikeResponseModelCopyWith<ToggleLikeResponseModel> get copyWith => _$ToggleLikeResponseModelCopyWithImpl<ToggleLikeResponseModel>(this as ToggleLikeResponseModel, _$identity);

  /// Serializes this ToggleLikeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleLikeResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ToggleLikeResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ToggleLikeResponseModelCopyWith<$Res>  {
  factory $ToggleLikeResponseModelCopyWith(ToggleLikeResponseModel value, $Res Function(ToggleLikeResponseModel) _then) = _$ToggleLikeResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ToggleLikeData? data
});


$ToggleLikeDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ToggleLikeResponseModelCopyWithImpl<$Res>
    implements $ToggleLikeResponseModelCopyWith<$Res> {
  _$ToggleLikeResponseModelCopyWithImpl(this._self, this._then);

  final ToggleLikeResponseModel _self;
  final $Res Function(ToggleLikeResponseModel) _then;

/// Create a copy of ToggleLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ToggleLikeData?,
  ));
}
/// Create a copy of ToggleLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToggleLikeDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ToggleLikeDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ToggleLikeResponseModel implements ToggleLikeResponseModel {
  const _ToggleLikeResponseModel({this.success, this.message, this.data});
  factory _ToggleLikeResponseModel.fromJson(Map<String, dynamic> json) => _$ToggleLikeResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ToggleLikeData? data;

/// Create a copy of ToggleLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleLikeResponseModelCopyWith<_ToggleLikeResponseModel> get copyWith => __$ToggleLikeResponseModelCopyWithImpl<_ToggleLikeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToggleLikeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleLikeResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ToggleLikeResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ToggleLikeResponseModelCopyWith<$Res> implements $ToggleLikeResponseModelCopyWith<$Res> {
  factory _$ToggleLikeResponseModelCopyWith(_ToggleLikeResponseModel value, $Res Function(_ToggleLikeResponseModel) _then) = __$ToggleLikeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ToggleLikeData? data
});


@override $ToggleLikeDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ToggleLikeResponseModelCopyWithImpl<$Res>
    implements _$ToggleLikeResponseModelCopyWith<$Res> {
  __$ToggleLikeResponseModelCopyWithImpl(this._self, this._then);

  final _ToggleLikeResponseModel _self;
  final $Res Function(_ToggleLikeResponseModel) _then;

/// Create a copy of ToggleLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ToggleLikeResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ToggleLikeData?,
  ));
}

/// Create a copy of ToggleLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToggleLikeDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ToggleLikeDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
