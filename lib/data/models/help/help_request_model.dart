import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_request_model.freezed.dart';
part 'help_request_model.g.dart';

@freezed
abstract class HelpRequestModel with _$HelpRequestModel {
  const factory HelpRequestModel({
    required List<String> reasons,
    required String description,
    required String orderId,
  }) = _HelpRequestModel;

  factory HelpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HelpRequestModelFromJson(json);
}
