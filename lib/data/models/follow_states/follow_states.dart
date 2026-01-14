import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_states.freezed.dart';
part 'follow_states.g.dart';

@freezed
abstract class FollowStates with _$FollowStates {
  const factory FollowStates({
    String? id,
    String? email,
    String? username,
    String? profilePic,
    String? location,
    String? bio,
    String? createdAt,
  }) = _FollowStates;

  factory FollowStates.fromJson(Map<String, dynamic> json) =>
      _$FollowStatesFromJson(json);
}
