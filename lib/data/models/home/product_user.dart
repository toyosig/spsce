import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_user.freezed.dart';
part 'product_user.g.dart';

@freezed
abstract class ProductUser with _$ProductUser {
  const factory ProductUser({
    String? id,
    String? username,
    String? profilePic,
  }) = _ProductUser;

  factory ProductUser.fromJson(Map<String, dynamic> json) =>
      _$ProductUserFromJson(json);
}
