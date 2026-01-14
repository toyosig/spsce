// ignore_for_file: deprecated_member_use
import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/dispached_confirmation_dialog.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OrderActions extends StatelessWidget {
  final SalesOrderModel? order;
  final int index;
  const OrderActions({super.key, this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (order?.items?[index].status == "FULFILLED") ...[
              Expanded(
                child: CustomAppButtons.primaryIconButton(
                  text: 'Mark as Dispatched',

                  onTap: () {
                    if (order?.items?[index].status == "FULFILLED") {
                      final ProfileViewModel profileViewModel = getIt
                          .get<ProfileViewModel>();
                      BuildContext dialogContext = context;
                      showMarkDispachedDialog(
                        context: dialogContext,
                        imgUrl:
                            order?.items?[index].product?.photos?.first ?? "",
                        onbtnPressed: () {
                          profileViewModel
                              .markAsDispatch(
                                context,
                                order?.id ?? '',
                                order?.items?[index].id ?? '',
                              )
                              .then((e) {
                                if (context.mounted) {
                                  context.pop();
                                }
                              });
                        },
                      );
                    }
                  },
                  icon: Icons.local_shipping_outlined,
                  iconColor: Colors.black87,
                  width: 160.w,
                  height: 40.h,
                  backgroundColor: Colors.white,
                  textColor: Colors.black87,
                  borderRadius: 42.r,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  borderColor: Colors.grey.shade400,
                ),
              ),
              5.horizontalSpace,
            ],
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: OutlinedButton.icon(
                  iconAlignment: IconAlignment.start,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        100.r,
                      ), // More rounded
                    ),
                  ),
                  onPressed: () {
                    if (order == null ||
                        order?.items == null ||
                        order!.items == null ||
                        order!.items![index].product?.seller == null) {
                      return;
                    }
                    final chatViewModel = getIt.get<ChatViewModel>();
                    chatViewModel.navigateToChat(context, order!.buyer);
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/send.svg',
                    height: 18.sp,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: Text(
                    'Message Buyer',
                    style: AppTextStyles.neueMontreal(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showMarkDispachedDialog({
    required BuildContext context,
    required String imgUrl,
    required VoidCallback? onbtnPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(),
        child: DispachedConfirmationDialog(
          imgUrl: imgUrl,
          onSubmitTap: onbtnPressed ?? () {},
        ),
      ),
    );
  }
}
