import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/brands/add_brand_response_model.dart';
import 'package:circ/data/models/brands/brands_response_model.dart';
import 'package:circ/data/models/home/add_product_req_model.dart';
import 'package:circ/data/models/categories/catregory_response_model.dart';
import 'package:circ/data/models/home/add_product_response_model.dart';
import 'package:circ/data/models/location/shipping_from_response_model.dart';
import 'package:circ/data/models/user_model/add_seller_response_model.dart';
import 'package:circ/data/models/user_model/register_seller_request_model.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/shipping_to.dart';
import 'package:circ/data/models/home/sizes_by_category_response_model.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import '../../domain/repository/sell_product_repository.dart';
import '../data_sources/remote/sell_product_rds.dart';
import 'package:image_picker/image_picker.dart';

class SellProductRepoImpl implements SellProductRepository {
  final SellProductRemoteDataSource _sellerRds = getIt
      .get<SellProductRemoteDataSource>();
  @override
  Future<AddProductResponseModel> submitProductForSale({
    AddProductRequestModel? data,
  }) async {
    try {
      return await _sellerRds.submitProductForSale(data: data);
    } catch (e) {
      throw CustomHTTPException(e.toString());
    }
  }

  @override
  Future<AddProductResponseModel> updateSellerProduct({
    AddProductRequestModel? data,
    String? id,
  }) async {
    try {
      return await _sellerRds.updateSellerProduct(data: data, id: id);
    } catch (e) {
      throw CustomHTTPException(e.toString());
    }
  }

  @override
  Future<AddSellerResponseModel?> registerSeller(
    RegisterSellerRequestModel? data,
  ) async {
    try {
      return await _sellerRds.registerSeller(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoriesResponseModel> getMainCategory() async {
    try {
      return await _sellerRds.getMainCategory();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoriesResponseModel> getCategory(String id) async {
    try {
      return await _sellerRds.getCategory(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoriesResponseModel> getSubCategories(String id) async {
    try {
      return await _sellerRds.getSubCategories(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<BrandResponseModel> getbrands() async {
    try {
      return await _sellerRds.getbrands();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ShippingFromResponseModel> getShipFrom() async {
    try {
      return await _sellerRds.getShipFrom();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ShippingToOption>> getShipTo() async {
    try {
      return await _sellerRds.getShipTo();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<SizesByCategoryResponseModel> getSizesByCategory(
    String categoryId,
  ) async {
    try {
      return await _sellerRds.getSizesByCategory(categoryId);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AddBrandResponseModel> addNewBrand(
    String brandName, {
    XFile? logo,
  }) async {
    try {
      return await _sellerRds.addNewBrand(brandName);
    } catch (e) {
      throw Exception(e);
    }
  }
}
