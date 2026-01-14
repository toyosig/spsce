import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_all_read_response_model.freezed.dart';
part 'mark_all_read_response_model.g.dart';

@freezed
abstract class MarkAllReadResponseModel with _$MarkAllReadResponseModel {
  const factory MarkAllReadResponseModel({
    bool? success,
    String? message,
    MarkAllReadData? data,
  }) = _MarkAllReadResponseModel;

  factory MarkAllReadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MarkAllReadResponseModelFromJson(json);
}

@freezed
abstract class MarkAllReadData with _$MarkAllReadData {
  const factory MarkAllReadData({int? count}) = _MarkAllReadData;

  factory MarkAllReadData.fromJson(Map<String, dynamic> json) =>
      _$MarkAllReadDataFromJson(json);
}
