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

abstract class SellProductRepository {
  Future<AddProductResponseModel> submitProductForSale({
    AddProductRequestModel? data,
  });
  Future<AddProductResponseModel> updateSellerProduct({
    AddProductRequestModel? data,
    String? id,
  });
  Future<AddSellerResponseModel?> registerSeller(
    RegisterSellerRequestModel? data,
  );
  Future<CategoriesResponseModel> getMainCategory();
  Future<CategoriesResponseModel> getCategory(String id);
  Future<CategoriesResponseModel> getSubCategories(String id);
  Future<BrandResponseModel> getbrands();
  Future<ShippingFromResponseModel> getShipFrom();
  Future<List<ShippingToOption>> getShipTo();
  Future<SizesByCategoryResponseModel> getSizesByCategory(String categoryId);
  Future<AddBrandResponseModel> addNewBrand(String brandName);
}
