import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewImageList extends StatefulWidget {
  const ViewImageList({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
  });

  final List<String?> imageUrls;
  final int initialIndex;

  @override
  State<ViewImageList> createState() => _ViewImageListState();
}

class _ViewImageListState extends State<ViewImageList> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack.withValues(alpha: 4),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.primaryBlack.withValues(alpha: 4),
        title: Text(
          '${_currentIndex + 1} / ${widget.imageUrls.length}',
          style: AppTextStyles.neueMontreal(
            color: Colors.white,
            fontSize: 18.5.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: widget.imageUrls.isEmpty
          ? const Center(
              child: Text(
                'No images to display',
                style: TextStyle(fontSize: 18),
              ),
            )
          : PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: InteractiveViewer(
                      child: NetworkImageHelper(
                        imagePath: widget.imageUrls[index]!,
                        fit: BoxFit
                            .cover, // Changed from fill to contain for better viewing
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
