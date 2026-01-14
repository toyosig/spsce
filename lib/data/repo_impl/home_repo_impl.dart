// lib/data/repo_impl/home_repo_impl.dart
import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/home/toggle_like_response_model.dart';

import '../../domain/repository/home_repository.dart';
import '../data_sources/remote/home_rds.dart';
import '../models/home/product_details.dart';
import '../models/home/products_response_model.dart';

class HomeRepoImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource =
      getIt.get<HomeRemoteDataSource>();

  @override
  Future<ProductsResponseModel> getForYouProducts({required int page, required int limit}) {
    try {
      return _homeRemoteDataSource.getForYouProducts(page: page, limit: limit);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductsResponseModel> getFollowingProducts(
      {required int page, required int limit}) {
    return _homeRemoteDataSource.getFollowingProducts(page: page, limit: limit);
  }

  @override
  Future<ProductDetails> getProductById({String? id}) {
    try {
      return _homeRemoteDataSource.getProductById(id: id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductsResponseModel> getFavourites() {
    try {
      return _homeRemoteDataSource.getFavourites();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ToggleLikeResponseModel> toggleFavourite({String? id}) {
    try {
      return _homeRemoteDataSource.toggleFavourite(id: id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<bool>> removeProduct({String? id}) async {
    try {
      return await _homeRemoteDataSource.removeProduct(id: id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductsResponseModel> getProductsByCategory(String id) async {
    try {
      return await _homeRemoteDataSource.getProductsByCategory(id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
