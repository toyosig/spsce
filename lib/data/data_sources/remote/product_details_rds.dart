import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import '../../models/home/products_response_model.dart';

class ProductDetailsRds {
  final ApiClient _apiClient = ApiClient(ApiPath.baseUrl);

  /// Add to cart
  Future<bool?> addToCart({String? id}) async {
    try {
      final response = await _apiClient.post(
        endpoint: '${ApiPath.addToCart}/$id',
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error in data source during login: $e');
    }
  }

  /// Remove from cart
  Future<bool?> removeFromCart({String? id}) async {
    try {
      final response = await _apiClient.delete(
        endpoint: '${ApiPath.removeFromCart}/$id',
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error in data source during login: $e');
    }
  }

  /// Get cart
  Future<ProductsResponseModel> getCart() async {
    try {
      final response = await _apiClient.get(ApiPath.getCart);
      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        return ProductsResponseModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Error in data source during login: $e');
    }
  }

  /// Update product details
  Future<bool?> addOfferToProductRds({
    String? receiverId,
    String? productId,
    int? price,
    String? description,
  }) async {
    try {
      final response = await _apiClient.post(
        endpoint: '${ApiPath.addOffer}/$receiverId/$productId',
        data: {'price': price, 'message': description},
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error in data source during login: $e');
    }
  }

  /// Get marketplace fee
  Future<double> getMarketplaceFee() async {
    try {
      final response = await _apiClient.get(ApiPath.getMarketplaceFee);
      if (response.statusCode == 200) {
        final marketplaceFee =
            response.data['data']['buyerCommissionPercentage'];
        return marketplaceFee.toDouble();
      } else {
        return 0.0;
      }
    } catch (e) {
      throw Exception('Error in data source during get marketplace fee: $e');
    }
  }
}
