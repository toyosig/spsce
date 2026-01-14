import 'package:circ/data/models/auth/auth_user_model.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_model.freezed.dart';
part 'sales_order_model.g.dart';

@freezed
abstract class SalesOrderModel with _$SalesOrderModel {
  const factory SalesOrderModel({
    String? id,
    String? buyerId,
    AuthUserModel? buyer,
    String? fullName,
    String? phoneNumber,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? paymentType,
    String? paymentId,
    String? paymentStatus,
    double? marketplaceFee,
    double? total,
    bool? dispatch,
    bool? deliver,
    String? createdAt,
    List<SalesOrderItemModel>? items,
  }) = _SalesOrderModel;

  factory SalesOrderModel.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderModelFromJson(json);
}

@freezed
abstract class SalesOrderItemModel with _$SalesOrderItemModel {
  const factory SalesOrderItemModel({
    String? id,
    String? productId,
    int? quantity,
    String? sellerId,
    String? sellerUsername,
    double? decidedPrice,
    String? productTitle,
    double? productPrice,
    String? conversationId,
    bool? isDirect,
    ProductsData? product,
    String? status,
  }) = _SalesOrderItemModel;

  factory SalesOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderItemModelFromJson(json);
}
