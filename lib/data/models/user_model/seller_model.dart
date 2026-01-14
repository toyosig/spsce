import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_model.freezed.dart';
part 'seller_model.g.dart';

@freezed
abstract class SellerModel with _$SellerModel {
  const factory SellerModel({
    String? id,
    String? fullName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? streetAddress,
    String? city,
    String? state,
    String? postalCode,
    String? bankName,
    String? accountNumber,
    String? bankVerificationNumber,
    String? nationalIdentityNumber,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SellerModel;

  factory SellerModel.fromJson(Map<String, dynamic> json) =>
      _$SellerModelFromJson(json);
}
