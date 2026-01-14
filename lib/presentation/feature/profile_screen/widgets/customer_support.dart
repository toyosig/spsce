import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/customer_support_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomerSupportScreen extends StatefulWidget {
  final SalesOrderItemModel item;
  final String orderId;

  const CustomerSupportScreen({
    super.key,
    required this.item,
    required this.orderId,
  });

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  late CustomerSupportViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<CustomerSupportViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomPrimaryAppBar(
          title: 'Customer Support',
          showTrailing: false,
          isBackButtonVisible: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Consumer<CustomerSupportViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                spacing: 10.sp,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.supportOptions.length,
                      itemBuilder: (context, index) {
                        final option = viewModel.supportOptions[index];
                        return CheckboxListTile(
                          title: Text(
                            option,
                            style: AppTextStyles.neueMontreal(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          checkColor: AppColors.white,
                          activeColor: AppColors.primaryColor,
                          value: viewModel.selectedOptions.contains(option),
                          onChanged: (_) => viewModel.toggleOption(option),
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      },
                    ),
                  ),
                  LabeledTextField(
                    label: 'Say something about your problem',
                    hintText: '200 Characters maximum',
                    controller: viewModel.descriptionController,
                    maxLines: 6,
                    isTitleVisible: true,
                  ),

                  // Submit Button
                  CustomAppButtons.primaryButton(
                    text: viewModel.isLoading
                        ? 'Submitting...'
                        : 'Submit Request',
                    onTap: viewModel.isLoading
                        ? () {}
                        : () async {
                            final success = await viewModel
                                .submitSupportRequest(widget.orderId, context);
                            if (success && context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                    borderRadius: 2.r,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    width: double.infinity,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
