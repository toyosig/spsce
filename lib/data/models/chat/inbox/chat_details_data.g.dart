// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDetailData _$ChatDetailDataFromJson(Map<String, dynamic> json) =>
    _ChatDetailData(
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      averageSellerRating: (json['averageSellerRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ChatDetailDataToJson(_ChatDetailData instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'averageSellerRating': instance.averageSellerRating,
    };
