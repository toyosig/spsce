import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:provider/provider.dart';

class ShippingToOption {
  final String title;
  final String subtitle;
  final IconData icon;

  ShippingToOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class ShippingToList extends StatefulWidget {
  const ShippingToList({super.key});

  @override
  State<ShippingToList> createState() => _ShippingToListState();
}

class _ShippingToListState extends State<ShippingToList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, viewModel, _) {
        return Column(
          children: viewModel.shipToList.map((option) {
            return ListTile(
              leading:
                  Icon(option.icon, size: 24, color: AppColors.primaryColor),
              title: Text(
                option.title,
                style: AppTextStyles.neueMontreal(
                  fontSize: 16.sp,
                  fontWeight:
                      viewModel.selectedShippingToModel?.title == option.title
                          ? FontWeight.w600
                          : FontWeight.w500,
                  color:
                      viewModel.selectedShippingToModel?.title == option.title
                          ? AppColors.primaryColor
                          : AppColors.black,
                ),
              ),
              subtitle:
                  Text(option.subtitle, style: TextStyle(fontSize: 12.sp)),
              trailing: viewModel.selectedShippingToModel?.title == option.title
                  ? const Icon(Icons.check, color: AppColors.primaryColor)
                  : null,
              onTap: () {
                viewModel.setSelectedShippingTo(option);
                Navigator.pop(context, viewModel.selectedShippingToModel);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
