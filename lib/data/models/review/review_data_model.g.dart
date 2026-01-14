// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewDataModel _$ReviewDataModelFromJson(Map<String, dynamic> json) =>
    _ReviewDataModel(
      id: json['id'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      reviewer:
          json['reviewer'] == null
              ? null
              : ReviewUserModel.fromJson(
                json['reviewer'] as Map<String, dynamic>,
              ),
      reviewedUser:
          json['reviewedUser'] == null
              ? null
              : ReviewUserModel.fromJson(
                json['reviewedUser'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ReviewDataModelToJson(_ReviewDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'text': instance.text,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'reviewer': instance.reviewer,
      'reviewedUser': instance.reviewedUser,
    };

_ReviewUserModel _$ReviewUserModelFromJson(Map<String, dynamic> json) =>
    _ReviewUserModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      profilePic: json['profilePic'] as String?,
    );

Map<String, dynamic> _$ReviewUserModelToJson(_ReviewUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profilePic': instance.profilePic,
    };
