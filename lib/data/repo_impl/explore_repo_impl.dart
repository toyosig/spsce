import 'package:circ/data/data_sources/remote/explore_rds.dart';
import 'package:circ/data/models/brands/brands_response_model.dart';
import 'package:circ/data/models/categories/catregory_response_model.dart';
import 'package:circ/data/models/explore_models/search_suggestions_response_model.dart';
import 'package:circ/data/models/home/products_response_model.dart';
import 'package:circ/domain/repository/explore_repositry.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRds remoteDataSource = ExploreRds();

  @override
  Future<CategoriesResponseModel> getMainCategory() async {
    try {
      return await remoteDataSource.getMainCategory();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoriesResponseModel> getCategory(String id) async {
    try {
      return await remoteDataSource.getCategory(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoriesResponseModel> getSubCategories(String id) async {
    try {
      return await remoteDataSource.getSubCategories(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<BrandResponseModel> getBrands() async {
    try {
      return await remoteDataSource.getbrands();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductsResponseModel> getProductsByBrandAndCategory({
    required String keyword,
    int page = 1,
    int limit = 10,
  }) {
    try {
      return remoteDataSource.getProductsByBrandAndCategory(
        keyword: keyword,
        page: page,
        limit: limit,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductsResponseModel> getProductsByCategory({
    required String id,
    int page = 1,
    int limit = 10,
  }) {
    try {
      return remoteDataSource.getProductsByCategory(
        id: id,
        page: page,
        limit: limit,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductsResponseModel> getProductsByBrand({
    required String id,
    int page = 1,
    int limit = 10,
  }) {
    try {
      return remoteDataSource.getProductsByBrand(
        id: id,
        page: page,
        limit: limit,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductsResponseModel> searchProducts({
    required String query,
    String? brand,
    String? color,
    int? priceMin,
    int? priceMax,
    int page = 1,
    int limit = 10,
  }) {
    try {
      return remoteDataSource.searchProducts(
        query: query,
        brand: brand,
        color: color,
        priceMin: priceMin,
        priceMax: priceMax,
        page: page,
        limit: limit,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<SearchSuggestionsResponseModel> fetchSearchSuggestions(
    String query,
  ) async {
    try {
      return await remoteDataSource.fetchSearchSuggestions(query);
    } catch (e) {
      throw Exception(e);
    }
  }
}
