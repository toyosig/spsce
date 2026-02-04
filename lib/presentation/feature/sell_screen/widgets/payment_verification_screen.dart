import 'package:circ/core/constant/global.dart';
import 'package:circ/domain/services/dojah_service.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentVerificationScreen extends StatefulWidget {
  const PaymentVerificationScreen({super.key});

  @override
  State<PaymentVerificationScreen> createState() =>
      _PaymentVerificationScreenState();
}

class _PaymentVerificationScreenState extends State<PaymentVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _verified = false;
  bool _verifying = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final sellVm = getIt.get<SellViewModel>();
    final service = getIt.get<DojahService>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomPrimaryAppBar(isBackButtonVisible: true, title: 'Verify Bank'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20.sp,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your bank details to verify account name',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      _buildBankPicker(sellVm, service),
                      Text(
                        'Account Number',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextFormField(
                        controller: sellVm.accountNumberController,
                        keyboardType: TextInputType.number,
                        validator: FormValidators.validateWithdrawAccountNumber,
                        onChanged: (_) {
                          sellVm.invalidateAccountVerification();
                          if (_verified) {
                            setState(() {
                              _verified = false;
                              _errorMessage = '';
                            });
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          hintText: 'Enter account number',
                          hintStyle: AppTextStyles.neueMontreal(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
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
                      if (!_verified && !_verifying)
                        CustomAppButtons.primaryButton(
                          height: 50.h,
                          width: double.infinity,
                          text: 'Verify Bank',
                          onTap: () async {
                            if (_verifying) return;
                            if (!_formKey.currentState!.validate()) return;
                            if (sellVm.bankNameController.text.isEmpty) return;
                            setState(() {
                              _verifying = true;
                              _verified = false;
                              _errorMessage = '';
                            });
                            try {
                              final code = service.getBankCode(
                                bankName: sellVm.bankNameController.text,
                              );
                              await service.verifyAccount(
                                bankCode: code,
                                accountNumber:
                                    sellVm.accountNumberController.text,
                              );
                              final fetched =
                                  (service.accountVerification?.accountName ??
                                          '')
                                      .trim()
                                      .toLowerCase();
                              final provided = sellVm.fNameController.text
                                  .trim()
                                  .toLowerCase();
                              final match = _namesMatch(provided, fetched);
                              if (!mounted) return;
                              setState(() {
                                _verified = match;
                                _errorMessage = match
                                    ? ''
                                    : 'Account title mismatch. Please recheck the bank and account number.';
                              });
                            } catch (e) {
                              if (mounted) {
                                setState(() {
                                  _errorMessage =
                                      'Account verification failed. Please recheck the bank and account number.';
                                  _verified = false;
                                });
                              }
                            } finally {
                              if (mounted) {
                                setState(() {
                                  _verifying = false;
                                });
                              }
                            }
                          },
                        ),
                      if (_verifying)
                        SizedBox(
                          height: 40.h,
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      if (!_verifying && !_verified && _errorMessage.isNotEmpty)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.red.shade200),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 12.sp,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 20.sp,
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    'Verification Failed',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 1, color: Colors.grey.shade200),
                              Text(
                                _errorMessage,
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Provided Name',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      sellVm.fNameController.text,
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
                              // Do not display fetched name on mismatch for privacy
                            ],
                          ),
                        ),
                      if (_verified)
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
                            spacing: 12.sp,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                    size: 20.sp,
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    'Account Verified',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 1, color: Colors.grey.shade200),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Account Name',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      service
                                              .accountVerification
                                              ?.accountName ??
                                          '',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      service
                                              .accountVerification
                                              ?.accountNumber ??
                                          '',
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
                      CustomAppButtons.primaryIconButton(
                        height: 50.h,
                        width: double.infinity,
                        text: 'Continue',
                        backgroundColor: _verified
                            ? AppColors.black
                            : AppColors.lightgrey,
                        textColor: _verified ? Colors.white : AppColors.grey,
                        borderColor: _verified
                            ? AppColors.greyborder
                            : AppColors.greyborder,
                        onTap: _verified
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const _NextStepScreen(),
                                  ),
                                );
                              }
                            : null,
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

  Widget _buildBankPicker(SellViewModel sellVm, DojahService service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Bank',
          style: AppTextStyles.neueMontreal(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 6.h),
        FutureBuilder<void>(
          future: service.availableBanks.isEmpty
              ? service.getBanks()
              : Future.value(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 48.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.black,
                  ),
                ),
              );
            }
            return TextFormField(
              controller: sellVm.bankNameController,
              readOnly: true,
              validator: FormValidators.validateBankName,
              style: AppTextStyles.neueMontreal(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                  ),
                  builder: (ctx) {
                    final searchCtrl = TextEditingController();
                    List filtered = service.availableBanks;
                    return StatefulBuilder(
                      builder: (ctx, setModalState) {
                        void applyFilter(String q) {
                          final query = q.trim().toLowerCase();
                          filtered = service.availableBanks
                              .where(
                                (b) {
                                  // Transform Paycom to Opay for display and search
                                  final displayName = _getDisplayBankName(b.name ?? '');
                                  return displayName.toLowerCase().contains(query);
                                },
                              )
                              .toList();
                          setModalState(() {});
                        }

                        return Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            top: 12.h,
                            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 40.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                'Select Bank',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextField(
                                controller: searchCtrl,
                                onChanged: applyFilter,
                                decoration: InputDecoration(
                                  hintText: 'Search bank',
                                  prefixIcon: const Icon(Icons.search),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 10.h,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              SizedBox(
                                height: 400.h,
                                child: ListView.separated(
                                  itemCount: filtered.length,
                                  separatorBuilder: (_, __) => Divider(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  itemBuilder: (ctx, i) {
                                    final b = filtered[i];
                                    final displayName = _getDisplayBankName(b.name ?? '');
                                    return InkWell(
                                      onTap: () {
                                        sellVm.bankNameController.text = displayName;
                                        service.selectedBank = b;
                                        sellVm.invalidateAccountVerification();
                                        if (_verified) {
                                          setState(() {
                                            _verified = false;
                                            _errorMessage = '';
                                          });
                                        }
                                        Navigator.pop(ctx);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12.h,
                                          horizontal: 4.w,
                                        ),
                                        child: Text(
                                          displayName,
                                          style: AppTextStyles.neueMontreal(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                hintText: 'Select your bank',
                hintStyle: AppTextStyles.neueMontreal(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.arrow_drop_down),
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
            );
          },
        ),
      ],
    );
  }

  // Add this helper method to transform bank names for display
  String _getDisplayBankName(String bankName) {
    if (bankName.toLowerCase() == 'paycom' || 
        bankName.toLowerCase().contains('paycom')) {
      return 'Opay';
    }
    return bankName;
  }

  bool _namesMatch(String provided, String fetched) {
    String norm(String s) =>
        s.trim().toLowerCase().replaceAll(RegExp(r"\s+"), ' ');
    final np = norm(provided);
    final nf = norm(fetched);
    if (np.isEmpty || nf.isEmpty) return false;
    return np == nf;
  }
}

class _NextStepScreen extends StatefulWidget {
  const _NextStepScreen();
  @override
  State<_NextStepScreen> createState() => _NextStepScreenState();
}

class _NextStepScreenState extends State<_NextStepScreen> {
  final _formKey = GlobalKey<FormState>();
  String _idType = 'BVN';
  final TextEditingController _idCtrl = TextEditingController();
  bool _verifying = false;
  String _errorMessage = '';
  bool _verified = false;
  String _fetchedFullName = '';
  Uint8List? _photoBytes;

  @override
  Widget build(BuildContext context) {
    final sellVm = getIt.get<SellViewModel>();
    final service = getIt.get<DojahService>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomPrimaryAppBar(
            isBackButtonVisible: true,
            title: 'KYC Information',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20.sp,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select ID type and verify to complete registration',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        value: _idType,
                        items: const [
                          DropdownMenuItem(value: 'BVN', child: Text('BVN')),
                          DropdownMenuItem(value: 'NIN', child: Text('NIN')),
                        ],
                        onChanged: (v) {
                          if (v != null) {
                            setState(() {
                              _idType = v;
                              _idCtrl.clear();
                              _verified = false;
                              _errorMessage = '';
                            });
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
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
                      TextFormField(
                        controller: _idCtrl,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (_idType == 'BVN') {
                            return FormValidators.validateBankVerificationNumber(
                              v,
                            );
                          }
                          return FormValidators.validateNIN(v);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          hintText: _idType == 'BVN'
                              ? 'Enter BVN (11 digits)'
                              : 'Enter NIN (11 digits)',
                          hintStyle: AppTextStyles.neueMontreal(
                            color: AppColors.grey,
                            fontSize: 14.sp,
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
                        onChanged: (_) {
                          if (_verified || _errorMessage.isNotEmpty) {
                            setState(() {
                              _verified = false;
                              _errorMessage = '';
                            });
                          }
                        },
                      ),
                      if (_verifying)
                        SizedBox(
                          height: 40.h,
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      if (!_verifying && _errorMessage.isNotEmpty)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.red.shade200),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 20.sp,
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Text(
                                  _errorMessage,
                                  style: AppTextStyles.neueMontreal(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (_verified)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.green.shade200),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 12.sp,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                    size: 20.sp,
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    '${_idType} Verified',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              if (_photoBytes != null)
                                Center(
                                  child: SizedBox(
                                    height: 160.h,
                                    width: 160.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.memory(
                                        _photoBytes!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Full Name',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      _fetchedFullName,
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
                              if (_idType == 'BVN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BVN',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Text(
                                      service.bvnVerification?.bvn ?? '',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              if (_idType == 'NIN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'NIN',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Verified',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              Divider(height: 1, color: Colors.grey.shade200),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'First Name',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      (_idType == 'BVN'
                                              ? service
                                                    .bvnVerification
                                                    ?.firstName
                                              : service
                                                    .ninVerification
                                                    ?.firstName) ??
                                          '',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Middle Name',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      (_idType == 'BVN'
                                              ? service
                                                    .bvnVerification
                                                    ?.middleName
                                              : service
                                                    .ninVerification
                                                    ?.middleName) ??
                                          '',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Last Name',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      (_idType == 'BVN'
                                              ? service
                                                    .bvnVerification
                                                    ?.lastName
                                              : service
                                                    .ninVerification
                                                    ?.lastName) ??
                                          '',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Gender',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    (_idType == 'BVN'
                                            ? service.bvnVerification?.gender
                                            : service
                                                  .ninVerification
                                                  ?.gender) ??
                                        '',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date of Birth',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    (_idType == 'BVN'
                                            ? service
                                                  .bvnVerification
                                                  ?.dateOfBirth
                                            : service
                                                  .ninVerification
                                                  ?.dateOfBirth) ??
                                        '',
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              if (_idType == 'BVN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phone 1',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Text(
                                      service.bvnVerification?.phoneNumber1 ??
                                          '',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              if (_idType == 'BVN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phone 2',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Text(
                                      service.bvnVerification?.phoneNumber2 ??
                                          '',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              if (_idType == 'NIN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        service.ninVerification?.email ?? '',
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
                              if (_idType == 'NIN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phone',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Text(
                                      service.ninVerification?.phoneNumber ??
                                          '',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              if (_idType == 'NIN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Employment Status',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Text(
                                      service
                                              .ninVerification
                                              ?.employmentStatus ??
                                          '',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              if (_idType == 'NIN')
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Marital Status',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    Text(
                                      service.ninVerification?.maritalStatus ??
                                          '',
                                      style: AppTextStyles.neueMontreal(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (!_verifying && !_verified)
                        Row(
                          children: [
                            Expanded(
                              child: CustomAppButtons.primaryButton(
                                height: 50.h,
                                width: double.infinity,
                                text: 'Verify ${_idType}',
                                onTap: () async {
                                  if (_verifying) return;
                                  if (!_formKey.currentState!.validate()) return;
                                  setState(() {
                                    _verifying = true;
                                    _verified = false;
                                    _errorMessage = '';
                                  });
                                  try {
                                    if (_idType == 'BVN') {
                                      await service.verifyBVN(
                                        bvn: _idCtrl.text.trim(),
                                      );
                                      final v = service.bvnVerification;
                                      final fetched =
                                          [
                                                v?.firstName,
                                                v?.middleName,
                                                v?.lastName,
                                              ]
                                              .where(
                                                (e) =>
                                                    (e ?? '').trim().isNotEmpty,
                                              )
                                              .join(' ');
                                      final bankTitle =
                                          getIt
                                              .get<DojahService>()
                                              .accountVerification
                                              ?.accountName ??
                                          '';
                                      final userFull =
                                          sellVm.fNameController.text;
                                      final match =
                                          _namesMatch(fetched, userFull) &&
                                          _namesMatch(fetched, bankTitle);
                                      final dobMatch = _dobMatch(
                                        v?.dateOfBirth,
                                        sellVm,
                                      );
                                      Uint8List? photoBytes;
                                      if (v?.image != null &&
                                          v!.image!.isNotEmpty) {
                                        final raw = v.image!.contains(',')
                                            ? v.image!.split(',').last
                                            : v.image!;
                                        try {
                                          photoBytes = base64Decode(raw);
                                        } catch (_) {}
                                      }
                                      setState(() {
                                        _verified =
                                            v != null && match && dobMatch;
                                        _errorMessage = _verified
                                            ? ''
                                            : (!dobMatch
                                                  ? 'Date of birth mismatch. Please ensure your BVN DOB matches your profile DOB.'
                                                  : 'Name mismatch. Please ensure your BVN name matches bank and profile name.');
                                        _fetchedFullName = fetched;
                                        _photoBytes = photoBytes;
                                      });
                                    } else {
                                      await service.verifyNIN(
                                        nin: _idCtrl.text.trim(),
                                      );
                                      final v = service.ninVerification;
                                      final fetched =
                                          [
                                                v?.firstName,
                                                v?.middleName,
                                                v?.lastName,
                                              ]
                                              .where(
                                                (e) =>
                                                    (e ?? '').trim().isNotEmpty,
                                              )
                                              .join(' ');
                                      final bankTitle =
                                          getIt
                                              .get<DojahService>()
                                              .accountVerification
                                              ?.accountName ??
                                          '';
                                      final userFull =
                                          sellVm.fNameController.text;
                                      final match =
                                          _namesMatch(fetched, userFull) &&
                                          _namesMatch(fetched, bankTitle);
                                      final dobMatch = _dobMatch(
                                        v?.dateOfBirth,
                                        sellVm,
                                      );
                                      Uint8List? photoBytes;
                                      if (v?.photo != null &&
                                          v!.photo!.isNotEmpty) {
                                        final raw = v.photo!.contains(',')
                                            ? v.photo!.split(',').last
                                            : v.photo!;
                                        try {
                                          photoBytes = base64Decode(raw);
                                        } catch (_) {}
                                      }
                                      setState(() {
                                        _verified =
                                            v != null && match && dobMatch;
                                        _errorMessage = _verified
                                            ? ''
                                            : (!dobMatch
                                                  ? 'Date of birth mismatch. Please ensure your NIN DOB matches your profile DOB.'
                                                  : 'Name mismatch. Please ensure your NIN name matches bank and profile name.');
                                        _fetchedFullName = fetched;
                                        _photoBytes = photoBytes;
                                      });
                                    }
                                  } catch (e) {
                                    setState(() {
                                      _verified = false;
                                      _errorMessage =
                                          'Verification failed. Please recheck and try again.';
                                    });
                                  } finally {
                                    setState(() {
                                      _verifying = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      CustomAppButtons.primaryIconButton(
                        height: 50.h,
                        width: double.infinity,
                        text: 'Submit Registration',
                        backgroundColor: _verified
                            ? AppColors.black
                            : AppColors.lightgrey,
                        textColor: _verified ? Colors.white : AppColors.grey,
                        onTap: _verified
                            ? () async {
                                if (_idType == 'BVN') {
                                  sellVm.bvnController.text = _idCtrl.text
                                      .trim();
                                } else {
                                  sellVm.ninController.text = _idCtrl.text
                                      .trim();
                                }
                                await sellVm.registerSeller(context);
                              }
                            : null,
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

  bool _namesMatch(String provided, String fetched) {
    String norm(String s) =>
        s.trim().toLowerCase().replaceAll(RegExp(r"\s+"), ' ');
    final np = norm(provided);
    final nf = norm(fetched);
    if (np.isEmpty || nf.isEmpty) return false;
    return np == nf;
  }

  bool _dobMatch(String? fetchedDob, SellViewModel vm) {
    if (fetchedDob == null || fetchedDob.trim().isEmpty) return false;
    DateTime? f;
    try {
      f = DateTime.parse(fetchedDob.trim());
    } catch (_) {
      f = null;
    }
    DateTime? p = vm.dob;
    if (p == null) {
      try {
        final s = vm.dateOfBirthController.text.trim();
        if (s.isNotEmpty) p = DateTime.parse(s);
      } catch (_) {
        p = null;
      }
    }
    if (f == null || p == null) return false;
    return f.year == p.year && f.month == p.month && f.day == p.day;
  }
}