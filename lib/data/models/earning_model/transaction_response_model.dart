import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response_model.freezed.dart';
part 'transaction_response_model.g.dart';

@freezed
abstract class TransactionResponseModel with _$TransactionResponseModel {
  const factory TransactionResponseModel({
    int? statusCode,
    bool? success,
    String? message,
    List<TransactionDataModel>? data,
    int? totalCount,
    int? page,
    int? limit,
    int? totalPages,
  }) = _TransactionResponseModel;

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseModelFromJson(json);
}

@freezed
abstract class TransactionDataModel with _$TransactionDataModel {
  const factory TransactionDataModel({
    String? id,
    String? orderId,
    String? userId,
    String? type,
    int? amount,
    String? status,
    @JsonKey(fromJson: _parseDateTime) DateTime? createdAt,
    @JsonKey(fromJson: _parseDateTime) DateTime? updatedAt,
    String? paymentReference,
  }) = _TransactionDataModel;

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataModelFromJson(json);
}

DateTime? _parseDateTime(String? date) =>
    date == null ? null : DateTime.tryParse(date);
