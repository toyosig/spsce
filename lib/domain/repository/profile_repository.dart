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

abstract class ProfileRepository {
  Future<UserResponseModel> getUserProfile();
  Future<UserResponseModel> getOtherUserProfile(String userId);
  Future<ProductsResponseModel> getMyProducts({
    required int page,
    required int limit,
  });
  Future<ProductsResponseModel> getProductsByUserId({
    required String userId,
    required int page,
    required int limit,
  });
  Future<ProductsResponseModel> getSoldProductsByUserId({
    required String userId,
    required int page,
    required int limit,
  });
  Future<ProductsResponseModel> getMyFavProducts({
    required int page,
    required int limit,
  });
  Future<FollowToggleModel> followUser(String userId);
  Future<EditProfileWrapperModel> editProfile(EditProfileRequest data);
  Future<ChangePasswordResModel> changePassword(ChangePasswordReqModel data);
  Future<SalesResponseModel> getMyPurchases();
  Future<SalesResponseModel> getMySoldList();
  Future<ReviewResponseModel> submitReview(ReviewRequestModel data);
  Future<UsersReviewResponseModel> getReviews(String userId);
  Future<ToggleNotificationModel> togglePushNotification();
  Future<ToggleNotificationModel> toggleEmailNotification();
  Future<StatusResponseModel> markAsDispatch(String orderId, String itemId);
  Future<StatusResponseModel> markAsDelivered(String orderId, String itemId);
  Future<FollowStatesResponseModel> getMyFollowings({
    required int page,
    required int limit,
  });
  Future<FollowStatesResponseModel> getMyFollowers({
    required int page,
    required int limit,
  });
  Future<List<FollowingUserModel>> getFollowersPaginated({
    required int page,
    required int limit,
    required String userId,
  });
  Future<List<FollowingUserModel>> getFollowingPaginated({
    required int page,
    required int limit,
    required String userId,
  });
  Future<bool> deleteUserById(String id);
  Future<Map<String, dynamic>> deactivateAccount();

  Future<PolicyResponse> getTermConditions();
  Future<PolicyResponse> getPrivacyPolicy();
  Future<NotificationResponseModel> getAllNotifications({
    required int page,
    required int limit,
  });
  Future<MarkAllReadResponseModel> markAllNotificationsAsRead();
  Future<MarkAllReadResponseModel> markNotificationAsRead(
    String notificationId,
  );

  Future<CancelOrderResponseModel> cancelOrder(Map<String, String> req);
}
