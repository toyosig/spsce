// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_like_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToggleLikeData _$ToggleLikeDataFromJson(Map<String, dynamic> json) =>
    _ToggleLikeData(
      liked: json['liked'] as bool,
      product: ProductsData.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToggleLikeDataToJson(_ToggleLikeData instance) =>
    <String, dynamic>{'liked': instance.liked, 'product': instance.product};

_ToggleLikeResponseModel _$ToggleLikeResponseModelFromJson(
  Map<String, dynamic> json,
) => _ToggleLikeResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : ToggleLikeData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ToggleLikeResponseModelToJson(
  _ToggleLikeResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
