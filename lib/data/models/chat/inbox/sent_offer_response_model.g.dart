// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_offer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SentOffersResponseModel _$SentOffersResponseModelFromJson(
  Map<String, dynamic> json,
) => _SentOffersResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : SentOfferData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SentOffersResponseModelToJson(
  _SentOffersResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_SentOfferData _$SentOfferDataFromJson(Map<String, dynamic> json) =>
    _SentOfferData(
      offers:
          (json['offers'] as List<dynamic>?)
              ?.map((e) => InboxOffers.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SentOfferDataToJson(_SentOfferData instance) =>
    <String, dynamic>{'offers': instance.offers};
