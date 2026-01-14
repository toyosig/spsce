import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  final bool isLoadingMore;

  const BottomLoader({super.key, required this.isLoadingMore});

  @override
  Widget build(BuildContext context) {
    if (isLoadingMore) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
