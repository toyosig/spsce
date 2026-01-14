// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_likes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductLikes _$ProductLikesFromJson(Map<String, dynamic> json) =>
    _ProductLikes(
      id: json['id'] as String?,
      user:
          json['user'] == null
              ? null
              : ProductUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductLikesToJson(_ProductLikes instance) =>
    <String, dynamic>{'id': instance.id, 'user': instance.user};
