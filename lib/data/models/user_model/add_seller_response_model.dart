import 'package:circ/data/models/auth/auth_user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_seller_response_model.freezed.dart';
part 'add_seller_response_model.g.dart';

@freezed
abstract class AddSellerResponseModel with _$AddSellerResponseModel {
  const factory AddSellerResponseModel({
    int? statusCode,
    bool? success,
    String? error,
    String? message,
    AddSellerData? data,
  }) = _AddSellerResponseModel;

  factory AddSellerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddSellerResponseModelFromJson(json);
}

@freezed
abstract class AddSellerData with _$AddSellerData {
  const factory AddSellerData({
    String? id,
    String? fullName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? streetAddress,
    String? city,
    String? state,
    String? postalCode,
    String? bankVerificationNumber,
    String? nationalIdentityNumber,
    String? bankName,
    double? availableBalance,
    double? pendingBalance,
    String? accountNumber,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    AuthUserModel? user,
  }) = _AddSellerData;

  factory AddSellerData.fromJson(Map<String, dynamic> json) =>
      _$AddSellerDataFromJson(json);
}
