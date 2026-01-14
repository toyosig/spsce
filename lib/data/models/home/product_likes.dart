import 'package:circ/data/models/home/product_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_likes.freezed.dart';
part 'product_likes.g.dart';

@freezed
abstract class ProductLikes with _$ProductLikes {
  const factory ProductLikes({String? id, ProductUser? user}) = _ProductLikes;

  factory ProductLikes.fromJson(Map<String, dynamic> json) =>
      _$ProductLikesFromJson(json);
}
