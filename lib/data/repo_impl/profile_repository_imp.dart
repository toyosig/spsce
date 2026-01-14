import 'package:circ/core/constant/global.dart';
import 'package:circ/data/data_sources/remote/profile_rds.dart';
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
import 'package:circ/data/models/user_model/user_model_response.dart';
import 'package:circ/data/models/user_model/follow_user_model.dart';
import 'package:circ/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRDS = getIt
      .get<ProfileRemoteDataSource>();

  @override
  Future<UserResponseModel> getUserProfile() async {
    try {
      final response = await _profileRDS.getUserProfile();
      return response;
    } catch (error) {
      throw Exception('Error in repository during login: $error');
    }
  }

  @override
  Future<ProductsResponseModel> getMyProducts({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _profileRDS.getMyProducts(
        page: page,
        limit: limit,
      );
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<ProductsResponseModel> getMyFavProducts({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _profileRDS.getMyFavProducts(
        page: page,
        limit: limit,
      );
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<UserResponseModel> getOtherUserProfile(String userId) async {
    try {
      final response = await _profileRDS.getOtherUserProfile(userId: userId);
      ();
      return response;
    } catch (error) {
      throw Exception('Error in repository during login: $error');
    }
  }

  @override
  Future<ProductsResponseModel> getProductsByUserId({
    required String userId,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _profileRDS.getProductsByUserId(
        userId: userId,
        page: page,
        limit: limit,
      );
      ();
      return response;
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<ProductsResponseModel> getSoldProductsByUserId({
    required String userId,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _profileRDS.getSoldProductsByUserId(
        userId: userId,
        page: page,
        limit: limit,
      );
      ();
      return response;
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<FollowToggleModel> followUser(String userId) async {
    try {
      return await _profileRDS.followUser(userId);
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<EditProfileWrapperModel> editProfile(EditProfileRequest data) async {
    try {
      return await _profileRDS.editProfile(data);
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<ChangePasswordResModel> changePassword(
    ChangePasswordReqModel data,
  ) async {
    try {
      return await _profileRDS.changePassword(data);
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<SalesResponseModel> getMyPurchases() async {
    try {
      return await _profileRDS.getMyPurchases();
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<SalesResponseModel> getMySoldList() async {
    try {
      return await _profileRDS.getMySoldList();
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<ReviewResponseModel> submitReview(ReviewRequestModel data) async {
    try {
      return await _profileRDS.submitReview(data);
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<UsersReviewResponseModel> getReviews(String userId) async {
    try {
      return await _profileRDS.getReviews(userId);
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<ToggleNotificationModel> toggleEmailNotification() async {
    try {
      return await _profileRDS.toggleEmailNotification();
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<ToggleNotificationModel> togglePushNotification() async {
    try {
      return await _profileRDS.togglePushNotification();
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<StatusResponseModel> markAsDispatch(
    String orderId,
    String itemId,
  ) async {
    try {
      return await _profileRDS.markAsDispatch(orderId, itemId);
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<StatusResponseModel> markAsDelivered(
    String orderId,
    String itemId,
  ) async {
    try {
      return await _profileRDS.markAsDelivered(orderId, itemId);
    } catch (error) {
      throw Exception('$error');
    }
  }

  @override
  Future<FollowStatesResponseModel> getMyFollowers({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _profileRDS.getMyFollowers(
        page: page,
        limit: limit,
      );
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<FollowStatesResponseModel> getMyFollowings({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _profileRDS.getMyFollowings(
        page: page,
        limit: limit,
      );
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<List<FollowingUserModel>> getFollowersPaginated({
    required int page,
    required int limit,
    required String userId,
  }) async {
    return await _profileRDS.getFollowersPaginated(
      userId: userId,
      page: page,
      limit: limit,
    );
  }

  @override
  Future<List<FollowingUserModel>> getFollowingPaginated({
    required int page,
    required int limit,
    required String userId,
  }) async {
    return await _profileRDS.getFollowingPaginated(
      userId: userId,
      page: page,
      limit: limit,
    );
  }

  @override
  Future<PolicyResponse> getTermConditions() async {
    return await _profileRDS.getTermConditions();
  }

  @override
  Future<PolicyResponse> getPrivacyPolicy() async {
    return await _profileRDS.getPrivacyPolicy();
  }

  @override
  Future<NotificationResponseModel> getAllNotifications({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _profileRDS.getAllNotifications(
        page: page,
        limit: limit,
      );
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<MarkAllReadResponseModel> markAllNotificationsAsRead() async {
    try {
      final response = await _profileRDS.markAllNotificationsAsRead();
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<MarkAllReadResponseModel> markNotificationAsRead(
    String notificationId,
  ) async {
    try {
      final response = await _profileRDS.markNotificationAsRead(notificationId);
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<bool> deleteUserById(String id) async {
    try {
      return await _profileRDS.deleteUserById(id);
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> deactivateAccount() async {
    try {
      return await _profileRDS.deactivateAccount();
    } catch (e) {
      throw Exception('Error deactivating account: $e');
    }
  }

  @override
  Future<CancelOrderResponseModel> cancelOrder(Map<String, String> req) async {
    try {
      return await _profileRDS.cancelOrder(req);
    } catch (e) {
      throw Exception('Error deactivating account: $e');
    }
  }
}
