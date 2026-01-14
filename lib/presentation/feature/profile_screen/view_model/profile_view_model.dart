// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/auth/change_password_request_model.dart';
import 'package:circ/data/models/home/add_product_req_model.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/data/models/notifications/all_notification_response_model.dart';
import 'package:circ/data/models/review/review_request_model.dart';
import 'package:circ/data/models/review/user_review_data.dart';
import 'package:circ/data/models/sales/cancel_order_response_model.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/data/models/settings/policy_response_model.dart';
import 'package:circ/data/models/user_model/edit_profile_request_model.dart';
import 'package:circ/data/models/user_model/follow_toggle_model.dart';
import 'package:circ/data/models/user_model/follow_user_model.dart';
import 'package:circ/data/models/user_model/user_model.dart';
import 'package:circ/data/models/user_model/user_model_response.dart';
import 'package:circ/domain/repository/profile_repository.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:circ/utils/helpers/loading_helpers.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository _profileRepository = getIt.get<ProfileRepository>();
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  XFile? _pickedImage;
  bool _isLoading = false;
  bool _isObscureText = true;
  bool _isConfirmObscureText = true;
  String _followBtnText = "";
  double _rating = 0;
  int currentPageMyProd = 1;
  int currentPageUsersProd = 1;
  int currentPageFavProd = 1;
  int currentPageNotifications = 1;
  int currentPageFollowers = 1;
  int currentPageFollowing = 1;
  int currentPageSoldProd = 1;
  bool _isLoadingMore = false;
  bool _isMarkingAllAsRead = false;
  bool hasMoreFollowers = true;
  bool hasMoreFollowing = true;
  bool isLoadingMoreFollowers = false;
  bool isLoadingMoreFollowing = false;
  bool hasMoreMyProd = true;
  bool hasMoreUsersProd = true;
  bool hasMoreSoldProd = true;
  bool hasMoreFavPro = true;
  bool hasMoreNotifications = true;

  UserModel? user;
  UserModel? otherUser;
  UsersReviewData? profileReviews;

  List<ProductsData> myProducts = [];
  List<ProductsData> myFavProducts = [];
  List<SalesOrderModel> myPurchases = [];
  List<SalesOrderModel> soldList = [];
  List<ProductsData> usersProducts = [];
  List<ProductsData> soldProducts = [];
  List<ProductsData> mySoldProducts = [];
  List<NotificationModel> notifications = [];
  FollowToggleModel? followToggleModel;
  List<PolicyData>? termConditions;
  List<PolicyData>? privacyPolicy;
  List<FollowingUserModel>? paginatedFollowers;
  List<FollowingUserModel>? paginatedFollowing;

  XFile? get pickedImage => _pickedImage;
  bool get isLoading => _isLoading;
  bool get isObscureText => _isObscureText;
  bool get isConfirmObscureText => _isConfirmObscureText;
  String get followButtonText => _followBtnText;
  double get rating => _rating;
  bool get isLoadingMore => _isLoadingMore;
  bool get isMarkingAllAsRead => _isMarkingAllAsRead;
  Widget? get followButtonIcon => followButtonText.trim() == 'Follow'
      ? SvgPicture.asset(AppImages.addFollowIcon, height: 15.h, width: 15.w)
      : null;

  TextEditingController get userNameController => _userNameController;
  TextEditingController get bioController => _bioController;
  TextEditingController get locationController => _locationController;
  TextEditingController get currentPasswordController =>
      _currentPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get reviewController => _reviewController;

  Future<void> init(BuildContext context) async {
    LoadingHelper.showLoading(context);
    if (await SecureStorageService.isGuestUser()) {
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      return;
    }
    await getUserProfile();
    await getMyProducts(context, isRefresh: true);
    await getMyFavProducts(context, isRefresh: true);
    await getMyPurchases();
    await getMySoldList();
    await getReviews(user?.id ?? "");
    if (context.mounted) {
      LoadingHelper.hideLoading(context);
    }
  }

  Future<void> otherProfileInit(
    BuildContext context, {
    required String userId,
  }) async {
    LoadingHelper.showLoading(context);
    clearOtherUserControllers();
    await getUserProfile();
    await getOtherUserProfile(userId: userId);
    await getProductsByUserId(userId: userId, context, isRefresh: true);
    await getReviews(userId);
    if (context.mounted) {
      LoadingHelper.hideLoading(context);
    }
  }

  ///***************************************setters******************************************************** */

  void setLoading(bool value) {
    _isLoading = value;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  Future<bool> getIsFirstSale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstSale') ?? true;
  }

  Future<void> setIsFirstSale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstSale', false);
    notifyListeners();
  }

  Future<bool> getIsFirstPurchase() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstPurchase') ?? true;
  }

  Future<void> setIsFirstPurchase() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstPurchase', false);
    notifyListeners();
  }

  void setIsLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }

  void setIsMarkingAllAsRead(bool value) {
    _isMarkingAllAsRead = value;
    notifyListeners();
  }

  void setRating(double rating) {
    _rating = rating;
    notifyListeners();
  }

  void setFollowButtonText(String text) {
    _followBtnText = text;
    notifyListeners();
  }

  void setPickImage(XFile? image) {
    _pickedImage = image;
    notifyListeners();
  }

  void clearPickedImage() {
    _pickedImage = null;
    notifyListeners();
  }

  void clearOtherUser() {
    otherUser = null;
    notifyListeners();
  }

  Future<void> setUser(UserModel user) async {
    this.user = user;
    notifyListeners();
  }

  void clearCurrUser() {
    user = null;
    notifyListeners();
  }

  void setOtherUser(UserModel otherUser) {
    this.otherUser = otherUser;
    log("otherUser: $otherUser");
    notifyListeners();
  }

  void setMyProductList(List<ProductsData> list, {bool? add = false}) {
    final available = list.where((product) => product.quantity > 0).toList();
    final sold = list.where((product) => product.quantity <= 0).toList();

    if (add == true) {
      myProducts = List.from(myProducts)..addAll(available);
      mySoldProducts = List.from(mySoldProducts)..addAll(sold);
    } else {
      // Always create a mutable copy to avoid unmodifiable list errors
      myProducts = available;
      mySoldProducts = sold;
    }
    notifyListeners();
  }

  /// Removes a product by ID from locally held profile lists to avoid refetch
  void removeProductFromMyList(String? productId) {
    if (productId == null) return;
    myProducts = myProducts.where((p) => p.id != productId).toList();
    myFavProducts = myFavProducts.where((p) => p.id != productId).toList();
    notifyListeners();
  }

  /// Updates a product by ID in locally held profile lists
  void updateProductInMyList(
    String? productId,
    AddProductRequestModel updatedData,
  ) {
    if (productId == null) return;

    // Update in myProducts list
    final myProductIndex = myProducts.indexWhere((p) => p.id == productId);
    if (myProductIndex != -1) {
      final updatedProduct = myProducts[myProductIndex].copyWith(
        title: updatedData.title,
        description: updatedData.description,
        price: updatedData.price,
        quantity: updatedData.quantity,
        color: updatedData.color,
        photos: updatedData.photos,
        video: updatedData.video,
        tags: updatedData.tags,
        condition: updatedData.condition,
        brandId: updatedData.brandId,
        subCategoryId: updatedData.subCategoryId,
        shippingFromId: updatedData.shippingFromId,
        shippingTo: updatedData.shippingTo,
        isDraft: updatedData.isDraft,
      );
      // Create a mutable copy of the list before updating to avoid unmodifiable list errors
      final updatedMyProducts = List<ProductsData>.from(myProducts);
      updatedMyProducts[myProductIndex] = updatedProduct;
      myProducts = updatedMyProducts;
    }

    // Update in myFavProducts list if it exists there
    final favProductIndex = myFavProducts.indexWhere((p) => p.id == productId);
    if (favProductIndex != -1) {
      final updatedFavProduct = myFavProducts[favProductIndex].copyWith(
        title: updatedData.title,
        description: updatedData.description,
        price: updatedData.price,
        quantity: updatedData.quantity,
        color: updatedData.color,
        photos: updatedData.photos,
        video: updatedData.video,
        tags: updatedData.tags,
        condition: updatedData.condition,
        brandId: updatedData.brandId,
        subCategoryId: updatedData.subCategoryId,
        shippingFromId: updatedData.shippingFromId,
        shippingTo: updatedData.shippingTo,
        isDraft: updatedData.isDraft,
      );
      // Create a mutable copy of the list before updating to avoid unmodifiable list errors
      final updatedMyFavProducts = List<ProductsData>.from(myFavProducts);
      updatedMyFavProducts[favProductIndex] = updatedFavProduct;
      myFavProducts = updatedMyFavProducts;
    }

    notifyListeners();
  }

  void setNotificationList(List<NotificationModel> list, {bool? add = false}) {
    if (add == true) {
      notifications = List.from(notifications)..addAll(list);
    } else {
      notifications = list;
    }
    notifyListeners();
  }

  void setMyFavProductList(List<ProductsData> list, {bool? add = false}) {
    if (add == true) {
      myFavProducts = List.from(myFavProducts)..addAll(list);
    } else {
      // Always create a mutable copy to avoid unmodifiable list errors
      myFavProducts = List.from(list);
    }
    notifyListeners();
  }

  void setProfileReviews(UsersReviewData review) {
    profileReviews = review;
    notifyListeners();
  }

  void setUsersProductList(List<ProductsData> list, {bool? add = false}) {
    // Filter the products
    final available = list.where((product) => product.quantity > 0).toList();
    final sold = list.where((product) => product.quantity <= 0).toList();

    if (add == true) {
      usersProducts = List.from(usersProducts)..addAll(available);
      soldProducts = List.from(soldProducts)..addAll(sold);
    } else {
      usersProducts = available;
      soldProducts = sold;
    }

    notifyListeners();
  }

  void setMyPerchases(List<SalesOrderModel> myPurchases) {
    this.myPurchases = myPurchases;
    notifyListeners();
  }

  void setMySoldList(List<SalesOrderModel> soldList) {
    this.soldList = soldList;
    notifyListeners();
  }

  void setFollowToggleModel(FollowToggleModel followToggleModel) {
    this.followToggleModel = followToggleModel;
    notifyListeners();
  }

  void toggleObscureText() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  void setTermConditions(List<PolicyData> termConditions) {
    this.termConditions = termConditions;
    notifyListeners();
  }

  void setPrivacyPolicy(List<PolicyData> privacyPolicy) {
    this.privacyPolicy = privacyPolicy;
    notifyListeners();
  }

  void clearOtherUserControllers() {
    otherUser = null;
    usersProducts = [];
    soldProducts = [];
    profileReviews = null;
    notifyListeners();
  }

  void clearController() {
    _userNameController.clear();
    _currentPasswordController.clear();
    _reviewController.clear();
    _rating = 0;
    _newPasswordController.clear();
    _confirmPasswordController.clear();
    notifyListeners();
  }

  void toggleConfirmObscureText() {
    _isConfirmObscureText = !_isConfirmObscureText;
    notifyListeners();
  }

  Future<void> pickImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setPickImage(image);
      notifyListeners();
    }
  }

  ///****************************************Get Data Functions************************************************************ */

  Future<void> getUserProfile() async {
    setLoading(true);
    try {
      if (await SecureStorageService.isGuestUser()) {
        return;
      }
      final response = await _profileRepository.getUserProfile();
      if (response.data != null) {
        await setUser(response.data!);
      }
    } catch (error) {
      log("error getUserProfile: $error");
    } finally {
      notifyListeners();
      setLoading(false);
    }
  }

  Future<void> getMyProducts(
    BuildContext context, {
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMoreMyProd || isLoadingMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPageMyProd = 1;
      setLoading(true);
    }
    try {
      final response = await _profileRepository.getMyProducts(
        limit: 15,
        page: currentPageMyProd,
      );
      if (response.success == true && response.data != null) {
        if (isLoadMore) {
          setMyProductList(response.data!, add: isLoadMore);
          currentPageMyProd++;
        } else {
          setMyProductList(response.data!);
          currentPageMyProd = 2;
        }
        hasMoreMyProd = currentPageMyProd <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      if (!context.mounted) return;
      log("error getMyProducts: $e");
    } finally {
      setLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }

  Future<void> getMyFavProducts(
    BuildContext context, {
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMoreFavPro || isLoadingMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPageFavProd = 1;
      setLoading(true);
    }
    try {
      final response = await _profileRepository.getMyFavProducts(
        limit: 15,
        page: currentPageFavProd,
      );
      if (response.success == true && response.data != null) {
        if (isLoadMore) {
          setMyFavProductList(response.data!, add: isLoadMore);
          currentPageFavProd++;
        } else {
          setMyFavProductList(response.data!);
          currentPageFavProd = 2;
        }
        hasMoreFavPro = currentPageFavProd <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      if (!context.mounted) return;
      log("error getMyFavProducts: $e");
    } finally {
      setLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }

  Future<void> getOtherUserProfile({required String userId}) async {
    setLoading(true);
    try {
      final response = await _profileRepository.getOtherUserProfile(userId);
      if (response.data != null) {
        setOtherUser(response.data!);
        final text = getFollowBtnText();
        setFollowButtonText(text);
      } else {
        throw Exception(response.message);
      }
    } catch (error) {
      log("error getOtherUserProfile: $error");
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> getProductsByUserId(
    BuildContext context, {
    String? userId,
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMoreUsersProd || isLoadingMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPageUsersProd = 1;
      setLoading(true);
    }
    try {
      final response = await _profileRepository.getProductsByUserId(
        userId: userId ?? otherUser?.id ?? "",
        limit: 15,
        page: currentPageUsersProd,
      );
      if (response.success == true && response.data != null) {
        if (isLoadMore) {
          setUsersProductList(response.data!, add: isLoadMore);
          currentPageUsersProd++;
        } else {
          setUsersProductList(response.data!);
          currentPageUsersProd = 2;
        }
        hasMoreUsersProd = currentPageUsersProd <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      if (!context.mounted) return;
    } finally {
      setLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }

  Future<void> getMyPurchases() async {
    setLoading(true);
    try {
      final response = await _profileRepository.getMyPurchases();
      // if (response.orders != null && response.orders!.isNotEmpty) {
      setMyPerchases(response.orders ?? []);
      // }
    } catch (error) {
      log("error getProducts: $error");
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> getMySoldList() async {
    setLoading(true);
    try {
      final response = await _profileRepository.getMySoldList();
      // if (response.orders != null && response.orders!.isNotEmpty) {
      setMySoldList(response.orders ?? []);
      // }
    } catch (error) {
      log("error getProducts: $error");
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> followUser({
    required String id,
    required BuildContext context,
  }) async {
    setLoading(true);
    try {
      final response = await _profileRepository.followUser(id);
      setFollowToggleModel(response);
      if (response.success == true) {
        final updatedUser = await _profileRepository.getOtherUserProfile(id);
        if (updatedUser.data != null) {
          setOtherUser(updatedUser.data!);
          final HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
          homeViewModel.getFollowingProducts(isRefresh: true);
          final text = getFollowBtnText();
          setFollowButtonText(text);
          await getUserProfile();
        }
      } else {
        throw Exception(response.message);
      }
    } catch (error) {
      MessageHelper.showErrorMessage(context, error.toString());
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<bool> editProfile(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      if (userNameController.text.trim().isEmpty &&
          pickedImage == null &&
          bioController.text.trim().isEmpty &&
          locationController.text.trim().isEmpty) {
        return true;
      }
      final data = EditProfileRequest(
        userName: userNameController.text.trim(),
        profilePic: pickedImage?.path,
        bio: bioController.text.trim(),
        location: locationController.text.trim(),
      );

      final response = await _profileRepository.editProfile(data);

      if (response.success == false) {
        throw Exception(response.message);
      }

      if (user != null && response.data != null) {
        user = user!.copyWith(
          username: response.data?.username ?? user!.username,
          profilePic: response.data?.profilePic ?? user!.profilePic,
          bio: response.data?.bio ?? user!.bio,
          location: response.data?.location ?? user!.location,
        );
        getUserProfile();
      }
      userNameController.clear();
      bioController.clear();
      locationController.clear();
      _pickedImage = null;
      if (context.mounted) {
        MessageHelper.showSuccessMessage(
          context,
          response.message ?? "Profile updated successfully",
        );
      }
      return true;
    } catch (error) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, error.toString());
      }
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> toggleEmailNotification(BuildContext context) async {
    setLoading(true);
    try {
      final response = await _profileRepository.toggleEmailNotification();
      if (response.success == false) {
        throw Exception(response.message);
      }
      if (user != null && response.success == true) {
        user = user!.copyWith(emailNotification: response.emailNotification);
        // getUserProfile();
      }
      if (context.mounted) {
        MessageHelper.showSuccessMessage(context, response.message);
      }
      return true;
    } catch (error) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, error.toString());
      }
      return false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<bool> togglePushNotification(BuildContext context) async {
    setLoading(true);
    try {
      final response = await _profileRepository.togglePushNotification();
      if (response.success == false) {
        throw Exception(response.message);
      }
      if (user != null && response.success == true) {
        user = user!.copyWith(pushNotification: response.pushNotification);
        // getUserProfile();
      }
      if (context.mounted) {
        MessageHelper.showSuccessMessage(context, response.message);
      }
      return true;
    } catch (error) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, error.toString());
      }
      return false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<bool> changePassword(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      if (newPasswordController.text.trim() !=
          confirmPasswordController.text.trim()) {
        MessageHelper.showErrorMessage(context, "Password doesn't match");
        return false;
      }
      final data = ChangePasswordReqModel(
        oldPassword: currentPasswordController.text.trim(),
        newPassword: newPasswordController.text.trim(),
      );

      final response = await _profileRepository.changePassword(data);
      if (response.statusCode != 200) {
        throw Exception(response.message);
      }

      if (context.mounted) {
        MessageHelper.showSuccessMessage(
          context,
          response.message ?? "Password updated successfully",
        );
      }
      clearController();
      return true;
    } catch (error) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, error.toString());
      }
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> submitReview({
    required String sellerId,
    required BuildContext context,
  }) async {
    setLoading(true);
    try {
      if (rating == 0) {
        throw Exception("Please select Rating");
      }
      final request = ReviewRequestModel(
        reviewedUserId: sellerId,
        text: reviewController.text,
        rating: rating.toInt(),
      );
      final response = await _profileRepository.submitReview(request);
      if ((response.statusCode == 200 || response.statusCode == 201) && context.mounted) {
        MessageHelper.showSuccessMessage(
          context,
          response.message ?? "Review submitted successfully",
        );
        clearController();
        return true;
      } else if (context.mounted) {
        MessageHelper.showErrorMessage(
          context,
          response.message ?? "Unable to submit review. Please try again.",
        );
        return false;
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      if (context.mounted) {
        log("error submitReview: $e");
        MessageHelper.showErrorMessage(context, e.toString());
      }
      return false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<bool> markAsDispatch(
    BuildContext context,
    String orderId,
    String itemId,
  ) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _profileRepository.markAsDispatch(orderId, itemId);
      if (result.success == true) {
        MessageHelper.showSuccessMessage(context, result.message ?? "");
        await getMySoldList();
        return true;
      } else if (result.success == false) {
        MessageHelper.showErrorMessage(context, result.message ?? "");
        return false;
      } else {
        MessageHelper.showErrorMessage(context, result.message ?? "");
        return false;
      }
      // return false;
    } catch (e) {
      if (context.mounted) {
        log("error markAsDispatch: $e");
        // MessageHelper.showErrorMessage(context, e.toString());
      }
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<bool> markAsDelivered(
    BuildContext context,
    String orderId,
    String itemId,
  ) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _profileRepository.markAsDelivered(orderId, itemId);
      if (result.success == true) {
        MessageHelper.showSuccessMessage(context, result.message ?? "");
        getMyPurchases();
        return true;
      } else if (result.success == false) {
        MessageHelper.showErrorMessage(context, result.message ?? "");
        return false;
      }
      return false;
    } catch (e) {
      if (context.mounted) {
        log("error markAsDelivered: $e");
        // MessageHelper.showErrorMessage(context, e.toString());
      }
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<void> getReviews(String userId) async {
    setLoading(true);
    try {
      final response = await _profileRepository.getReviews(userId);
      if (response.data != null && response.statusCode == 200) {
        setProfileReviews(response.data!);
      }
    } catch (error) {
      log("error getOtherUsersReviews: $error");
    } finally {
      setLoading(false);
    }
  }

  Future<void> getTermConditions(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final response = await _profileRepository.getTermConditions();
      if (response.success == true) {
        setTermConditions(response.data);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      log("error getTermConditions: $e");
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<void> getPrivacyPolicy(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final response = await _profileRepository.getPrivacyPolicy();
      if (response.success == true) {
        setPrivacyPolicy(response.data);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      log("error getPrivacyPolicy: $e");
    } finally {
      setLoading(false);
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
      }
      notifyListeners();
    }
  }

  Future<void> shareUserProfile(BuildContext context) async {
    try {
      // Get the render box for share position (optional)
      final RenderBox? box = context.findRenderObject() as RenderBox?;

      // Create share content
      final String shareText =
          'Check out ${user?.username}\'s profile!\n'
          'User ID: ${user?.id}\n'
          'Join our app to connect!';

      // You can customize this URL based on your app's deep linking setup
      final String profileUrl = 'https://yourapp.com/profile/${user?.id}';

      // Share the profile
      final ShareResult shareResult = await SharePlus.instance.share(
        ShareParams(
          subject: shareText,
          uri: Uri.parse(profileUrl), // Optional: include deep link
          sharePositionOrigin: box != null
              ? (box.localToGlobal(Offset.zero) & box.size)
              : null,
        ),
      );

      // Show result feedback
      if (context.mounted) {
        _showShareResult(context, shareResult);
      }
    } catch (e) {
      log("error shareUserProfile: $e");
    }
  }

  // Helper function to show share result
  void _showShareResult(BuildContext context, ShareResult result) {
    String message;
    Color backgroundColor;

    switch (result.status) {
      case ShareResultStatus.success:
        message = 'Profile shared successfully!';
        backgroundColor = Colors.green;
        break;
      case ShareResultStatus.dismissed:
        message = 'Share cancelled';
        backgroundColor = Colors.orange;
        break;
      case ShareResultStatus.unavailable:
        message = 'Sharing unavailable';
        backgroundColor = Colors.red;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> getAllNotifications({
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isLoadMore) {
      if (!hasMoreNotifications || isLoadingMore) return;
      setIsLoadingMore(true);
    } else {
      if (isRefresh) currentPageNotifications = 1;
      setLoading(true);
    }
    try {
      if (await SecureStorageService.isGuestUser()) {
        return;
      }
      final response = await _profileRepository.getAllNotifications(
        limit: 20,
        page: currentPageNotifications,
      );
      if (response.success == true && response.data != null) {
        if (isLoadMore) {
          setNotificationList(response.data!, add: isLoadMore);
          currentPageNotifications++;
        } else {
          setNotificationList(response.data!);
          currentPageNotifications = 2;
        }
        hasMoreNotifications = currentPageNotifications <= response.totalPages!;
      }
      if (response.success == false) {
        throw Exception(response.message);
      }
    } catch (e) {
      log("error getAllNotifications: $e");
      // MessageHelper.showErrorMessage(context, e.toString());
    } finally {
      setLoading(false);
      setIsLoadingMore(false);
      notifyListeners();
    }
  }

  Future<void> markNotificationAsRead({required String notificationId}) async {
    setLoading(true);
    try {
      // Update local state since there's no API endpoint for single notification
      final response = await _profileRepository.markNotificationAsRead(
        notificationId,
      );
      if (response.success == true) {
        final index = notifications.indexWhere((n) => n.id == notificationId);
        if (index != -1) {
          final updatedNotifications = List<NotificationModel>.from(
            notifications,
          );
          updatedNotifications[index] = updatedNotifications[index].copyWith(
            isRead: true,
          );
          setNotificationList(updatedNotifications);
        }
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      final index = notifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        // Create a new list with the updated notification
        final updatedNotifications = List<NotificationModel>.from(
          notifications,
        );
        updatedNotifications[index] = updatedNotifications[index].copyWith(
          isRead: true,
        );
        setNotificationList(updatedNotifications);
      }
    } finally {
      setLoading(false);
    }
  }

  Future<void> markAllNotificationsAsRead() async {
    setIsMarkingAllAsRead(true);
    try {
      final response = await _profileRepository.markAllNotificationsAsRead();
      if (response.success == true) {
        final updatedNotifications = notifications.map((notification) {
          return notification.copyWith(isRead: true);
        }).toList();
        setNotificationList(updatedNotifications);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      log("error markAllNotificationsAsRead: $e");
    } finally {
      setIsMarkingAllAsRead(false);
    }
  }

  Future<CancelOrderResponseModel> cancelOrder({
    required String orderId,
    required String itemId,
    required String reason,
  }) async {
    setLoading(true);
    try {
      final req = {"orderId": orderId, "itemId": itemId, "reason": reason};
      final response = await _profileRepository.cancelOrder(req);
      if (response.success == true) {
        return response;
      } else {
        throw CustomHTTPException(response.message.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      setLoading(false);
    }
  }

  ///****************************************Util Functions************************************************************ */

  bool checkUserResponseValid(UserResponseModel? model) {
    if (model != null && model.success == true) {
      return true;
    }
    throw Exception(model?.message);
  }

  String getFollowBtnText() {
    final currentUserId = user?.id;
    final isFollowing = otherUser?.followers!.any(
      (follower) => follower.id == currentUserId,
    );
    if (isFollowing == true) {
      return "Unfollow";
    } else {
      return "Follow";
    }
  }

  void toggleFollowLocally(FollowingUserModel userToToggle) {
    if (user == null) return;
    final isFollowing =
        user!.following?.any((u) => u.id == userToToggle.id) ?? false;
    if (isFollowing) {
      // Remove from following
      user = user!.copyWith(
        following: user!.following!
            .where((u) => u.id != userToToggle.id)
            .toList(),
        followingCount: (user!.followingCount ?? 1) - 1,
      );
    } else {
      // Add to following
      user = user!.copyWith(
        following: [...?user!.following, userToToggle],
        followingCount: (user!.followingCount ?? 0) + 1,
      );
    }
    notifyListeners();
  }

  Future<void> getFollowersPaginated(
    BuildContext context, {
    bool isLoadMore = false,
    required String userId,
  }) async {
    setLoading(true);
    if (isLoadMore) {
      if (!hasMoreFollowers || isLoadingMoreFollowers) return;
      isLoadingMoreFollowers = true;
      notifyListeners();
    } else {
      currentPageFollowers = 1;
      hasMoreFollowers = true;
    }
    try {
      final List<FollowingUserModel> newFollowers = await _profileRepository
          .getFollowersPaginated(
            userId: userId,
            page: currentPageFollowers,
            limit: 10,
          );
      if (isLoadMore) {
        paginatedFollowers = [...?paginatedFollowers, ...newFollowers];
        currentPageFollowers++;
      } else {
        paginatedFollowers = newFollowers;
        currentPageFollowers = 2;
      }
      hasMoreFollowers = newFollowers.isNotEmpty;
    } finally {
      setLoading(false);
      isLoadingMoreFollowers = false;
      notifyListeners();
    }
  }

  Future<void> getFollowingPaginated(
    BuildContext context, {
    bool isLoadMore = false,
    required String userId,
  }) async {
    setLoading(true);
    if (isLoadMore) {
      if (!hasMoreFollowing || isLoadingMoreFollowing) return;
      isLoadingMoreFollowing = true;
      notifyListeners();
    } else {
      currentPageFollowing = 1;
      hasMoreFollowing = true;
    }
    try {
      final List<FollowingUserModel> newFollowing = await _profileRepository
          .getFollowingPaginated(
            userId: userId,
            page: currentPageFollowing,
            limit: 10,
          );
      if (isLoadMore) {
        paginatedFollowing = [...?paginatedFollowing, ...newFollowing];
        currentPageFollowing++;
      } else {
        paginatedFollowing = newFollowing;
        currentPageFollowing = 2;
      }
      hasMoreFollowing = newFollowing.isNotEmpty;
    } finally {
      setLoading(false);
      isLoadingMoreFollowing = false;
      notifyListeners();
    }
  }

  Future<bool> deleteUserById(BuildContext context, String id) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _profileRepository.deleteUserById(id);
      if (result) {
        MessageHelper.showSuccessMessage(context, 'User deleted successfully.');
      } else {
        MessageHelper.showErrorMessage(context, 'Failed to delete user.');
      }
      return result;
    } catch (e) {
      log("error deleteUserById: $e");
      // MessageHelper.showErrorMessage(context, e.toString());
      return false;
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
    }
  }

  Future<bool> deactivateAccount(BuildContext context) async {
    LoadingHelper.showLoading(context);
    try {
      final result = await _profileRepository.deactivateAccount();
      final message = result['message'] as String;
      if (result['success'] == true) {
        if (context.mounted) {
          await getIt.get<AuthViewModel>().logout(context);
        }
        MessageHelper.showSuccessMessage(context, message);
      } else {
        MessageHelper.showErrorMessage(context, message);
      }
      return result['success'] == true;
    } catch (e) {
      log("error deactivateAccount: $e");
      // MessageHelper.showErrorMessage(context, e.toString());
      return false;
    } finally {
      LoadingHelper.hideLoading(context);
    }
  }
}
