// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellerModel _$SellerModelFromJson(Map<String, dynamic> json) => _SellerModel(
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
  bankName: json['bankName'] as String?,
  accountNumber: json['accountNumber'] as String?,
  bankVerificationNumber: json['bankVerificationNumber'] as String?,
  nationalIdentityNumber: json['nationalIdentityNumber'] as String?,
  userId: json['userId'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$SellerModelToJson(_SellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
      'bankVerificationNumber': instance.bankVerificationNumber,
      'nationalIdentityNumber': instance.nationalIdentityNumber,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
