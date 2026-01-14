import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/home/toggle_like_response_model.dart';

import '../../../core/constant/api_endpoints.dart';
import '../../../core/networks/api_client.dart';
import '../../models/home/product_details.dart';
import '../../models/home/products_response_model.dart';

class HomeRemoteDataSource {
  final ApiClient apiClient = ApiClient(ApiPath.baseUrl);
  Future<ProductsResponseModel> getForYouProducts({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await apiClient.get(
        ApiPath.getAllProducts,
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = ProductsResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<ProductsResponseModel> getFollowingProducts({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await apiClient.get(
        ApiPath.getFollowingProducts,
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      return ProductsResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<ProductDetails> getProductById({String? id}) async {
    try {
      final response = await apiClient.get('${ApiPath.getProductById}/$id');
      return ProductDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Error in data source during login: $e');
    }
  }

  Future<ToggleLikeResponseModel> toggleFavourite({String? id}) async {
    try {
      final response = await apiClient.post(
        endpoint: '${ApiPath.toggleFavorite}/$id',
      );
      final data = ToggleLikeResponseModel.fromJson(response.data);
      if (data.success == true) {
        return data;
      } else {
        throw Exception("${data.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductsResponseModel> getFavourites() async {
    try {
      final response = await apiClient.get(ApiPath.getFavorites);
      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<ApiResponse<bool>> removeProduct({String? id}) async {
    try {
      final response = await apiClient.delete(
        endpoint: '${ApiPath.removeProduct}/$id',
      );
      return ApiResponse(
        success: response.data['success'],
        message: response.data['message'],
        data: response.data['success'],
      );
    } catch (e) {
      throw Exception('Error in data source during login: $e');
    }
  }

  Future<ProductsResponseModel> getProductsByCategory(String id) async {
    final response = await apiClient.get(ApiPath.setProductsByCategory(id));
    if (response.statusCode == 200) {
      final model = ProductsResponseModel.fromJson(response.data);
      return model;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
