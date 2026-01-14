import 'package:circ/data/models/brands/brands_response_model.dart';
import 'package:circ/data/models/categories/catregory_response_model.dart';
import 'package:circ/data/models/explore_models/search_suggestions_response_model.dart';
import 'package:circ/data/models/home/products_response_model.dart';

abstract class ExploreRepository {
  Future<CategoriesResponseModel> getMainCategory();
  Future<CategoriesResponseModel> getCategory(String id);
  Future<CategoriesResponseModel> getSubCategories(String id);
  Future<BrandResponseModel> getBrands();
  Future<ProductsResponseModel> getProductsByBrandAndCategory({
    required String keyword,
    int page,
    int limit,
  });
  Future<ProductsResponseModel> getProductsByCategory({
    required String id,
    int page,
    int limit,
  });
  Future<ProductsResponseModel> getProductsByBrand({
    required String id,
    int page,
    int limit,
  });
  Future<ProductsResponseModel> searchProducts({
    required String query,
    String? brand,
    String? color,
    int? priceMin,
    int? priceMax,
    int page,
    int limit,
  });
  Future<SearchSuggestionsResponseModel> fetchSearchSuggestions(String query);
}
