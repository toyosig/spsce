// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceivedOffersResponse _$ReceivedOffersResponseFromJson(
  Map<String, dynamic> json,
) => _ReceivedOffersResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: OfferData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReceivedOffersResponseToJson(
  _ReceivedOffersResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_OfferData _$OfferDataFromJson(Map<String, dynamic> json) => _OfferData(
  offers:
      (json['offers'] as List<dynamic>)
          .map((e) => InboxOffers.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$OfferDataToJson(_OfferData instance) =>
    <String, dynamic>{'offers': instance.offers};
