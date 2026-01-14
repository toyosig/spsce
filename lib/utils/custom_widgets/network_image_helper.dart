import 'package:cached_network_image/cached_network_image.dart';
import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NetworkImageHelper extends StatefulWidget {
  final String imagePath;
  final String? baseUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Widget? placeholderWidget;
  final bool showSkeletonLoading;
  final bool isCircular; // <-- New parameter
  final String? imgwidth;
  final String? imgheight;

  const NetworkImageHelper({
    required this.imagePath,
    this.baseUrl = ApiPath.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.placeholderWidget,
    this.showSkeletonLoading = true,
    this.isCircular = false, // <-- default: false
    super.key,
    this.imgwidth,
    this.imgheight,
  });

  @override
  State<NetworkImageHelper> createState() => _NetworkImageHelperState();
}

class _NetworkImageHelperState extends State<NetworkImageHelper> {
  bool _isLoading = true;

  void updateLoadingState(bool isLoading) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isLoading = isLoading;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String fullImageUrl = widget.imagePath.startsWith("http")
        ? widget.imagePath
        : '${ApiPath.baseUrl}${widget.imagePath}';
    bool isSvg = fullImageUrl.endsWith(".svg");

    Widget wrapWithShape(Widget child) {
      if (widget.isCircular) {
        return ClipOval(
          child: SizedBox(
            width: widget.imgwidth != null
                ? double.tryParse(widget.imgwidth!) ?? 39
                : 39,
            height: widget.imgheight != null
                ? double.tryParse(widget.imgheight!) ?? 39
                : 39,
            child: child,
          ),
        );
      } else {
        return child;
      }
    }

    return Skeletonizer(
      containersColor: AppColors.lightgrey,
      enabled: widget.showSkeletonLoading && _isLoading,
      child: isSvg
          ? SvgPicture.network(
              fullImageUrl,
              height: widget.height,
              width: widget.width,
              placeholderBuilder: (context) {
                return wrapWithShape(
                  widget.placeholderWidget ??
                      const ColoredBox(color: Colors.white),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                updateLoadingState(false);
                return wrapWithShape(
                  widget.errorWidget ??
                      const Icon(Icons.error, color: Colors.red),
                );
              },
            )
          : CachedNetworkImage(
              imageUrl: fullImageUrl,
              height: widget.height,
              width: widget.width,
              fit: widget.fit,
              placeholder: (context, url) {
                return wrapWithShape(
                  widget.placeholderWidget ??
                      const ColoredBox(color: Colors.white),
                );
              },
              errorWidget: (context, url, error) {
                updateLoadingState(false);
                return wrapWithShape(
                  widget.errorWidget ??
                      Icon(
                        widget.isCircular
                            ? Icons.person
                            : Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: widget.isCircular ? 30.sp : 40.sp,
                      ),
                );
              },
              imageBuilder: (context, imageProvider) {
                updateLoadingState(false);
                return wrapWithShape(
                  Image(
                    image: imageProvider,
                    height: widget.height,
                    width: widget.width,
                    fit: widget.fit,
                  ),
                );
              },
            ),
    );
  }
}
