import 'package:circ/core/constant/global.dart';

import '../../domain/repository/product_details_repository.dart';
import '../data_sources/remote/product_details_rds.dart';
import '../models/home/products_response_model.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepository {
  final ProductDetailsRds _cartRds = getIt.get<ProductDetailsRds>();

  /// Add to cart
  @override
  Future<bool?> addToCart({String? id}) async {
    try {
      return await _cartRds.addToCart(id: id);
    } catch (e) {
      throw Exception('Error in repository during add to cart: $e');
    }
  }

  /// Get cart
  @override
  Future<ProductsResponseModel> getCart() {
    try {
      return _cartRds.getCart();
    } catch (e) {
      throw Exception('Error in repository during get cart: $e');
    }
  }

  /// Remove from cart
  @override
  Future<bool?> removeFromCart({String? id}) {
    try {
      return _cartRds.removeFromCart(id: id);
    } catch (e) {
      throw Exception('Error in repository during remove from cart: $e');
    }
  }

  @override
  Future<bool?> addOfferToProduct({
    String? receiverId,
    String? productId,
    String? price,
    String? description,
  }) {
    try {
      return _cartRds.addOfferToProductRds(
        receiverId: receiverId,
        productId: productId,
        price: int.parse(price ?? '0'),
        description: description,
      );
    } catch (e) {
      throw Exception('Error in repository during update product details: $e');
    }
  }
}
