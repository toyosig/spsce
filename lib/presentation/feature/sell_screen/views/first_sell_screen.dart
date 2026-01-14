import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';

class FirstSaleScreen extends StatefulWidget {
  const FirstSaleScreen({super.key});

  @override
  State<FirstSaleScreen> createState() => _FirstSaleScreenState();
}

class _FirstSaleScreenState extends State<FirstSaleScreen> {
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
        title: 'Seller Guide',
        isBackButtonVisible: true,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe navigation
        children: [
          _buildFirstScreen(),
          _buildSecondScreen(),
          _buildThirdScreen(),
        ],
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
            'You should know this before\nyou sell on Circ',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          24.verticalSpace,
          
          // Listing Items Section
          Text(
            'Listing Items',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
            8.verticalSpace,
          Text(
            'To list an item for sale, follow these simple steps :',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          24.verticalSpace,
          
          // Listing Step 1
          _buildStepItem(
            stepNumber: '1',
            description: 'Take clear photos of your item from multiple angles, including any flaws or damage',
          ),
          
          16.verticalSpace,
          
          // Listing Step 2
          _buildStepItem(
            stepNumber: '2',
            description: 'Write an honest description including brand, size, condition, and any defects',
          ),
          
          16.verticalSpace,
          
          // Listing Step 3
          _buildStepItem(
            stepNumber: '3',
            description: 'Set a fair price by checking similar items on Circ and other platforms',
          ),
          
          24.verticalSpace,
          
          // Delivery Section
          Text(
            'Delivery',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          8.verticalSpace,
          Text(
            'Circ does not offer any logistics support for now\nbut we are working on it, so for now:',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          24.verticalSpace,
          
          // Delivery Step 1
          _buildStepItem(
            stepNumber: '1',
            description: 'It is the seller\'s responsibility to arrange for delivery or pickup. Find a courier, inform the buyer of the delivery fee. The buyer pays directly to the seller or courier',
          ),
          
          16.verticalSpace,
          
          // Delivery Step 2
          _buildStepItem(
            stepNumber: '2',
            description: 'Mark the item as dispatched as soon as you have handed it off to the dispatch rider - go to the sold tab in your profile to do this',
          ),
          
          60.verticalSpace,
          
          // Ok Button
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

           // Main heading
          Text(
            'You should know this before\nyou sell on Circ',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          24.verticalSpace,
          Text(
            'Payouts (escrow)',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          16.verticalSpace,
          
          // Subtitle
          Text(
            'When your item sells, the payment lands in\nescrow in your Circ wallet. It protects both sides:',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          
          24.verticalSpace,
          
          // Step 1
          _buildStepItem(
            stepNumber: '1',
            description: 'Funds unlock when either the buyer confirms "Delivered" in-app, or seven working days pass and we\'ve confirmed delivery with the buyer.',
          ),
          
          16.verticalSpace,
          
          // Step 2
          _buildStepItem(
            stepNumber: '2',
            description: 'Once released, money moves from Current Balance to Withdrawable Balance, and you can cash out.',
          ),
          
          16.verticalSpace,
          
          // Step 3
          _buildStepItem(
            stepNumber: '3',
            description: 'If the buyer reports a problem before release, funds stay on hold while we review based on your photos, description and chat history.',
          ),
          
          24.verticalSpace,
          
          // Got it Button
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

  Widget _buildThirdScreen() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          
          // Returns & refunds Section
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
          
          // Returns Step 1
          _buildStepItem(
            stepNumber: '1',
            description: 'State your return/refund policy in your profile bio. For example: "No returns" or "Returns within three days"',
          ),
          
          16.verticalSpace,
          
          // Returns Step 2
          _buildStepItem(
            stepNumber: '2',
            description: 'Circ has the right to invoke our own refund policy in situations where the item does not arrive or is different than how it was described',
          ),
          
          28.verticalSpace,
          
          // Packaging & Hand-off Section
          Text(
            'Packaging & Hand-off',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          8.verticalSpace,
          
          Text(
            'Ship items clean, odour-free and safely packed.',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          
          28.verticalSpace,
          
          // Communication & Safety Section
          Text(
            'Communication & Safety',
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
          
          // Communication Step 1
          _buildStepItem(
            stepNumber: '1',
            description: 'Keep all communication and coordination inside Circ. Taking sales off the app or asking for off-app payment for the item breaks our safety rules and could lead to penalties or a ban.',
          ),
          
          16.verticalSpace,
          
          // Communication Step 2
          _buildStepItem(
            stepNumber: '2',
            description: 'Be respectful. Harassment, hate speech and spam aren\'t tolerated.',
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
        return 'Ok';
      case 1:
        return 'Got it';
      case 2:
        return 'I Agree';
      default:
        return 'Ok';
    }
  }

  void _handleButtonTap() async {
    if (_currentStep < 2) {
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
      // Mark that user has completed the first sale guide
      final profileVm = getIt.get<ProfileViewModel>();
      await profileVm.setIsFirstSale();
      
      // Navigate to sell screen by updating the bottom nav index
      final homeVm = getIt.get<HomeViewModel>();
      homeVm.setIndex(2);
      
      // Pop the current screen
      if (mounted) {
        context.pop();
      }
    }
  }

  Widget _buildStepItem({
    required String stepNumber,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Color(0xFFDFDFDF),
          width: 1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Step number circle
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
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          
          12.horizontalSpace,
          
          // Description text
          Expanded(
            child: Text(
              description,
              style: AppTextStyles.neueMontreal(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}