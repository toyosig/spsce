import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/constant/global.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/brands/add_brand_response_model.dart';
import 'package:circ/data/models/brands/brands_response_model.dart';
import 'package:circ/data/models/categories/catregory_response_model.dart';
import 'package:circ/data/models/home/add_product_req_model.dart';
import 'package:circ/data/models/home/add_product_response_model.dart';
import 'package:circ/data/models/location/shipping_from_response_model.dart';
import 'package:circ/data/models/user_model/add_seller_response_model.dart';
import 'package:circ/data/models/user_model/register_seller_request_model.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/shipping_to.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/home/sizes_by_category_response_model.dart';

class SellProductRemoteDataSource {
  final ApiClient apiClien = ApiClient(ApiPath.baseUrl);

  Future<AddProductResponseModel> submitProductForSale({
    AddProductRequestModel? data,
  }) async {
    try {
      final formDataMap = {
        "title": data?.title,
        "description": data?.description,
        "tags": data?.tags,
        "price": data?.price,
        "subCategoryId": data?.subCategoryId,
        "condition": data?.condition,
        "sizes": data?.size,
        "brand": data?.brandId,
        "color": data?.color,
        "quantity": data?.quantity,
        "shippingFrom": data?.shippingFromId,
        "shippingTo": data?.shippingTo,
        "categoryId": data?.categoryId,
        "isDraft": data?.isDraft,
      };
      if (data?.photos != null && data!.photos.isNotEmpty) {
        final photoList = <MultipartFile>[];

        for (var element in data.photos) {
          final fileExtension = element.split('.').last.toLowerCase();
          String mimeType = 'jpeg';

          if (fileExtension == 'png') {
            mimeType = 'png';
          } else if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
            mimeType = 'jpeg';
          }

          final file = await MultipartFile.fromFile(
            element,
            filename: 'upload.$fileExtension',
            contentType: DioMediaType('image', mimeType),
          );

          photoList.add(file);
        }

        formDataMap['photos'] = photoList;
      }

      if (data?.video != null && data!.video.isNotEmpty) {
        final videoExtension = data.video.split('.').last.toLowerCase();
        String videoMimeType = 'mp4';

        if (videoExtension == 'mov') {
          videoMimeType = 'mov';
        } else if (videoExtension == 'avi') {
          videoMimeType = 'avi';
        }

        final videoFile = await MultipartFile.fromFile(
          data.video,
          filename: 'video.$videoExtension',
          contentType: DioMediaType('video', videoMimeType),
        );

        formDataMap['video'] = videoFile;
      }
      final newFormData = FormData.fromMap(formDataMap);
      final response = await apiClien.postFormData(
        endpoint: ApiPath.sellProduct,
        formData: newFormData,
      );
      final responseData = AddProductResponseModel.fromJson(response.data);
      if (responseData.success == true) {
        return responseData;
      } else {
        throw CustomHTTPException(
          responseData.message ?? "Failed to create Product",
        );
      }
    } catch (e) {
      throw CustomHTTPException(e.toString());
    }
  }

  Future<AddProductResponseModel> updateSellerProduct({
    AddProductRequestModel? data,
    String? id,
  }) async {
    try {
      final formDataMap = {
        "title": data?.title,
        "description": data?.description,
        "tags": data?.tags,
        "price": data?.price,
        "subCategoryId": data?.subCategoryId,
        "condition": data?.condition,
        "sizes": data?.size,
        "brand": data?.brandId,
        "color": data?.color,
        "quantity": data?.quantity,
        "shippingFrom": data?.shippingFromId,
        "shippingTo": data?.shippingTo,
        "categoryId": data?.categoryId,
        "isDraft": data?.isDraft,
      };
      if (data?.photos != null && data!.photos.isNotEmpty) {
        final photoList = <MultipartFile>[];

        for (var element in data.photos) {
          final fileExtension = element.split('.').last.toLowerCase();
          String mimeType = 'jpeg';

          if (fileExtension == 'png') {
            mimeType = 'png';
          } else if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
            mimeType = 'jpeg';
          }

          final file = await MultipartFile.fromFile(
            element,
            filename: 'upload.$fileExtension',
            contentType: DioMediaType('image', mimeType),
          );

          photoList.add(file);
        }

        formDataMap['photos'] = photoList;
      }

      if (data?.video != null && data!.video.isNotEmpty) {
        final videoExtension = data.video.split('.').last.toLowerCase();
        String videoMimeType = 'mp4';

        if (videoExtension == 'mov') {
          videoMimeType = 'mov';
        } else if (videoExtension == 'avi') {
          videoMimeType = 'avi';
        }

        final videoFile = await MultipartFile.fromFile(
          data.video,
          filename: 'video.$videoExtension',
          contentType: DioMediaType('video', videoMimeType),
        );

        formDataMap['video'] = videoFile;
      }
      final newFormData = FormData.fromMap(formDataMap);
      final response = await apiClien.putFormData(
        endpoint: ApiPath.updateProductById(id),
        formData: newFormData,
      );
      final responseData = AddProductResponseModel.fromJson(response.data);
      if (responseData.success == true) {
        return responseData;
      } else {
        throw CustomHTTPException(
          responseData.message ?? "Failed to edit Product",
        );
      }
    } catch (e) {
      throw CustomHTTPException(e.toString());
    }
  }

  Future<CategoriesResponseModel> getMainCategory() async {
    try {
      final response = await apiClien.get(ApiPath.getMainCategories);
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

  Future<AddSellerResponseModel?> registerSeller(
    RegisterSellerRequestModel? data,
  ) async {
    try {
      final response = await apiClien.post(
        endpoint: ApiPath.createSeller,
        data: data!.toJson(),
      );
      return AddSellerResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CategoriesResponseModel> getCategory(String id) async {
    try {
      final response = await apiClien.get(ApiPath.getCategoriesByMainCatId(id));
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
      final response = await apiClien.get(ApiPath.getSubCategoriesByCatId(id));
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
      final response = await apiClien.get(ApiPath.getBrands);
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

  Future<ShippingFromResponseModel> getShipFrom() async {
    try {
      final response = await apiClien.get(ApiPath.getShipFromLocations);
      final data = ShippingFromResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ShippingToOption>> getShipTo() async {
    try {
      return shippingToList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SizesByCategoryResponseModel> getSizesByCategory(
    String categoryId,
  ) async {
    try {
      final response = await apiClien.get(
        ApiPath.getSizesByCategory(categoryId),
      );
      final data = SizesByCategoryResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AddBrandResponseModel> addNewBrand(
    String brandName, {
    XFile? logo,
  }) async {
    try {
      final req = {"name": brandName};
      final response = await apiClien.post(
        endpoint: ApiPath.addBrand,
        data: req,
      );
      final data = AddBrandResponseModel.fromJson(response.data);
      if (response.statusCode == 201) {
        return data;
      } else {
        throw Exception(data.message ?? 'Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
