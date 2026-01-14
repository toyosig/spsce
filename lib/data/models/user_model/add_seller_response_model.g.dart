// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_seller_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddSellerResponseModel _$AddSellerResponseModelFromJson(
  Map<String, dynamic> json,
) => _AddSellerResponseModel(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  success: json['success'] as bool?,
  error: json['error'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : AddSellerData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddSellerResponseModelToJson(
  _AddSellerResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'success': instance.success,
  'error': instance.error,
  'message': instance.message,
  'data': instance.data,
};

_AddSellerData _$AddSellerDataFromJson(Map<String, dynamic> json) =>
    _AddSellerData(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      dateOfBirth:
          json['dateOfBirth'] == null
              ? null
              : DateTime.parse(json['dateOfBirth'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      streetAddress: json['streetAddress'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      bankVerificationNumber: json['bankVerificationNumber'] as String?,
      nationalIdentityNumber: json['nationalIdentityNumber'] as String?,
      bankName: json['bankName'] as String?,
      availableBalance: (json['availableBalance'] as num?)?.toDouble(),
      pendingBalance: (json['pendingBalance'] as num?)?.toDouble(),
      accountNumber: json['accountNumber'] as String?,
      userId: json['userId'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      user:
          json['user'] == null
              ? null
              : AuthUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddSellerDataToJson(_AddSellerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'bankVerificationNumber': instance.bankVerificationNumber,
      'nationalIdentityNumber': instance.nationalIdentityNumber,
      'bankName': instance.bankName,
      'availableBalance': instance.availableBalance,
      'pendingBalance': instance.pendingBalance,
      'accountNumber': instance.accountNumber,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'user': instance.user,
    };
