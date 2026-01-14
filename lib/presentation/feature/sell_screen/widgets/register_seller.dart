import 'package:circ/core/constant/global.dart';
import 'package:circ/domain/services/dojah_service.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_text_field.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/labeled_date_picker.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/payment_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:circ/utils/constants/location_areas_data.dart'; // ADDED IMPORT
import 'package:circ/presentation/feature/auth/widgets/location_areas_data.dart';


class SellerRegisteration extends StatefulWidget {
  const SellerRegisteration({super.key});

  @override
  State<SellerRegisteration> createState() => _SellerRegisterationState();
}

class _SellerRegisterationState extends State<SellerRegisteration> {
  @override
  void initState() {
    var dojahService = getIt.get<DojahService>();
    dojahService.getBanks();
    dojahService.resetAccount();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sellVm = getIt.get<SellViewModel>();

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomPrimaryAppBar(
            isBackButtonVisible: true, // FIXED: Changed from false to true
            title: 'Seller Registration',
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: SingleChildScrollView(
                child: ListenableBuilder(
                  listenable: sellVm,
                  builder: (context, _) {
                    return Form(
                      key: formKey,
                      child: Column(
                        spacing: 20.sp,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Begin your selling journey today',
                            style: AppTextStyles.neueMontreal(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'Fill out your seller detail to start offering productson our marketplace',
                            style: AppTextStyles.neueMontreal(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black.withValues(alpha: 0.7),
                            ),
                          ),
                          _buildHeading(
                            'Personal Details',
                            isSubCategory: false,
                          ),
                          LabeledTextField(
                            label: 'Full Name',
                            hintText: 'Enter your full name',
                            controller: sellVm.fNameController,
                            maxLines: 1,
                            isTitleVisible: true,
                            validator: FormValidators.validateFullName,
                            onChanged: (_) {},
                          ),

                          LabeledDatePicker(
                            label: 'Date of birth',
                            hintText: 'Enter your date of birth',
                            controller: sellVm.dateOfBirthController,
                            isTitleVisible: true,
                            dateFormat: 'yyyy-MM-dd',
                          ),

                          LabeledTextField(
                            label: 'Phone Number',
                            hintText: '+1(234)2345678',
                            textInputType: TextInputType.phone,
                            controller: sellVm.phoneNumberController,
                            maxLines: 1,
                            isTitleVisible: true,
                            validator: FormValidators.validatePhoneNumber,
                            onChanged: (_) {},
                          ),
                          _buildHeading('Billing', isSubCategory: false),
                          LabeledTextField(
                            label: 'Street Address',
                            hintText: 'Enter your complete address',
                            controller: sellVm.streetAddressController,
                            maxLines: 1,
                            isTitleVisible: true,
                            validator: FormValidators.validateStreetAddress,
                            onChanged: (_) {},
                          ),
                          // START OF REPLACED LOCATION BLOCK
                          // New State Dropdown (Limited to Lagos and FCT - Abuja)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: sellVm.stateController.text.isEmpty
                                    ? null
                                    : sellVm.stateController.text,
                                items: const [
                                  "Lagos",
                                  "FCT - Abuja",
                                ]
                                    .map(
                                      (s) => DropdownMenuItem<String>(
                                    value: s,
                                    child: Text(
                                      s,
                                      style: AppTextStyles.neueMontreal(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                                    .toList(),
                                onChanged: (v) {
                                  sellVm.stateController.text = v ?? '';
                                  sellVm.areaController.text = ''; // Clear area on state change
                                  sellVm.notifyListeners();
                                },
                                validator: FormValidators.validateState,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 8.h,
                                  ),
                                  hintText: 'Select state',
                                  hintStyle: AppTextStyles.neueMontreal(
                                    color: AppColors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      5.r,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      5.r,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      5.r,
                                    ),
                                    borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      5.r,
                                    ),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // New Area Dropdown (Conditional)
                          if (sellVm.stateController.text.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 20.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Area',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: sellVm.areaController.text.isEmpty
                                        ? null
                                        : sellVm.areaController.text,
                                    items: LocationAreasData.areas[
                                    sellVm.stateController.text]!
                                        .map(
                                          (s) => DropdownMenuItem<String>(
                                        value: s,
                                        child: Text(
                                          s,
                                          style: AppTextStyles.neueMontreal(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (v) {
                                      sellVm.areaController.text = v ?? '';
                                    },
                                    validator: FormValidators.validateArea,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 8.h,
                                      ),
                                      hintText: 'Select area',
                                      hintStyle: AppTextStyles.neueMontreal(
                                        color: AppColors.grey,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          // END OF REPLACED LOCATION BLOCK

                          // LabeledTextField(
                          //   label: 'Postal Code',
                          //   hintText: 'Enter your postal code',
                          //   controller: sellVm.postalCodeController,
                          //   maxLines: 1,
                          //   isTitleVisible: true,
                          //   onChanged: (_) {},
                          // ),

                          CustomAppButtons.primaryButton(
                            height: 50.h,
                            width: double.infinity,
                            text: 'Continue',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                    const PaymentVerificationScreen(),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String title, {bool isSubCategory = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        10.verticalSpace,
        RichText(
          text: TextSpan(
            text: title,
            style: AppTextStyles.neueMontreal(
              height: 1.5,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            children: [
              if (isSubCategory)
                TextSpan(
                  text: '',
                  style: AppTextStyles.neueMontreal(
                    height: 1.5,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: AppColors.lightblack.withValues(alpha: 0.4),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
