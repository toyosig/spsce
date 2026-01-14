// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddProductResponseModel {

 bool? get success; String? get message; String? get error; AddedProductData? get data;
/// Create a copy of AddProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddProductResponseModelCopyWith<AddProductResponseModel> get copyWith => _$AddProductResponseModelCopyWithImpl<AddProductResponseModel>(this as AddProductResponseModel, _$identity);

  /// Serializes this AddProductResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,error,data);

@override
String toString() {
  return 'AddProductResponseModel(success: $success, message: $message, error: $error, data: $data)';
}


}

/// @nodoc
abstract mixin class $AddProductResponseModelCopyWith<$Res>  {
  factory $AddProductResponseModelCopyWith(AddProductResponseModel value, $Res Function(AddProductResponseModel) _then) = _$AddProductResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, String? error, AddedProductData? data
});


$AddedProductDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$AddProductResponseModelCopyWithImpl<$Res>
    implements $AddProductResponseModelCopyWith<$Res> {
  _$AddProductResponseModelCopyWithImpl(this._self, this._then);

  final AddProductResponseModel _self;
  final $Res Function(AddProductResponseModel) _then;

/// Create a copy of AddProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? error = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AddedProductData?,
  ));
}
/// Create a copy of AddProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddedProductDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AddedProductDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AddProductResponseModel implements AddProductResponseModel {
  const _AddProductResponseModel({this.success, this.message, this.error, this.data});
  factory _AddProductResponseModel.fromJson(Map<String, dynamic> json) => _$AddProductResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  String? error;
@override final  AddedProductData? data;

/// Create a copy of AddProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddProductResponseModelCopyWith<_AddProductResponseModel> get copyWith => __$AddProductResponseModelCopyWithImpl<_AddProductResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddProductResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddProductResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,error,data);

@override
String toString() {
  return 'AddProductResponseModel(success: $success, message: $message, error: $error, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AddProductResponseModelCopyWith<$Res> implements $AddProductResponseModelCopyWith<$Res> {
  factory _$AddProductResponseModelCopyWith(_AddProductResponseModel value, $Res Function(_AddProductResponseModel) _then) = __$AddProductResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, String? error, AddedProductData? data
});


@override $AddedProductDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$AddProductResponseModelCopyWithImpl<$Res>
    implements _$AddProductResponseModelCopyWith<$Res> {
  __$AddProductResponseModelCopyWithImpl(this._self, this._then);

  final _AddProductResponseModel _self;
  final $Res Function(_AddProductResponseModel) _then;

/// Create a copy of AddProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? error = freezed,Object? data = freezed,}) {
  return _then(_AddProductResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AddedProductData?,
  ));
}

/// Create a copy of AddProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddedProductDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AddedProductDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AddedProductData {

 String? get id; String? get video; String? get title; String? get description; int? get price; String? get condition; String? get color; int? get quantity; String? get shippingTo; bool? get isDraft; bool? get isDelete; String? get sellerId; String? get brandId; String? get shippingFromId; String? get subCategoryId; String? get categoryId;
/// Create a copy of AddedProductData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddedProductDataCopyWith<AddedProductData> get copyWith => _$AddedProductDataCopyWithImpl<AddedProductData>(this as AddedProductData, _$identity);

  /// Serializes this AddedProductData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddedProductData&&(identical(other.id, id) || other.id == id)&&(identical(other.video, video) || other.video == video)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.color, color) || other.color == color)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.shippingTo, shippingTo) || other.shippingTo == shippingTo)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.isDelete, isDelete) || other.isDelete == isDelete)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.shippingFromId, shippingFromId) || other.shippingFromId == shippingFromId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,video,title,description,price,condition,color,quantity,shippingTo,isDraft,isDelete,sellerId,brandId,shippingFromId,subCategoryId,categoryId);

