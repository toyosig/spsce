// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsData {

 String? get id; List<String>? get photos; String? get video; String? get title; String? get description; List<String>? get tags; double? get price; String? get condition; Map<String, List<SizeValue>>? get sizes; String? get color; int get quantity; String? get shippingTo; String? get sellerId; String? get createdAt; String? get updatedAt; String? get brandId; String? get subCategoryId; String? get shippingFromId; AuthUserModel? get seller; List<ProductLikes>? get likes; int? get likeCount; CategoryData? get subCategory; CategoryData? get category; ShippingFromModel? get shippingFrom; BrandModel? get brand; String? get productId; bool? get isDraft; bool? get isDelete; bool get isLiked;
/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<ProductsData> get copyWith => _$ProductsDataCopyWithImpl<ProductsData>(this as ProductsData, _$identity);

  /// Serializes this ProductsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsData&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.video, video) || other.video == video)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.price, price) || other.price == price)&&(identical(other.condition, condition) || other.condition == condition)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&(identical(other.color, color) || other.color == color)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.shippingTo, shippingTo) || other.shippingTo == shippingTo)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.shippingFromId, shippingFromId) || other.shippingFromId == shippingFromId)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other.likes, likes)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.category, category) || other.category == category)&&(identical(other.shippingFrom, shippingFrom) || other.shippingFrom == shippingFrom)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.isDelete, isDelete) || other.isDelete == isDelete)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,const DeepCollectionEquality().hash(photos),video,title,description,const DeepCollectionEquality().hash(tags),price,condition,const DeepCollectionEquality().hash(sizes),color,quantity,shippingTo,sellerId,createdAt,updatedAt,brandId,subCategoryId,shippingFromId,seller,const DeepCollectionEquality().hash(likes),likeCount,subCategory,category,shippingFrom,brand,productId,isDraft,isDelete,isLiked]);

