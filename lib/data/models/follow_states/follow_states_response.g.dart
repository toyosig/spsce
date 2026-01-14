// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_states_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowStatesResponseModel _$FollowStatesResponseModelFromJson(
  Map<String, dynamic> json,
) => _FollowStatesResponseModel(
  message: json['message'] as String?,
  success: json['success'] as bool?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => FollowStates.fromJson(e as Map<String, dynamic>))
          .toList(),
  total: (json['total'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$FollowStatesResponseModelToJson(
  _FollowStatesResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
};
