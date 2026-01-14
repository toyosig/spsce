import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/auth/change_password_request_model.dart';
import 'package:circ/data/models/auth/change_password_response.dart';
import 'package:circ/data/models/follow_states/follow_states_response.dart';
import 'package:circ/data/models/home/products_response_model.dart';
import 'package:circ/data/models/notifications/all_notification_response_model.dart';
import 'package:circ/data/models/notifications/mark_all_read_response_model.dart';
import 'package:circ/data/models/notifications/toggle_notification.dart';
import 'package:circ/data/models/review/get_users_review_response_model.dart';
import 'package:circ/data/models/review/review_request_model.dart';
import 'package:circ/data/models/review/review_response_model.dart';
import 'package:circ/data/models/sales/cancel_order_response_model.dart';
import 'package:circ/data/models/sales/sales_response_model.dart';
import 'package:circ/data/models/sales/status_response_model.dart';
import 'package:circ/data/models/settings/policy_response_model.dart';
import 'package:circ/data/models/user_model/edit_profile_request_model.dart';
import 'package:circ/data/models/user_model/edit_profile_response_model.dart';
import 'package:circ/data/models/user_model/follow_toggle_model.dart';
import 'package:circ/data/models/user_model/follow_user_model.dart';
import 'package:circ/data/models/user_model/user_model_response.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSource {
  final ApiClient _apiClient = ApiClient(ApiPath.baseUrl);

  Future<UserResponseModel> getUserProfile() async {
    try {
      final response = await _apiClient.get(ApiPath.getProfile);
      return UserResponseModel.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<ProductsResponseModel> getMyProducts({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.getMyProducts,
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = ProductsResponseModel.fromJson(response.data);
      if (data.success == true) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductsResponseModel> getMyFavProducts({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.getFavorites,
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = ProductsResponseModel.fromJson(response.data);
      if (data.success == true) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserResponseModel> getOtherUserProfile({
    required String userId,
  }) async {
    try {
      final response = await _apiClient.get(ApiPath.getUserProfile(userId));
      return UserResponseModel.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<ProductsResponseModel> getProductsByUserId({
    required String userId,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.getProductsByUserId(userId),
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = ProductsResponseModel.fromJson(response.data);
      if (data.success == true) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductsResponseModel> getSoldProductsByUserId({
    required String userId,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.getSoldProductById(userId),
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = ProductsResponseModel.fromJson(response.data);
      if (data.success == true) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FollowToggleModel> followUser(String userId) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiPath.followToggle(userId),
      );
      return FollowToggleModel.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<ChangePasswordResModel> changePassword(
    ChangePasswordReqModel data,
  ) async {
    try {
      final response = await _apiClient.post(
        data: data.toJson(),
        endpoint: ApiPath.changePassword,
      );
      return ChangePasswordResModel.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<EditProfileWrapperModel> editProfile(EditProfileRequest data) async {
    try {
      final Map<String, Object?> formDataMap = {
        "username": data.userName,
        "bio": data.bio,
        "location": data.location,
      };

      if (data.profilePic != null && data.profilePic!.isNotEmpty) {
        final fileExtension = data.profilePic!.split('.').last.toLowerCase();
        String mimeType = 'jpeg';

        if (fileExtension == 'png') {
          mimeType = 'png';
        } else if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
          mimeType = 'jpeg';
        }

        final file = await MultipartFile.fromFile(
          data.profilePic!,
          filename: 'upload.$fileExtension',
          contentType: DioMediaType('image', mimeType),
        );

        formDataMap['profilePic'] = file;
      }

      final newFormData = FormData.fromMap(formDataMap);
      final response = await _apiClient.putFormData(
        endpoint: ApiPath.editProfile,
        formData: newFormData,
      );

      return EditProfileWrapperModel.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<SalesResponseModel> getMyPurchases() async {
    try {
      final response = await _apiClient.get(ApiPath.getMyPurchasesItems);
      return SalesResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SalesResponseModel> getMySoldList() async {
    try {
      final response = await _apiClient.get(ApiPath.getMySoldItems);
      return SalesResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ReviewResponseModel> submitReview(ReviewRequestModel data) async {
    try {
      final response = await _apiClient.post(
        data: data.toJson(),
        endpoint: ApiPath.addReview,
      );
      return ReviewResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UsersReviewResponseModel> getReviews(String userId) async {
    try {
      final response = await _apiClient.get(ApiPath.getReviews(userId));
      return UsersReviewResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ToggleNotificationModel> togglePushNotification() async {
    try {
      final response = await _apiClient.put(
        endpoint: ApiPath.togglePushNotification,
      );
      return ToggleNotificationModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ToggleNotificationModel> toggleEmailNotification() async {
    try {
      final response = await _apiClient.put(
        endpoint: ApiPath.toggleEmailNotification,
      );
      return ToggleNotificationModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<StatusResponseModel> markAsDispatch(
    String orderId,
    String itemId,
  ) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiPath.markAsDispatchItem(orderId, itemId),
      );
      return StatusResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<StatusResponseModel> markAsDelivered(
    String orderId,
    String itemId,
  ) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiPath.markAsDeliveredItem(orderId, itemId),
      );
      return StatusResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FollowStatesResponseModel> getMyFollowers({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.myFollowers,
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = FollowStatesResponseModel.fromJson(response.data);
      if (data.success == true) {
        return FollowStatesResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FollowStatesResponseModel> getMyFollowings({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.myFollowing,
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = FollowStatesResponseModel.fromJson(response.data);
      if (data.success == true) {
        return FollowStatesResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FollowingUserModel>> getFollowersPaginated({
    required int page,
    required int limit,
    required String userId,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.followers(userId),
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      if (response.data['success'] == true && response.data['data'] != null) {
        final List data = response.data['data'];
        return data.map((e) => FollowingUserModel.fromJson(e)).toList();
      } else {
        throw Exception(
          response.data['message'] ?? 'Failed to fetch followers',
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FollowingUserModel>> getFollowingPaginated({
    required int page,
    required int limit,
    required String userId,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.following(userId),
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      if (response.data['success'] == true && response.data['data'] != null) {
        final List data = response.data['data'];
        return data.map((e) => FollowingUserModel.fromJson(e)).toList();
      } else {
        throw Exception(
          response.data['message'] ?? 'Failed to fetch following',
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PolicyResponse> getTermConditions() async {
    try {
      final response = await _apiClient.get(ApiPath.getTermConditions);
      final data = PolicyResponse.fromJson(response.data);
      if (data.success == true) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PolicyResponse> getPrivacyPolicy() async {
    try {
      final response = await _apiClient.get(ApiPath.getPrivacyPolicy);
      final data = PolicyResponse.fromJson(response.data);
      if (data.success == true) {
        return data;
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<NotificationResponseModel> getAllNotifications({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiPath.getAllNotifications,
        queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      );
      final data = NotificationResponseModel.fromJson(response.data);
      if (data.success == true) {
        return NotificationResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MarkAllReadResponseModel> markAllNotificationsAsRead() async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiPath.markAllNotificationsAsRead,
      );
      final data = MarkAllReadResponseModel.fromJson(response.data);
      if (data.success == true) {
        return MarkAllReadResponseModel.fromJson(response.data);
      } else {
        throw Exception(data.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MarkAllReadResponseModel> markNotificationAsRead(
    String notificationId,
  ) async {
    try {
      // final data = {"isRead": true};
      final response = await _apiClient.post(
        endpoint: ApiPath.markNotificationAsRead(notificationId),
        // data: data,
      );
      final responseData = MarkAllReadResponseModel.fromJson(response.data);
      if (responseData.success == true) {
        return MarkAllReadResponseModel.fromJson(response.data);
      } else {
        throw Exception(responseData.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> deleteUserById(String id) async {
    try {
      final response = await _apiClient.delete(
        endpoint: ApiPath.deleteUserById(id),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> deactivateAccount() async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiPath.deactivateAccount,
      );
      return {
        'success':
            (response.statusCode == 200 || response.statusCode == 201) &&
            response.data['success'] == true,
        'message': response.data['message'] ?? 'Unknown response',
      };
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CancelOrderResponseModel> cancelOrder(Map<String, String> req) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiPath.cancelOrder,
        data: req,
      );
      final data = CancelOrderResponseModel.fromJson(response.data);
      if (data.success == true) {
        return data;
      } else {
        throw CustomHTTPException(data.message ?? "");
      }
    } catch (e) {
      throw CustomHTTPException(e.toString());
    }
  }
}