@override
String toString() {
  return 'ProductsData(id: $id, photos: $photos, video: $video, title: $title, description: $description, tags: $tags, price: $price, condition: $condition, sizes: $sizes, color: $color, quantity: $quantity, shippingTo: $shippingTo, sellerId: $sellerId, createdAt: $createdAt, updatedAt: $updatedAt, brandId: $brandId, subCategoryId: $subCategoryId, shippingFromId: $shippingFromId, seller: $seller, likes: $likes, likeCount: $likeCount, subCategory: $subCategory, category: $category, shippingFrom: $shippingFrom, brand: $brand, productId: $productId, isDraft: $isDraft, isDelete: $isDelete, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class $ProductsDataCopyWith<$Res>  {
  factory $ProductsDataCopyWith(ProductsData value, $Res Function(ProductsData) _then) = _$ProductsDataCopyWithImpl;
@useResult
$Res call({
 String? id, List<String>? photos, String? video, String? title, String? description, List<String>? tags, double? price, String? condition, Map<String, List<SizeValue>>? sizes, String? color, int quantity, String? shippingTo, String? sellerId, String? createdAt, String? updatedAt, String? brandId, String? subCategoryId, String? shippingFromId, AuthUserModel? seller, List<ProductLikes>? likes, int? likeCount, CategoryData? subCategory, CategoryData? category, ShippingFromModel? shippingFrom, BrandModel? brand, String? productId, bool? isDraft, bool? isDelete, bool isLiked
});


$AuthUserModelCopyWith<$Res>? get seller;$CategoryDataCopyWith<$Res>? get subCategory;$CategoryDataCopyWith<$Res>? get category;$ShippingFromModelCopyWith<$Res>? get shippingFrom;$BrandModelCopyWith<$Res>? get brand;

}
/// @nodoc
class _$ProductsDataCopyWithImpl<$Res>
    implements $ProductsDataCopyWith<$Res> {
  _$ProductsDataCopyWithImpl(this._self, this._then);

  final ProductsData _self;
  final $Res Function(ProductsData) _then;

/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? photos = freezed,Object? video = freezed,Object? title = freezed,Object? description = freezed,Object? tags = freezed,Object? price = freezed,Object? condition = freezed,Object? sizes = freezed,Object? color = freezed,Object? quantity = null,Object? shippingTo = freezed,Object? sellerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? brandId = freezed,Object? subCategoryId = freezed,Object? shippingFromId = freezed,Object? seller = freezed,Object? likes = freezed,Object? likeCount = freezed,Object? subCategory = freezed,Object? category = freezed,Object? shippingFrom = freezed,Object? brand = freezed,Object? productId = freezed,Object? isDraft = freezed,Object? isDelete = freezed,Object? isLiked = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,photos: freezed == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,sizes: freezed == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as Map<String, List<SizeValue>>?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,shippingTo: freezed == shippingTo ? _self.shippingTo : shippingTo // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as String?,shippingFromId: freezed == shippingFromId ? _self.shippingFromId : shippingFromId // ignore: cast_nullable_to_non_nullable
as String?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,likes: freezed == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as List<ProductLikes>?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as CategoryData?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryData?,shippingFrom: freezed == shippingFrom ? _self.shippingFrom : shippingFrom // ignore: cast_nullable_to_non_nullable
as ShippingFromModel?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,isDraft: freezed == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool?,isDelete: freezed == isDelete ? _self.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool?,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDataCopyWith<$Res>? get subCategory {
    if (_self.subCategory == null) {
    return null;
  }

  return $CategoryDataCopyWith<$Res>(_self.subCategory!, (value) {
    return _then(_self.copyWith(subCategory: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDataCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryDataCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingFromModelCopyWith<$Res>? get shippingFrom {
    if (_self.shippingFrom == null) {
    return null;
  }

  return $ShippingFromModelCopyWith<$Res>(_self.shippingFrom!, (value) {
    return _then(_self.copyWith(shippingFrom: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ProductsData implements ProductsData {
  const _ProductsData({this.id, final  List<String>? photos, this.video, this.title, this.description, final  List<String>? tags, this.price, this.condition, final  Map<String, List<SizeValue>>? sizes, this.color, this.quantity = 1, this.shippingTo, this.sellerId, this.createdAt, this.updatedAt, this.brandId, this.subCategoryId, this.shippingFromId, this.seller, final  List<ProductLikes>? likes, this.likeCount, this.subCategory, this.category, this.shippingFrom, this.brand, this.productId, this.isDraft, this.isDelete, this.isLiked = false}): _photos = photos,_tags = tags,_sizes = sizes,_likes = likes;
  factory _ProductsData.fromJson(Map<String, dynamic> json) => _$ProductsDataFromJson(json);

@override final  String? id;
 final  List<String>? _photos;
@override List<String>? get photos {
  final value = _photos;
  if (value == null) return null;
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? video;
@override final  String? title;
@override final  String? description;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? price;
@override final  String? condition;
 final  Map<String, List<SizeValue>>? _sizes;
@override Map<String, List<SizeValue>>? get sizes {
  final value = _sizes;
  if (value == null) return null;
  if (_sizes is EqualUnmodifiableMapView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? color;
@override@JsonKey() final  int quantity;
@override final  String? shippingTo;
@override final  String? sellerId;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? brandId;
@override final  String? subCategoryId;
@override final  String? shippingFromId;
@override final  AuthUserModel? seller;
 final  List<ProductLikes>? _likes;
@override List<ProductLikes>? get likes {
  final value = _likes;
  if (value == null) return null;
  if (_likes is EqualUnmodifiableListView) return _likes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? likeCount;
@override final  CategoryData? subCategory;
@override final  CategoryData? category;
@override final  ShippingFromModel? shippingFrom;
@override final  BrandModel? brand;
@override final  String? productId;
@override final  bool? isDraft;
@override final  bool? isDelete;
@override@JsonKey() final  bool isLiked;

/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsDataCopyWith<_ProductsData> get copyWith => __$ProductsDataCopyWithImpl<_ProductsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsData&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.video, video) || other.video == video)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.price, price) || other.price == price)&&(identical(other.condition, condition) || other.condition == condition)&&const DeepCollectionEquality().equals(other._sizes, _sizes)&&(identical(other.color, color) || other.color == color)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.shippingTo, shippingTo) || other.shippingTo == shippingTo)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.shippingFromId, shippingFromId) || other.shippingFromId == shippingFromId)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other._likes, _likes)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.category, category) || other.category == category)&&(identical(other.shippingFrom, shippingFrom) || other.shippingFrom == shippingFrom)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.isDelete, isDelete) || other.isDelete == isDelete)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,const DeepCollectionEquality().hash(_photos),video,title,description,const DeepCollectionEquality().hash(_tags),price,condition,const DeepCollectionEquality().hash(_sizes),color,quantity,shippingTo,sellerId,createdAt,updatedAt,brandId,subCategoryId,shippingFromId,seller,const DeepCollectionEquality().hash(_likes),likeCount,subCategory,category,shippingFrom,brand,productId,isDraft,isDelete,isLiked]);

@override
String toString() {
  return 'ProductsData(id: $id, photos: $photos, video: $video, title: $title, description: $description, tags: $tags, price: $price, condition: $condition, sizes: $sizes, color: $color, quantity: $quantity, shippingTo: $shippingTo, sellerId: $sellerId, createdAt: $createdAt, updatedAt: $updatedAt, brandId: $brandId, subCategoryId: $subCategoryId, shippingFromId: $shippingFromId, seller: $seller, likes: $likes, likeCount: $likeCount, subCategory: $subCategory, category: $category, shippingFrom: $shippingFrom, brand: $brand, productId: $productId, isDraft: $isDraft, isDelete: $isDelete, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class _$ProductsDataCopyWith<$Res> implements $ProductsDataCopyWith<$Res> {
  factory _$ProductsDataCopyWith(_ProductsData value, $Res Function(_ProductsData) _then) = __$ProductsDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, List<String>? photos, String? video, String? title, String? description, List<String>? tags, double? price, String? condition, Map<String, List<SizeValue>>? sizes, String? color, int quantity, String? shippingTo, String? sellerId, String? createdAt, String? updatedAt, String? brandId, String? subCategoryId, String? shippingFromId, AuthUserModel? seller, List<ProductLikes>? likes, int? likeCount, CategoryData? subCategory, CategoryData? category, ShippingFromModel? shippingFrom, BrandModel? brand, String? productId, bool? isDraft, bool? isDelete, bool isLiked
});


