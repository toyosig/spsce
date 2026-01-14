import 'package:circ/data/models/chat/inbox/inbox_offers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sent_offer_response_model.freezed.dart';
part 'sent_offer_response_model.g.dart';

@freezed
abstract class SentOffersResponseModel with _$SentOffersResponseModel {
  const factory SentOffersResponseModel({
    bool? success,
    String? message,
    SentOfferData? data,
  }) = _SentOffersResponseModel;

  factory SentOffersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SentOffersResponseModelFromJson(json);
}

@freezed
abstract class SentOfferData with _$SentOfferData {
  const factory SentOfferData({
    List<InboxOffers>? offers,
  }) = _SentOfferData;

  factory SentOfferData.fromJson(Map<String, dynamic> json) =>
      _$SentOfferDataFromJson(json);
}
