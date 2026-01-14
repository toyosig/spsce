import 'package:flutter/material.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/main.dart';
import 'package:circ/presentation/feature/auth/views/email_verification_screen.dart';
import 'package:circ/presentation/feature/auth/views/forget_password_screen.dart';
import 'package:circ/presentation/feature/auth/views/login_screen.dart';
import 'package:circ/presentation/feature/auth/views/register.screen.dart';
import 'package:circ/presentation/feature/auth/views/user_info_screeen.dart';
import 'package:circ/presentation/feature/auth/widgets/forget_otp_screen.dart';
import 'package:circ/presentation/feature/auth/widgets/reset_password_screen.dart';
import 'package:circ/presentation/feature/cart_screen/view/cart_screen.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/chat/view/chat_inbox.dart';
import 'package:circ/presentation/feature/checkout/view/check_out_screen.dart';
import 'package:circ/presentation/feature/cric_balance/views/cric_balance_screen.dart';
import 'package:circ/presentation/feature/cric_balance/views/withdrawal_confirmation_screen.dart';
import 'package:circ/presentation/feature/cric_balance/views/withdrawal_form_screen.dart';
import 'package:circ/presentation/feature/detail_screen/views/detail_screen.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/product_card/video_preview_screen.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/view_image.dart';
import 'package:circ/presentation/feature/edit_profile/view/change_password1.dart';
import 'package:circ/presentation/feature/edit_profile/view/edit_profie.dart';
import 'package:circ/presentation/feature/home_screen/views/home_screen.dart';
import 'package:circ/presentation/feature/home_screen/widgets/bottom_navbar.dart';
import 'package:circ/presentation/feature/notifications/views/notification_screen.dart';
import 'package:circ/presentation/feature/profile_screen/views/followers_following_screen.dart';
import 'package:circ/presentation/feature/profile_screen/views/other_profile_screen.dart';
import 'package:circ/presentation/feature/profile_screen/views/reviews_screen.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/customer_support.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_detail_page.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/profile_widgets/hero_profile.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/sold_tab/sold_order_detail.dart/sold_order_detail_page.dart';
import 'package:circ/presentation/feature/sell_screen/views/sell_screens.dart';
import 'package:circ/presentation/feature/settings/view/privacy_policy_screen.dart';
import 'package:circ/presentation/feature/settings/view/settings_screen.dart';
import 'package:circ/presentation/feature/settings/view/terms_conditions_screen.dart';
import 'package:circ/presentation/feature/splash/views/splash_screen.dart';
import 'package:circ/presentation/routes/routes.dart';
import 'package:go_router/go_router.dart';

