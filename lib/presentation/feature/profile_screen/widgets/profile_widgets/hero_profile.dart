import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroProfile extends StatelessWidget {
  const HeroProfile({super.key, required this.profileImage, this.heroTag});

  static const route = '/heroProfile';

  final String? profileImage;
  final String? heroTag;

  static const _defaultImage =
      'https://i.pinimg.com/736x/9f/4c/f0/9f4cf0f24b376077a2fcdab2e85c3584.jpg';

  @override
  Widget build(BuildContext context) {
    final imageUrl = _getImageUrl();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: _buildBody(context, imageUrl),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppColors.primaryBlack.withValues(alpha: 0.8),
      elevation: 0,
      title: Text(
        'Profile Image',
        style: AppTextStyles.neueMontreal(
          color: Colors.white,
          fontSize: 18.5.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  Widget _buildBody(BuildContext context, String imageUrl) {
    if (profileImage != null && profileImage!.isEmpty) {
      return _buildEmptyState();
    }

    return SafeArea(
      child: PageView.builder(
        itemCount: 1, // Since we're showing a single image
        itemBuilder: (context, index) => _buildImageViewer(context, imageUrl),
      ),
    );
  }

  Widget _buildImageViewer(BuildContext context, String imageUrl) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Builder(
              builder: (context) {
                if (profileImage == null || profileImage!.isEmpty) {
                  return NetworkImageHelper(
                    imagePath: imageUrl,
                    fit: BoxFit.contain,
                    errorWidget: _buildErrorWidget(),
                  );
                } else {
                  return InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 4.0,
                    child: NetworkImageHelper(
                      imagePath: imageUrl,
                      fit: BoxFit.contain,
                      errorWidget: _buildErrorWidget(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'No image to display',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[900],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Failed to load image',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  String _getImageUrl() {
    if (profileImage == null || profileImage!.isEmpty) {
      return _defaultImage;
    }
    return profileImage!;
  }
}
