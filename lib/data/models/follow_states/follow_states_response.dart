import 'package:circ/data/models/follow_states/follow_states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_states_response.freezed.dart';
part 'follow_states_response.g.dart';

@freezed
abstract class FollowStatesResponseModel with _$FollowStatesResponseModel {
  const factory FollowStatesResponseModel({
    String? message,
    bool? success,
    List<FollowStates>? data,
    int? total,
    int? page,
    int? limit,
    int? totalPages,
  }) = _FollowStatesResponseModel;

  factory FollowStatesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FollowStatesResponseModelFromJson(json);
}
