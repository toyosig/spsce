// ignore_for_file: deprecated_member_use

import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final SplashService _splashService = SplashService();
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();

    _splashService.checkFirstTime(context);
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOutCirc,
          child: Image.asset(
            'assets/images/Circ_logo.png',
            width: 250.w,
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
