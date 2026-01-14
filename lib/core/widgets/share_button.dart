import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/services/share_service.dart';
import '../../utils/constants/app_buttons.dart';

class ShareButton extends StatefulWidget {
  final Widget? icon;
  final String id;
  final String type;
  const ShareButton({
    super.key,
    required this.id,
    required this.type,
    this.icon,
  });

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool _isLoading = false;

  Future<void> _share() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final data = await ShareService.generateShareLink(
        id: widget.id,
        type: widget.type,
      );
      if (data != null) {
        String message = '';

        if (widget.type == 'product') {
          final title = data['title'] ?? 'Product';
          final shareLink = data['shareLink'];
          message = 'Check out this product: $title\n$shareLink';
        } else if (widget.type == 'profile') {
          final username = data['username'] ?? 'Profile';
          final shareLink = data['shareLink'];
          message = 'Check out the profile of $username\n$shareLink';
        }

        await SharePlus.instance.share(ShareParams(text: message));
      } else {
        if (mounted) {
          MessageHelper.showErrorMessage(context, 'Something went wrong');
        }
      }
    } catch (e) {
      if (mounted) {
        MessageHelper.showErrorMessage(context, 'Something went wrong');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == 'profile'
        ? CustomAppButtons.profileIconButton(
            context: context,
            label: 'Share Profile',
            image: AppImages.shareProfile,
            onTap: () => _share(),
          )
        : GestureDetector(
            onTap: () => _isLoading == true ? null : _share(),
            child: Container(
              padding: EdgeInsets.all(5.3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                  'assets/svg/share_icon.svg',
                ),
              ),
            ),
          );
  }
}
