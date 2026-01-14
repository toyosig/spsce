import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_response_model.freezed.dart';
part 'policy_response_model.g.dart';

@freezed
abstract class PolicyResponse with _$PolicyResponse {
  const factory PolicyResponse({
    required bool success,
    required String message,
    required List<PolicyData> data,
  }) = _PolicyResponse;

  factory PolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PolicyResponseFromJson(json);
}

@freezed
abstract class PolicyData with _$PolicyData {
  const factory PolicyData({
    required String id,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PolicyData;

  factory PolicyData.fromJson(Map<String, dynamic> json) =>
      _$PolicyDataFromJson(json);
}
