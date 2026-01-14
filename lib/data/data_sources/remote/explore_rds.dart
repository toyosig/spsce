import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/brands/brands_response_model.dart';
import 'package:circ/data/models/categories/catregory_response_model.dart';
import 'package:circ/data/models/explore_models/search_suggestions_response_model.dart';
import 'package:circ/data/models/home/products_response_model.dart';

class ExploreRds {
  final ApiClient apiClient = ApiClient(ApiPath.baseUrl);

  Future<CategoriesResponseModel> getMainCategory() async {
    try {
      final response = await apiClient.get(ApiPath.getMainCategories);
      final data = CategoriesResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CategoriesResponseModel> getCategory(String id) async {
    try {
      final response = await apiClient.get(
        ApiPath.getCategoriesByMainCatId(id),
      );
      final data = CategoriesResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CategoriesResponseModel> getSubCategories(String id) async {
    try {
      final response = await apiClient.get(ApiPath.getSubCategoriesByCatId(id));
      final data = CategoriesResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<BrandResponseModel> getbrands() async {
    try {
      final response = await apiClient.get(ApiPath.getBrands);
      final data = BrandResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductsResponseModel> getProductsByBrandAndCategory({
    required String keyword,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await apiClient.get(
        ApiPath.searchByKeyword(keyword),
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );

      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Error fetching products by brand and category: $e');
    }
  }

  Future<ProductsResponseModel> getProductsByCategory({
    required String id,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await apiClient.get(
        ApiPath.setProductsByCategory(id),
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );

      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Error fetching products by brand and category: $e');
    }
  }

  Future<ProductsResponseModel> getProductsByBrand({
    required String id,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await apiClient.get(
        ApiPath.getProductsByBrands(id),
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );

      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Error fetching products by brand : $e');
    }
  }

  Future<ProductsResponseModel> searchProducts({
    required String query,
    String? brand,
    String? color,
    int? priceMin,
    int? priceMax,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final queryParams = {
        'q': query,
        if (brand != null) 'brand': brand,
        if (color != null) 'color': color,
        if (priceMin != null) 'priceMin': priceMin.toString(),
        if (priceMax != null) 'priceMax': priceMax.toString(),
        'page': page.toString(),
        'limit': limit.toString(),
      };
      final response = await apiClient.get(
        ApiPath.search,
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Error searching products: $e');
    }
  }

  Future<SearchSuggestionsResponseModel> fetchSearchSuggestions(
    String query,
  ) async {
    try {
      final response = await apiClient.get(
        ApiPath.searchSuggestions,
        queryParameters: {'keyword': query},
      );
      final data = SearchSuggestionsResponseModel.fromJson(response.data);
      if (data.success) {
        return data;
      } else {
        throw Exception('Failed to fetch suggestions');
      }
    } catch (e) {
      throw Exception('Error searching products: $e');
    }
  }
}
