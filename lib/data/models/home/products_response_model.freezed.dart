// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsResponseModel {

 String? get message; bool? get success; List<ProductsData>? get data; int? get total; int? get page; int? get limit; int? get totalPages;
/// Create a copy of ProductsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsResponseModelCopyWith<ProductsResponseModel> get copyWith => _$ProductsResponseModelCopyWithImpl<ProductsResponseModel>(this as ProductsResponseModel, _$identity);

  /// Serializes this ProductsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,const DeepCollectionEquality().hash(data),total,page,limit,totalPages);

@override
String toString() {
  return 'ProductsResponseModel(message: $message, success: $success, data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ProductsResponseModelCopyWith<$Res>  {
  factory $ProductsResponseModelCopyWith(ProductsResponseModel value, $Res Function(ProductsResponseModel) _then) = _$ProductsResponseModelCopyWithImpl;
@useResult
$Res call({
 String? message, bool? success, List<ProductsData>? data, int? total, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class _$ProductsResponseModelCopyWithImpl<$Res>
    implements $ProductsResponseModelCopyWith<$Res> {
  _$ProductsResponseModelCopyWithImpl(this._self, this._then);

  final ProductsResponseModel _self;
  final $Res Function(ProductsResponseModel) _then;

/// Create a copy of ProductsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? success = freezed,Object? data = freezed,Object? total = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProductsData>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProductsResponseModel implements ProductsResponseModel {
  const _ProductsResponseModel({this.message, this.success, final  List<ProductsData>? data, this.total, this.page, this.limit, this.totalPages}): _data = data;
  factory _ProductsResponseModel.fromJson(Map<String, dynamic> json) => _$ProductsResponseModelFromJson(json);

@override final  String? message;
@override final  bool? success;
 final  List<ProductsData>? _data;
@override List<ProductsData>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? total;
@override final  int? page;
@override final  int? limit;
@override final  int? totalPages;

/// Create a copy of ProductsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsResponseModelCopyWith<_ProductsResponseModel> get copyWith => __$ProductsResponseModelCopyWithImpl<_ProductsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success,const DeepCollectionEquality().hash(_data),total,page,limit,totalPages);

@override
String toString() {
  return 'ProductsResponseModel(message: $message, success: $success, data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ProductsResponseModelCopyWith<$Res> implements $ProductsResponseModelCopyWith<$Res> {
  factory _$ProductsResponseModelCopyWith(_ProductsResponseModel value, $Res Function(_ProductsResponseModel) _then) = __$ProductsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? message, bool? success, List<ProductsData>? data, int? total, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class __$ProductsResponseModelCopyWithImpl<$Res>
    implements _$ProductsResponseModelCopyWith<$Res> {
  __$ProductsResponseModelCopyWithImpl(this._self, this._then);

  final _ProductsResponseModel _self;
  final $Res Function(_ProductsResponseModel) _then;

/// Create a copy of ProductsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? success = freezed,Object? data = freezed,Object? total = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_ProductsResponseModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProductsData>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
