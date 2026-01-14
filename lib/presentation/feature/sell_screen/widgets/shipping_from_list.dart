import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShippingFromList extends StatefulWidget {
  const ShippingFromList({super.key});

  @override
  State<ShippingFromList> createState() => _ShippingFromListState();
}

class _ShippingFromListState extends State<ShippingFromList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, viewModel, _) {
        return Column(
          children: viewModel.shipFromList.map((option) {
            return ListTile(
              title: Text(
                option.name ?? '',
                style: AppTextStyles.neueMontreal(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: viewModel.selectedShippingFromModel?.id == option.id
                  ? const Icon(Icons.check, color: AppColors.primaryColor)
                  : null,
              onTap: () {
                viewModel.setSelectedShippingFrom(option);
                Navigator.pop(context, viewModel.selectedShippingFromModel);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
