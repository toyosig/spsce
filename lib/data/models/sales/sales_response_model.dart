import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_response_model.freezed.dart';
part 'sales_response_model.g.dart';

@freezed
abstract class SalesResponseModel with _$SalesResponseModel {
  const factory SalesResponseModel({
    String? message,
    bool? success,
    List<SalesOrderModel>? orders,
  }) = _SalesResponseModel;

  factory SalesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SalesResponseModelFromJson(json);
}
