// ignore_for_file: use_build_context_synchronously
import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:circ/presentation/feature/cric_balance/cric_balance_vm.dart/circ_balance_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawalFormScreen extends StatefulWidget {
  const WithdrawalFormScreen({super.key});

  @override
  State<WithdrawalFormScreen> createState() => _WithdrawalFormScreenState();
}

class _WithdrawalFormScreenState extends State<WithdrawalFormScreen> {
  late ProfileViewModel profileVm;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountHolderController =
      TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    profileVm = getIt.get<ProfileViewModel>();
    final seller = profileVm.user?.seller;
    _bankNameController.text = seller?.bankName ?? '';
    _accountHolderController.text = seller?.fullName ?? '';
    _accountNumberController.text = seller?.bankVerificationNumber ?? '';
    // _selectedReason = _reasons.first;
  }

  @override
  void dispose() {
    _bankNameController.dispose();
    _accountHolderController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          CustomPrimaryAppBar(
            title: 'Withdraw Funds',
            isBackButtonVisible: true,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.verticalSpace,
                      LabelTextField(
                        label: 'Amount to Withdraw',
                        hintText: 'Amount',
                        controller: _amountController,
                        textInputType: TextInputType.number,
                        maxLines: 1,
                        isTitleVisible: true,
                        validator: FormValidators.validateAmount,
                      ),
                      16.verticalSpace,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12.sp,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_balance,
                                  size: 20.sp,
                                  color: AppColors.black,
                                ),
                                8.horizontalSpace,
                                Text(
                                  'Withdrawal Destination',
                                  style: AppTextStyles.neueMontreal(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            Divider(height: 1, color: Colors.grey.shade200),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Account Holder',
                                  style: AppTextStyles.neueMontreal(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    _accountHolderController.text,
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bank Name',
                                  style: AppTextStyles.neueMontreal(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    _bankNameController.text,
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Account Number',
                                  style: AppTextStyles.neueMontreal(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    _accountNumberController.text,
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      50.verticalSpace,
                      CustomAppButtons.primaryButton(
                        height: 50.h,
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        text: 'Withdraw',
                        onTap: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            if (_bankNameController.text.isEmpty ||
                                _accountNumberController.text.isEmpty) {
                              MessageHelper.showErrorMessage(
                                context,
                                'No withdrawal destination set. Please verify your bank account in KYC first.',
                              );
                              return;
                            }
                            final amount = num.parse(_amountController.text);
                            final CirBalanceViewModel vm = getIt
                                .get<CirBalanceViewModel>();
                            final availableBalance =
                                vm.balanceData?.availableBalance;
                            if (amount > (availableBalance ?? 0.0)) {
                              _amountController.clear();
                              MessageHelper.showErrorMessage(
                                context,
                                "Insufficient available balance",
                              );
                              return;
                            }
                            vm
                                .requestWithdrawal(
                                  bankName: _bankNameController.text,
                                  accountHolder: _accountHolderController.text,
                                  accountNumber: _accountNumberController.text,
                                  amount: double.parse(_amountController.text),
                                  context: context,
                                )
                                .then((success) {
                                  if (success && context.mounted) {
                                    try {
                                      vm.fetchTransactions(page: 1);
                                      vm.getMyBalance();
                                    } catch (e) {
                                      MessageHelper.showErrorMessage(
                                        context,
                                        e.toString(),
                                      );
                                    }
                                    _bankNameController.clear();
                                    _accountHolderController.clear();
                                    _accountNumberController.clear();
                                    _amountController.clear();
                                  }
                                });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
