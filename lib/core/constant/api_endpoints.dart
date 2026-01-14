class ApiPath {
  static String baseUrl = "https://api.circmarketplace.com/";
  static String socketUrl = "wss://circmarketplace.com:3000/";
  static const String imageUrl = "https://api.circmarketplace/";

  // local for testing
  // static String baseUrl = "http://192.168.1.21:3002/";
  // static String socketUrl = "http://192.168.1.21:3002/";
  // static const String imageUrl = "http://192.168.1.21:3002/";

  // auth
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String refresh = "auth/refresh";
  static const String logout = "auth/logout";
  static const String settings = "settings";
  static const String myFollowing = "auth/following";
  static const String myFollowers = "auth/followers";

  static String following(String userId) {
    return "auth/following/$userId";
  }

  static String followers(String userId) {
    return "auth/followers/$userId";
  }

  static String sendOtp = "auth/forgotPassword";
  static const changePassword = "auth/update-password";
  static const String requestPasswordReset = "auth/request-password-reset";
  static const String resetPassword = "auth/reset-password";
  static const String verifyEmail = "auth/verify-email";

  //profile
  static const String getProfile = "auth/profile";
  static String getUserProfile(userId) => "/auth/profile/$userId";
  static const String editProfile = "auth/update-profile";

  // home
  static const String getAllProducts = "products/all";
  static const String getFollowingProducts = "products/followingUsers";

  static const String getProductById = "products/getById";
  static const String toggleFavorite = "products/toggle-like";
  static const String getFavorites = "products/liked-products";
  static const String removeProduct = "products/delete";
  static String getProductsByUserId(userId) =>
      "/products/user/$userId/products";

  static String followToggle(userId) => "auth/toggle-follow/$userId";
  // sell product
  static const String sellProduct = "products/create";
  static const String getMyProducts = "products/seller/my-products";
  static const String updateProduct = "products/update";
  static String updateProductById(id) {
    return "products/update/$id";
  }

  static String getSoldProductById(id) {
    return "products/user/sold-out/$id";
  }

  // Cart
  static const String addToCart = "products/add-to-cart";
  static const String removeFromCart = "products/remove-from-cart";
  static const String getCart = "products/cart-products";
  static const String addOffer = "chat/offer";

  //* Chat
  static String sendMessage(String conversationId, String receiverId) {
    return "chat/message/$receiverId/$conversationId";
  }

  static const String getBuyConversations = "chat/sent";
  static const String getSellConversations = "chat/received";
  static String getDirectConversationById(String id) {
    return "chat/messages/otheruser/$id";
  }

  static String sendDirectMessage(String id) {
    return "chat/direct/send/$id";
  }

  static String getChatList(String id) {
    return "chat/direct/$id";
  }

  static const String getConversations = "chat/conversations";

  //* Categories
  static const String getMainCategory = "main-category";

  static String setProductsByCategory(String id) {
    return "products/by-category/$id";
  }

  static String getChats(String id) {
    // return "chat/messages/$id";
    return "chat/messages/otheruser/$id";
  }

  static String markMessageAsRead = "chat/conversations/read";

  /// chat offers
  // static const String addOffer = "chat/offer";
  static String acceptOffer(String id) {
    return "chat/offer/myoffer/accept/$id";
  }

  static String rejectOffer(String id) {
    return "chat/offer/myoffer/reject/$id";
  }

  static String counterOffer(String id) {
    return "chat/offer/myoffer/counter/$id";
  }

  // review
  static const String addReview = "reviews";

  static String getReviews(String userId) {
    return "reviews/user/$userId";
  }

  // place order
  static const String createOrder = "orders";
  static String confirmOrder(String id) {
    return "payments/callback?reference=$id";
  }

  static const String cancelOrder = "orders/order/item/cancel";

  /// get marketplace fee
  static const String getMarketplaceFee = "settings/buyer-commission";

  static String reTryOrder(String id) {
    return "payments/retry-order/$id";
  }

  static String confirmOrderFlutterWave(String id) {
    return "payments/flutterwave-callback?transaction_id=$id";
  }

  // categories
  static const String getMainCategories = "main-category";
  static String getCategoriesByMainCatId(String id) {
    return "main-category/Categories/$id";
  }

  static String getSubCategoriesByCatId(String id) {
    return "categories/$id/sub-categories";
  }

  // brand
  static const String getBrands = "brands";
  static String getProductsByBrands(String id) {
    return "products/by-brand/$id";
  }

  static const String addBrand = "brands";

  // locations
  static const String getShipFromLocations = "locations";

  // sales
  static const String getMyPurchasesItems = "orders/get-my-purchases";
  static const String getMySoldItems = "orders/seller-items";
  static String markAsDispatch(String orderId) {
    return "orders/dispatch/$orderId";
  }

  static String markAsDispatchItem(String orderId, String itemId) {
    return "orders/dispatch/items/$orderId/$itemId";
  }

  static String markAsDeliveredItem(String orderId, String itemId) {
    return "orders/confirm-delivery/items/$orderId/$itemId";
  }

  // Notifications toggle
  static const String togglePushNotification = "auth/toggle-push-notification";
  static const String toggleEmailNotification =
      "auth/toggle-email-notification";
  static const String getAllNotifications = 'notifications';
  static const String markAllNotificationsAsRead =
      'notifications/mark-all-read';
  static String markNotificationAsRead(String notificationId) =>
      'notifications/mark-read/$notificationId';

  /// Paystack
  static const String paystack = "https://api.paystack.co/";
  static String payStackApi(String refId) {
    return "payments/callback?reference=$refId";
  }

  /// add seller
  static const String createSeller = "seller";

  ///my balance
  static const String authBalance = "auth/balance";
  static const String authTransactions = 'auth/transaction';
  static const String withdrawRequest = 'withdrawal-requests';

  //search
  static const String searchByBrandCategory =
      'products/by-keyword?keyword=Sneakers';
  static String searchByKeyword(String keyword) {
    return "products/by-keyword?keyword=$keyword";
  }

  static const String search = 'search';
  static const String searchSuggestions = 'search/suggestions';

  // help
  static const String help = "help";

  // sizes
  static String getSizesByCategory(String categoryId) {
    return "/size/category/$categoryId";
  }

  static const String resendVerificationEmailOtp =
      "auth/resend-verification-email";

  // policy
  static const String getTermConditions = "terms-conditions";
  static const String getPrivacyPolicy = "privacy-policy";

  static const String socialLogin = "auth/social/login";

  static const String guestLogin = "auth/guest/login";
  static String deleteUserById(String id) => "/users/delete/$id";
  static const String deactivateAccount = "/auth/account/deactivate";
}
