import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_suggestions_response_model.freezed.dart';
part 'search_suggestions_response_model.g.dart';

@freezed
abstract class SearchSuggestionsResponseModel with _$SearchSuggestionsResponseModel {
  const factory SearchSuggestionsResponseModel({
    required bool success,
    required List<String> suggestions,
  }) = _SearchSuggestionsResponseModel;

  factory SearchSuggestionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionsResponseModelFromJson(json);
}
