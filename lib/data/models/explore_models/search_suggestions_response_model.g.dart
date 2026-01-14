// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggestions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchSuggestionsResponseModel _$SearchSuggestionsResponseModelFromJson(
  Map<String, dynamic> json,
) => _SearchSuggestionsResponseModel(
  success: json['success'] as bool,
  suggestions:
      (json['suggestions'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$SearchSuggestionsResponseModelToJson(
  _SearchSuggestionsResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'suggestions': instance.suggestions,
};