@override $AuthUserModelCopyWith<$Res>? get seller;@override $CategoryDataCopyWith<$Res>? get subCategory;@override $CategoryDataCopyWith<$Res>? get category;@override $ShippingFromModelCopyWith<$Res>? get shippingFrom;@override $BrandModelCopyWith<$Res>? get brand;

}
/// @nodoc
class __$ProductsDataCopyWithImpl<$Res>
    implements _$ProductsDataCopyWith<$Res> {
  __$ProductsDataCopyWithImpl(this._self, this._then);

  final _ProductsData _self;
  final $Res Function(_ProductsData) _then;

/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? photos = freezed,Object? video = freezed,Object? title = freezed,Object? description = freezed,Object? tags = freezed,Object? price = freezed,Object? condition = freezed,Object? sizes = freezed,Object? color = freezed,Object? quantity = null,Object? shippingTo = freezed,Object? sellerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? brandId = freezed,Object? subCategoryId = freezed,Object? shippingFromId = freezed,Object? seller = freezed,Object? likes = freezed,Object? likeCount = freezed,Object? subCategory = freezed,Object? category = freezed,Object? shippingFrom = freezed,Object? brand = freezed,Object? productId = freezed,Object? isDraft = freezed,Object? isDelete = freezed,Object? isLiked = null,}) {
  return _then(_ProductsData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,photos: freezed == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,sizes: freezed == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as Map<String, List<SizeValue>>?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,shippingTo: freezed == shippingTo ? _self.shippingTo : shippingTo // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as String?,shippingFromId: freezed == shippingFromId ? _self.shippingFromId : shippingFromId // ignore: cast_nullable_to_non_nullable
as String?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,likes: freezed == likes ? _self._likes : likes // ignore: cast_nullable_to_non_nullable
as List<ProductLikes>?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as CategoryData?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryData?,shippingFrom: freezed == shippingFrom ? _self.shippingFrom : shippingFrom // ignore: cast_nullable_to_non_nullable
as ShippingFromModel?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,isDraft: freezed == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool?,isDelete: freezed == isDelete ? _self.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool?,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDataCopyWith<$Res>? get subCategory {
    if (_self.subCategory == null) {
    return null;
  }

  return $CategoryDataCopyWith<$Res>(_self.subCategory!, (value) {
    return _then(_self.copyWith(subCategory: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDataCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryDataCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingFromModelCopyWith<$Res>? get shippingFrom {
    if (_self.shippingFrom == null) {
    return null;
  }

  return $ShippingFromModelCopyWith<$Res>(_self.shippingFrom!, (value) {
    return _then(_self.copyWith(shippingFrom: value));
  });
}/// Create a copy of ProductsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}


/// @nodoc
mixin _$ShippingFromModel {

 String? get id; String? get name;
/// Create a copy of ShippingFromModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingFromModelCopyWith<ShippingFromModel> get copyWith => _$ShippingFromModelCopyWithImpl<ShippingFromModel>(this as ShippingFromModel, _$identity);

  /// Serializes this ShippingFromModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingFromModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ShippingFromModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $ShippingFromModelCopyWith<$Res>  {
  factory $ShippingFromModelCopyWith(ShippingFromModel value, $Res Function(ShippingFromModel) _then) = _$ShippingFromModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$ShippingFromModelCopyWithImpl<$Res>
    implements $ShippingFromModelCopyWith<$Res> {
  _$ShippingFromModelCopyWithImpl(this._self, this._then);

  final ShippingFromModel _self;
  final $Res Function(ShippingFromModel) _then;

/// Create a copy of ShippingFromModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShippingFromModel implements ShippingFromModel {
  const _ShippingFromModel({this.id, this.name});
  factory _ShippingFromModel.fromJson(Map<String, dynamic> json) => _$ShippingFromModelFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of ShippingFromModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingFromModelCopyWith<_ShippingFromModel> get copyWith => __$ShippingFromModelCopyWithImpl<_ShippingFromModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingFromModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingFromModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ShippingFromModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ShippingFromModelCopyWith<$Res> implements $ShippingFromModelCopyWith<$Res> {
  factory _$ShippingFromModelCopyWith(_ShippingFromModel value, $Res Function(_ShippingFromModel) _then) = __$ShippingFromModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$ShippingFromModelCopyWithImpl<$Res>
    implements _$ShippingFromModelCopyWith<$Res> {
  __$ShippingFromModelCopyWithImpl(this._self, this._then);

  final _ShippingFromModel _self;
  final $Res Function(_ShippingFromModel) _then;

/// Create a copy of ShippingFromModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_ShippingFromModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BrandModel {

 String? get id; String? get name; String? get logo;
/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandModelCopyWith<BrandModel> get copyWith => _$BrandModelCopyWithImpl<BrandModel>(this as BrandModel, _$identity);

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logo);

@override
String toString() {
  return 'BrandModel(id: $id, name: $name, logo: $logo)';
}


}

/// @nodoc
abstract mixin class $BrandModelCopyWith<$Res>  {
  factory $BrandModelCopyWith(BrandModel value, $Res Function(BrandModel) _then) = _$BrandModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? logo
});




}
/// @nodoc
class _$BrandModelCopyWithImpl<$Res>
    implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._self, this._then);

  final BrandModel _self;
  final $Res Function(BrandModel) _then;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? logo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BrandModel implements BrandModel {
  const _BrandModel({this.id, this.name, this.logo});
  factory _BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? logo;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandModelCopyWith<_BrandModel> get copyWith => __$BrandModelCopyWithImpl<_BrandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logo);

@override
String toString() {
  return 'BrandModel(id: $id, name: $name, logo: $logo)';
}


}

/// @nodoc
abstract mixin class _$BrandModelCopyWith<$Res> implements $BrandModelCopyWith<$Res> {
  factory _$BrandModelCopyWith(_BrandModel value, $Res Function(_BrandModel) _then) = __$BrandModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? logo
});




}
/// @nodoc
class __$BrandModelCopyWithImpl<$Res>
    implements _$BrandModelCopyWith<$Res> {
  __$BrandModelCopyWithImpl(this._self, this._then);

  final _BrandModel _self;
  final $Res Function(_BrandModel) _then;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? logo = freezed,}) {
  return _then(_BrandModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductCategory {

 String? get id; String? get name;
/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCategoryCopyWith<ProductCategory> get copyWith => _$ProductCategoryCopyWithImpl<ProductCategory>(this as ProductCategory, _$identity);

  /// Serializes this ProductCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ProductCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $ProductCategoryCopyWith<$Res>  {
  factory $ProductCategoryCopyWith(ProductCategory value, $Res Function(ProductCategory) _then) = _$ProductCategoryCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$ProductCategoryCopyWithImpl<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  _$ProductCategoryCopyWithImpl(this._self, this._then);

  final ProductCategory _self;
  final $Res Function(ProductCategory) _then;

/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProductCategory implements ProductCategory {
  const _ProductCategory({this.id, this.name});
  factory _ProductCategory.fromJson(Map<String, dynamic> json) => _$ProductCategoryFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCategoryCopyWith<_ProductCategory> get copyWith => __$ProductCategoryCopyWithImpl<_ProductCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ProductCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProductCategoryCopyWith<$Res> implements $ProductCategoryCopyWith<$Res> {
  factory _$ProductCategoryCopyWith(_ProductCategory value, $Res Function(_ProductCategory) _then) = __$ProductCategoryCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$ProductCategoryCopyWithImpl<$Res>
    implements _$ProductCategoryCopyWith<$Res> {
  __$ProductCategoryCopyWithImpl(this._self, this._then);

  final _ProductCategory _self;
  final $Res Function(_ProductCategory) _then;

/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_ProductCategory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
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
