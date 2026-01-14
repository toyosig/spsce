import '../../data/models/home/products_response_model.dart';

abstract class ProductDetailsRepository {
  /// Add to cart
  Future<bool?> addToCart({String? id});

  /// Remove from cart
  Future<bool?> removeFromCart({String? id});

  /// Get cart
  Future<ProductsResponseModel> getCart();

  /// Update product details
  Future<bool?> addOfferToProduct({
    String? receiverId,
    String? productId,
    String? price,
    String? description,
  });
}
