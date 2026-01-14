import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:app_links/app_links.dart';
import 'package:circ/config/app_config.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/domain/services/notification_services.dart';
import 'package:circ/firebase_options.dart';
import 'package:circ/presentation/global_notifier/register_notifier.dart';
import 'package:circ/presentation/routes/app_routes.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  AppConfig().setup();
  await AppConfig().initialize();
  NotificationService().initInfo();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final _navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription<Uri>? _linkSubscription;
  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    // Handle links
    _linkSubscription = AppLinks().uriLinkStream.listen((uri) {
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    final pathSegments = uri.pathSegments;
    log("pathSegments: $pathSegments");

    // Case 1: Handle /share/redirect/product/{id}
    if (pathSegments.length >= 4 &&
        pathSegments[0] == 'share' &&
        pathSegments[1] == 'redirect') {
      final type = pathSegments[2];
      final id = pathSegments[3];

      if (type == 'product') {
        navigatorKey.currentContext?.push('/detail', extra: {'id': id});
      } else if (type == 'profile') {
        navigatorKey.currentContext?.push('/othersProfile', extra: id);
      } else {}
    }
    // Case 2: Handle /product/{id}
    else if (pathSegments.length >= 2 && pathSegments[0] == 'product') {
      final id = pathSegments[1];
      navigatorKey.currentContext?.push('/detail', extra: {'id': id});
    }
    // Case 3: Handle /profile/{id}
    else if (pathSegments.length >= 2 && pathSegments[0] == 'profile') {
      final id = pathSegments[2];
      navigatorKey.currentContext?.push('/othersProfile', extra: id);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _linkSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MultiProvider(
        providers: registerGlobalNotifiers(),
        child: MaterialApp.router(
          theme: ThemeData(primaryColor: AppColors.primaryColor),
          onNavigationNotification: (_) => true,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          builder: (context, child) {
            // Set global context for API client logout functionality
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ApiClient.setGlobalContext(context);
            });

            return LoaderOverlay(
              overlayWidgetBuilder: (_) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.white,
                    ),
                    child: CircularProgressIndicator(
                      padding: EdgeInsets.all(20.r),
                      color: AppColors.primaryColor,
                    ),
                  ),
                );
              },
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
