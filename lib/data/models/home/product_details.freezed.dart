// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDetails {

 bool? get success; String? get message; ProductsData? get data;
/// Create a copy of ProductDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsCopyWith<ProductDetails> get copyWith => _$ProductDetailsCopyWithImpl<ProductDetails>(this as ProductDetails, _$identity);

  /// Serializes this ProductDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetails&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ProductDetails(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsCopyWith<$Res>  {
  factory $ProductDetailsCopyWith(ProductDetails value, $Res Function(ProductDetails) _then) = _$ProductDetailsCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ProductsData? data
});


$ProductsDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ProductDetailsCopyWithImpl<$Res>
    implements $ProductDetailsCopyWith<$Res> {
  _$ProductDetailsCopyWithImpl(this._self, this._then);

  final ProductDetails _self;
  final $Res Function(ProductDetails) _then;

/// Create a copy of ProductDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductsData?,
  ));
}
/// Create a copy of ProductDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProductsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ProductDetails implements ProductDetails {
  const _ProductDetails({this.success, this.message, this.data});
  factory _ProductDetails.fromJson(Map<String, dynamic> json) => _$ProductDetailsFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ProductsData? data;

/// Create a copy of ProductDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailsCopyWith<_ProductDetails> get copyWith => __$ProductDetailsCopyWithImpl<_ProductDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetails&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ProductDetails(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailsCopyWith<$Res> implements $ProductDetailsCopyWith<$Res> {
  factory _$ProductDetailsCopyWith(_ProductDetails value, $Res Function(_ProductDetails) _then) = __$ProductDetailsCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ProductsData? data
});


@override $ProductsDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ProductDetailsCopyWithImpl<$Res>
    implements _$ProductDetailsCopyWith<$Res> {
  __$ProductDetailsCopyWithImpl(this._self, this._then);

  final _ProductDetails _self;
  final $Res Function(_ProductDetails) _then;

/// Create a copy of ProductDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ProductDetails(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductsData?,
  ));
}

/// Create a copy of ProductDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProductsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