import '../feature/sell_screen/views/first_sell_screen.dart';
import '../feature/checkout/views/first_purchase_screen.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/splash',
        name: Routes.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: Routes.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/user_register',
        name: Routes.userinfo.name,
        builder: (context, state) => const UserInfoScreeen(),
      ),
      GoRoute(
        path: '/forget-password',
        name: Routes.forgetPassword.name,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: '/reset_password',
        name: Routes.reset.name,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;
          return ResetPasswordScreen(otp: data?['otp'], email: data?['email']);
        },
      ),
      GoRoute(
        path: '/forget_otp',
        name: Routes.forgetOtpScreen.name,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;
          return ForgetOtpScreen(email: data?['email']);
        },
      ),
      GoRoute(
        path: '/email-verification',
        name: Routes.emailVerification.name,
        builder: (context, state) => const EmailVerificationScreen(),
      ),
      GoRoute(
        path: '/edit_profile',
        name: Routes.editprofile.name,
        builder: (context, state) => const EditProfie(),
      ),
      GoRoute(
        path: '/changePassword',
        name: Routes.changePassword.name,
        builder: (context, state) => const ChangePassword(),
      ),
      GoRoute(
        path: '/settings',
        name: Routes.settings.name,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/chatInbox',
        name: Routes.chat1.name,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;
          return ChatInbox(
            otherUserId: data?['other_user_id'],
            name: data?['name'],
            imagePath: data?['imagePath'],
          );
        },
      ),
      GoRoute(
        path: '/navbar',
        name: Routes.navbar.name,
        builder: (context, state) {
          final selectedIndex = state.extra as int?;
          if (selectedIndex == null) {
            return BottomNavScreen();
          } else {
            return BottomNavScreen(screenIndex: selectedIndex);
          }
        },
      ),
      GoRoute(
        path: '/first-sale',
        name: Routes.firstSale.name,
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            fullscreenDialog: true,
            child: FirstSaleScreen(),
          );
        },
      ),
      GoRoute(
        path: '/first-purchase',
        name: Routes.firstPurchase.name,
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            fullscreenDialog: true,
            child: FirstPurchaseScreen(),
          );
        },
      ),
      GoRoute(
        path: '/othersProfile',
        name: Routes.othersProfile.name,
        builder: (context, state) {
          final userId = state.extra as String;
          return OthersProfileScreen(userId: userId);
        },
      ),
      GoRoute(
        path: '/sellItem',
        name: Routes.sellItem.name,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          final product = extras?['product'] as ProductsData?;
          final isEdit = extras?['isEdit'] as bool? ?? false;
          return SellScreen(isEdit: isEdit, product: product);
        },
      ),
      GoRoute(
        path: '/orderDetail',
        name: Routes.orderDetail.name,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          final proIndex = extras?['index'] as int? ?? 0;
          final bool isDispatched = extras?['isDispatched'] ?? false;
          final bool isDelivered = extras?['isDelivered'] ?? false;
          final order =
              extras?['order'] as SalesOrderModel? ?? SalesOrderModel();
          return OrderDetailPage(
            proIndex: proIndex,
            order: order,
            isDispatched: isDispatched,
            isDelivered: isDelivered,
          );
        },
      ),
      GoRoute(
        path: '/soldOrderDetail',
        name: 'soldOrderDetail',
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          final proIndex = extras?['index'] as int? ?? 0;
          final bool isDispatched = extras?['isDispatched'] ?? false;
          final bool isDelivered = extras?['isDelivered'] ?? false;
          final order =
              extras?['order'] as SalesOrderModel? ?? SalesOrderModel();
          return SoldOrderDetailPage(
            proIndex: proIndex,
            order: order,
            isDispatched: isDispatched,
            isDelivered: isDelivered,
          );
        },
      ),
      GoRoute(
        path: '/detail',
        name: Routes.detail.name,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          final id = extras?['id'] as String?;
          return ProductDetail(id: id);
        },
      ),
      GoRoute(
        path: '/cart',
        name: Routes.cart.name,
        builder: (context, state) => const CartScreen(),
      ),

      GoRoute(
        path: '/notificationScreen',
        name: Routes.notificationScreen.name,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: '/checkout',
        name: Routes.checkout.name,
        builder: (context, state) {
          final extra = state.extra;

          if (extra is Map<String, dynamic>) {
            final product = extra['product'] as ProductsData?;
            final offerId = extra['offerId'] as String?;
            final decidedPrice = extra['decidedPrice'] as double?;

            if (product != null) {
              return CheckOutScreen(
                products: [product],
                offerId: offerId,
                decidedPrice: decidedPrice,
                source: PaymentSource.offer,
              );
            }
          }

          // Handle detail screen format with products and source
          if (extra is Map<String, dynamic>) {
            final products = extra['products'] as List<ProductsData>?;
            final source = extra['source'] as PaymentSource?;

            if (products != null) {
              return CheckOutScreen(
                products: products,
                source: source ?? PaymentSource.detail,
              );
            }
          }

          // Handle existing cart format
          if (extra is List<ProductsData>) {
            return CheckOutScreen(products: extra, source: PaymentSource.cart);
          }

          // Handle legacy format with products and offerId
          if (extra is Map<String, dynamic>) {
            final products = extra['products'] as List<ProductsData>?;
            final offerId = extra['offerId'] as String?;

            if (products != null) {
              return CheckOutScreen(
                products: products,
                offerId: offerId,
                source: PaymentSource.offer,
              );
            }
          }

          // Fallback to empty products list
          return CheckOutScreen(products: [], source: PaymentSource.cart);
        },
      ),
      GoRoute(
        path: '/support',
        name: Routes.support.name,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final item = data['item'] as SalesOrderItemModel;
          final orderId = data['orderId'] as String;
          return CustomerSupportScreen(item: item, orderId: orderId);
        },
      ),
      GoRoute(
        path: '/cric_balance',
        name: Routes.cricbalance.name,
        builder: (context, state) => const CricBalanceScreen(),
      ),
      GoRoute(
        path: '/withdrawal-form',
        name: Routes.withdrawalform.name,
        builder: (context, state) => const WithdrawalFormScreen(),
      ),
      GoRoute(
        path: '/withdrawal-confirmation',
        builder: (context, state) => const WithdrawalConfirmationScreen(),
      ),
      GoRoute(
        path: '/reviews',
        name: Routes.reviews.name,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ReviewScreen(
            userId: args['userId'],
            avgRating: args['avgRating'],
          );
        },
      ),
      GoRoute(
        path: '/register',
        name: Routes.registerScreen.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/followers_following',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return FollowersFollowingScreen(
            initialTab: args['initialTab'] ?? 0,
            userId: args['userId'] ?? "",
          );
        },
      ),
      GoRoute(
        path: '/video_preview',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          final videoUrl = args?['videoUrl'] as String? ?? '';
          return VideoPreviewScreen(videoUrl: videoUrl);
        },
      ),
      GoRoute(
        path: '/terms',
        builder: (context, state) => const TermsConditionsScreen(),
      ),
      GoRoute(
        path: '/privacy',
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: '/viewImageList',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final images = args['images'] as List<String?>;
          final index = args['index'] as int;
          return ViewImageList(imageUrls: [...images], initialIndex: index);
        },
      ),
      GoRoute(
        path: HeroProfile.route,
        builder: (context, state) =>
            HeroProfile(profileImage: state.extra as String?),
      ),
    ],
  );
}
