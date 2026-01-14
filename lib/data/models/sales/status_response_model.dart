import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_response_model.freezed.dart';
part 'status_response_model.g.dart';

@freezed
abstract class StatusResponseModel with _$StatusResponseModel {
  const factory StatusResponseModel({
    String? message,
    bool? success,
  }) = _StatusResponseModel;

  factory StatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StatusResponseModelFromJson(json);
}