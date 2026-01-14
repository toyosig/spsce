import 'package:circ/data/models/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_response.freezed.dart';
part 'user_model_response.g.dart';

@freezed
 abstract class UserResponseModel with _$UserResponseModel {
  const factory UserResponseModel({
     int? statusCode,
     bool? success,
     String? message,
    String? error,
     UserModel? data,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}

