import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/home/toggle_like_response_model.dart';

import '../../data/models/home/product_details.dart';
import '../../data/models/home/products_response_model.dart';

abstract class HomeRepository {
  Future<ProductsResponseModel> getForYouProducts(
      {required int page, required int limit});
  Future<ProductsResponseModel> getFollowingProducts(
      {required int page, required int limit});
  Future<ProductDetails> getProductById({String? id});
  Future<ToggleLikeResponseModel> toggleFavourite({String? id});
  Future<ProductsResponseModel> getFavourites();
  Future<ApiResponse<bool>> removeProduct({String? id});
  Future<ProductsResponseModel> getProductsByCategory(String id);
}
