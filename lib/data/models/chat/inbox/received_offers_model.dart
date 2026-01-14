import 'package:circ/data/models/chat/inbox/inbox_offers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'received_offers_model.freezed.dart';
part 'received_offers_model.g.dart';

@freezed
abstract class ReceivedOffersResponse with _$ReceivedOffersResponse {
  const factory ReceivedOffersResponse({
    required bool success,
    required String message,
    required OfferData data,
  }) = _ReceivedOffersResponse;

  factory ReceivedOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceivedOffersResponseFromJson(json);
}

@freezed
abstract class OfferData with _$OfferData {
  const factory OfferData({
    required List<InboxOffers> offers,
  }) = _OfferData;

  factory OfferData.fromJson(Map<String, dynamic> json) =>
      _$OfferDataFromJson(json);
}
