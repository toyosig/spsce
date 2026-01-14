// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersReviewData _$UsersReviewDataFromJson(Map<String, dynamic> json) =>
    _UsersReviewData(
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewDataModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      averageRating: (json['averageRating'] as num?)?.toInt(),
      totalReviews: (json['totalReviews'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsersReviewDataToJson(_UsersReviewData instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
      'averageRating': instance.averageRating,
      'totalReviews': instance.totalReviews,
    };
