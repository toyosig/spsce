import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';

class FirstPurchaseScreen extends StatefulWidget {
  const FirstPurchaseScreen({super.key});

  @override
  State<FirstPurchaseScreen> createState() => _FirstPurchaseScreenState();
}

class _FirstPurchaseScreenState extends State<FirstPurchaseScreen> {
  late PageController _pageController;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomPrimaryAppBar(
        title: _currentStep == 0 ? 'Buyer Guide' : 'Post-Purchase Guide',
        isBackButtonVisible: true,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [_buildFirstScreen(), _buildSecondScreen()],
      ),
    );
  }

  Widget _buildFirstScreen() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main heading
          Text(
            'What you should know before you\nbuy on Circ',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          8.verticalSpace,

          Text(
            'We\'re here to help you shop with confidence !',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),

          24.verticalSpace,

          // Buyer Protection Section
          Text(
            'Buyer Protection',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          16.verticalSpace,

          // Protection Step 1
          Text(
            ' • Keep everything on Circ',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          8.verticalSpace,

          Text(
            'For your safety, always keep transactions within\nour app. This is crucial for your protection\nagainst disputes and scams .',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black.withOpacity(0.7),
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          24.verticalSpace,

          // Important Section
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Color(0xFFFEFCE8),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xFFF8E9B1), width: 1.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Important:',
                  style: AppTextStyles.neueMontreal(
                    color: Color(0xFF7D3B00),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                8.verticalSpace,
                Text(
                  'If your item doesn\'t arrive or is not as described, you can report it and request a refund. We\'ll review and refund.',
                  style: AppTextStyles.neueMontreal(
                    color: Color(0xFF7D3B00),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                8.verticalSpace,

                Text(
                  'Purchases made outside our app are not covered by our Buyer Protection and could lead to penalties and a ban from our platform',
                  style: AppTextStyles.neueMontreal(
                    color: Color(0xFF7D3B00),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          24.verticalSpace,

          // How delivery works Section
          Text(
            'How delivery works (for now)',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          16.verticalSpace,

          Text(
            'Circ doesn’t offer delivery support yet. (we’re working on it) So in the meantime:',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          16.verticalSpace,

          Text(
            'Make sure you message the seller before you buy an item to confirm the delivery fee',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          16.verticalSpace,

          Text(
            'After you buy in-app, the seller will message you in Circ chat to arrange a courier. The buyer pays for the delivery fee. The delivery fee can be paid off-app (e.g., bank transfer or directly to the courier). ',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          16.verticalSpace,

          Text(
            'Keep everything documented.\nConfirm the delivery payment in Circ chat. ',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          Text(
            'When you pay the delivery fee off-app, confirm payment in chat so it’s on record',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          60.verticalSpace,

          // Got It Button
          CustomAppButtons.primaryButton(
            text: _getButtonText(),
            onTap: _handleButtonTap,
            width: double.infinity,
            height: 48.h,
            backgroundColor: AppColors.black,
            textColor: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            borderRadius: 2.r,
          ),

          40.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildSecondScreen() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Returns & refunds section
          Text(
            'Returns & refunds',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          8.verticalSpace,

          Text(
            'It\'s your shop, so you set the rules. Just be clear and stick to them:',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          24.verticalSpace,

          // Order tracking and timelines
          _buildStepItem(
            stepNumber: '1',
            title: 'Order tracking and timelines',
            subtitle: 'Track your new find !',
            description:
                'When you receive an item you purchased, mark it as delivered in your purchases tab.\n\nThis payment will be released to the seller as soon as you do this or after 7 working days of the order date',
          ),

          24.verticalSpace,

          // Returns
          _buildStepItem(
            stepNumber: '2',
            title: 'Returns',
            subtitle: 'Not quite right? No problem.',
            description:
                'Each seller sets their own policy. Ask the seller\'s bio before you buy.\n\nAny issue will be reviewed against the policy shown in the seller\'s bio, your listing photos, and the chat history.',
          ),

          32.verticalSpace,

          // Communication & Safety section
          Text(
            'Communication & Safety',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          16.verticalSpace,

          Text(
            'Be respectful. Harassment, hate speech and spam aren\'t tolerated.',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          60.verticalSpace,

          // I Agree Button
          CustomAppButtons.primaryButton(
            text: _getButtonText(),
            onTap: _handleButtonTap,
            width: double.infinity,
            height: 48.h,
            backgroundColor: AppColors.black,
            textColor: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            borderRadius: 2.r,
          ),

          40.verticalSpace,
        ],
      ),
    );
  }

  String _getButtonText() {
    switch (_currentStep) {
      case 0:
        return 'Got It';
      case 1:
        return 'I Agree';
      default:
        return 'Got It';
    }
  }

  void _handleButtonTap() async {
    if (_currentStep < 1) {
      // Move to next screen
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Final screen - complete the flow
      // Mark that user has completed the first purchase guide
      final profileVm = getIt.get<ProfileViewModel>();
      await profileVm.setIsFirstPurchase();

      // Pop the current screen to return to checkout
      if (mounted) {
        context.pop();
      }
    }
  }

  Widget _buildStepItem({
    required String stepNumber,
    String? title,
    String? subtitle,
    required String description,
    bool isCircle = true,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Color(0xFF000000).withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step number circle or bullet
              if (isCircle)
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      stepNumber,
                      style: AppTextStyles.neueMontreal(
                        color: AppColors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              else
                Container(
                  width: 30.w,
                  height: 30.w,
                  child: Center(
                    child: Text(
                      stepNumber,
                      style: AppTextStyles.neueMontreal(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

              8.horizontalSpace,

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      4.verticalSpace,
                    ],
                    if (subtitle != null) ...[
                      Text(
                        subtitle,
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                    ],
                  ],
                ),
              ),
            ],
          ),
          Text(
            description,
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
