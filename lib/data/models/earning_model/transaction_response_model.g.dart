// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionResponseModel _$TransactionResponseModelFromJson(
  Map<String, dynamic> json,
) => _TransactionResponseModel(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => TransactionDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalCount: (json['totalCount'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$TransactionResponseModelToJson(
  _TransactionResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'totalCount': instance.totalCount,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
};

_TransactionDataModel _$TransactionDataModelFromJson(
  Map<String, dynamic> json,
) => _TransactionDataModel(
  id: json['id'] as String?,
  orderId: json['orderId'] as String?,
  userId: json['userId'] as String?,
  type: json['type'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: _parseDateTime(json['createdAt'] as String?),
  updatedAt: _parseDateTime(json['updatedAt'] as String?),
  paymentReference: json['paymentReference'] as String?,
);

Map<String, dynamic> _$TransactionDataModelToJson(
  _TransactionDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'orderId': instance.orderId,
  'userId': instance.userId,
  'type': instance.type,
  'amount': instance.amount,
  'status': instance.status,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'paymentReference': instance.paymentReference,
};