@override
String toString() {
  return 'AddedProductData(id: $id, video: $video, title: $title, description: $description, price: $price, condition: $condition, color: $color, quantity: $quantity, shippingTo: $shippingTo, isDraft: $isDraft, isDelete: $isDelete, sellerId: $sellerId, brandId: $brandId, shippingFromId: $shippingFromId, subCategoryId: $subCategoryId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $AddedProductDataCopyWith<$Res>  {
  factory $AddedProductDataCopyWith(AddedProductData value, $Res Function(AddedProductData) _then) = _$AddedProductDataCopyWithImpl;
@useResult
$Res call({
 String? id, String? video, String? title, String? description, int? price, String? condition, String? color, int? quantity, String? shippingTo, bool? isDraft, bool? isDelete, String? sellerId, String? brandId, String? shippingFromId, String? subCategoryId, String? categoryId
});




}
/// @nodoc
class _$AddedProductDataCopyWithImpl<$Res>
    implements $AddedProductDataCopyWith<$Res> {
  _$AddedProductDataCopyWithImpl(this._self, this._then);

  final AddedProductData _self;
  final $Res Function(AddedProductData) _then;

/// Create a copy of AddedProductData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? video = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? condition = freezed,Object? color = freezed,Object? quantity = freezed,Object? shippingTo = freezed,Object? isDraft = freezed,Object? isDelete = freezed,Object? sellerId = freezed,Object? brandId = freezed,Object? shippingFromId = freezed,Object? subCategoryId = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,shippingTo: freezed == shippingTo ? _self.shippingTo : shippingTo // ignore: cast_nullable_to_non_nullable
as String?,isDraft: freezed == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool?,isDelete: freezed == isDelete ? _self.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,shippingFromId: freezed == shippingFromId ? _self.shippingFromId : shippingFromId // ignore: cast_nullable_to_non_nullable
as String?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AddedProductData implements AddedProductData {
  const _AddedProductData({this.id, this.video, this.title, this.description, this.price, this.condition, this.color, this.quantity, this.shippingTo, this.isDraft, this.isDelete, this.sellerId, this.brandId, this.shippingFromId, this.subCategoryId, this.categoryId});
  factory _AddedProductData.fromJson(Map<String, dynamic> json) => _$AddedProductDataFromJson(json);

@override final  String? id;
@override final  String? video;
@override final  String? title;
@override final  String? description;
@override final  int? price;
@override final  String? condition;
@override final  String? color;
@override final  int? quantity;
@override final  String? shippingTo;
@override final  bool? isDraft;
@override final  bool? isDelete;
@override final  String? sellerId;
@override final  String? brandId;
@override final  String? shippingFromId;
@override final  String? subCategoryId;
@override final  String? categoryId;

/// Create a copy of AddedProductData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddedProductDataCopyWith<_AddedProductData> get copyWith => __$AddedProductDataCopyWithImpl<_AddedProductData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddedProductDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddedProductData&&(identical(other.id, id) || other.id == id)&&(identical(other.video, video) || other.video == video)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.color, color) || other.color == color)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.shippingTo, shippingTo) || other.shippingTo == shippingTo)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.isDelete, isDelete) || other.isDelete == isDelete)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.shippingFromId, shippingFromId) || other.shippingFromId == shippingFromId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,video,title,description,price,condition,color,quantity,shippingTo,isDraft,isDelete,sellerId,brandId,shippingFromId,subCategoryId,categoryId);

@override
String toString() {
  return 'AddedProductData(id: $id, video: $video, title: $title, description: $description, price: $price, condition: $condition, color: $color, quantity: $quantity, shippingTo: $shippingTo, isDraft: $isDraft, isDelete: $isDelete, sellerId: $sellerId, brandId: $brandId, shippingFromId: $shippingFromId, subCategoryId: $subCategoryId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$AddedProductDataCopyWith<$Res> implements $AddedProductDataCopyWith<$Res> {
  factory _$AddedProductDataCopyWith(_AddedProductData value, $Res Function(_AddedProductData) _then) = __$AddedProductDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? video, String? title, String? description, int? price, String? condition, String? color, int? quantity, String? shippingTo, bool? isDraft, bool? isDelete, String? sellerId, String? brandId, String? shippingFromId, String? subCategoryId, String? categoryId
});




}
/// @nodoc
class __$AddedProductDataCopyWithImpl<$Res>
    implements _$AddedProductDataCopyWith<$Res> {
  __$AddedProductDataCopyWithImpl(this._self, this._then);

  final _AddedProductData _self;
  final $Res Function(_AddedProductData) _then;

/// Create a copy of AddedProductData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? video = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? condition = freezed,Object? color = freezed,Object? quantity = freezed,Object? shippingTo = freezed,Object? isDraft = freezed,Object? isDelete = freezed,Object? sellerId = freezed,Object? brandId = freezed,Object? shippingFromId = freezed,Object? subCategoryId = freezed,Object? categoryId = freezed,}) {
  return _then(_AddedProductData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,shippingTo: freezed == shippingTo ? _self.shippingTo : shippingTo // ignore: cast_nullable_to_non_nullable
as String?,isDraft: freezed == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool?,isDelete: freezed == isDelete ? _self.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,shippingFromId: freezed == shippingFromId ? _self.shippingFromId : shippingFromId // ignore: cast_nullable_to_non_nullable
as String?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
