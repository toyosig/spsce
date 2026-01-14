import 'package:circ/presentation/feature/checkout/view_model/check_out_vm.dart';
import 'package:circ/presentation/feature/checkout/widgets/checkout_section_tile.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShippingForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const ShippingForm({super.key, required this.formKey});

  @override
  State<ShippingForm> createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckOutViewModel>().loadSavedAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CheckOutViewModel>();

    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            const CheckoutSectionTitle(title: "Shipping Information"),
            10.verticalSpace,
            LabeledTextField(
              validator: FormValidators.validateFullName,
              label: 'Full Name',
              hintText: 'Enter your full name',
              controller: vm.fullNameController,
              readOnly: false,
              maxLines: 1,
              isTitleVisible: true,
              width: double.infinity,
              height: 50.h,
            ),
            10.verticalSpace,
            LabeledTextField(
              validator: FormValidators.validatePhoneNumber,
              label: 'Phone',
              hintText: 'Enter your phone number',
              controller: vm.phoneNumberController,
              textInputType: TextInputType.phone,
              readOnly: false,
              maxLines: 1,
              isTitleVisible: true,
              width: double.infinity,
              height: 50.h,
            ),
            10.verticalSpace,
            LabeledTextField(
              validator: FormValidators.validateAddressLine1,
              label: 'Address line 1',
              hintText: 'Enter your street address',
              controller: vm.address1Controller,
              readOnly: false,
              maxLines: 1,
              isTitleVisible: true,
              width: double.infinity,
              height: 100.h,
            ),
            10.verticalSpace,
            LabeledTextField(
              validator: FormValidators.validateAddressLine2,
              label: 'Address line 2',
              hintText: 'Enter your apartment, suite, etc.(optional)',
              controller: vm.address2Controller,
              readOnly: false,
              maxLines: 1,
              isTitleVisible: true,
              width: double.infinity,
              height: 100.h,
            ),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: LabeledTextField(
                    validator: FormValidators.validateArea,
                    label: 'City',
                    hintText: 'City',
                    controller: vm.cityController,
                    readOnly: false,
                    maxLines: 1,
                    isTitleVisible: true,
                    width: double.infinity,
                    height: 50.h,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'State',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      DropdownButtonFormField<String>(
                        initialValue: vm.stateController.text.isEmpty
                            ? null
                            : vm.stateController.text,
                        items: const ['Lagos', 'Abuja']
                            .map(
                              (s) => DropdownMenuItem<String>(
                                value: s,
                                child: Text(s),
                              ),
                            )
                            .toList(),
                        onChanged: (v) {
                          vm.stateController.text = v ?? '';
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // 10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Save Address',
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: vm.saveAddress,
                    onChanged: (value) {
                      vm.toggleSaveAddress(value);
                    },
                    activeThumbColor: AppColors.primaryColor,
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: Colors.grey.shade300,
                    inactiveThumbColor: Colors.white,
                    trackOutlineColor: WidgetStateProperty.all(
                      Colors.transparent,
                    ),
                    thumbColor: WidgetStateProperty.all(Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
