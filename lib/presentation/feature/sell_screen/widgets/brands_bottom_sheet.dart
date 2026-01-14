import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectBrandSheet extends StatefulWidget {
  final bool allowMultipleSelection;

  const SelectBrandSheet({super.key, this.allowMultipleSelection = false});

  @override
  State<SelectBrandSheet> createState() => _SelectBrandSheetState();
}

class _SelectBrandSheetState extends State<SelectBrandSheet> {
  BrandModel? selectedBrand;
  Set<BrandModel> selectedBrands = {};
  bool isAddBrand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Consumer<SellViewModel>(
        builder: (context, sellVm, child) {
          // Filter brands based on search query
          final filteredBrands = sellVm.brands.where((brand) {
            return brand.name?.toLowerCase().contains(
                  sellVm.brandSearchController.text.toLowerCase(),
                ) ??
                false;
          }).toList();

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.allowMultipleSelection
                        ? "Select Brands"
                        : "Select Brand",
                    style: AppTextStyles.neueMontreal(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  // Show Done button for multiple selection
                  if (widget.allowMultipleSelection)
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, selectedBrands.toList());
                      },
                      child: Text(
                        "Done (${selectedBrands.length})",
                        style: AppTextStyles.neueMontreal(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 16.h),

              // Search Bar
              TextField(
                controller: sellVm.brandSearchController,
                onChanged: (value) {
                  // Trigger rebuild to filter brands
                  sellVm.updateBrandSearch(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search brands...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: sellVm.brandSearchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            sellVm.clearBrandSearch();
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
                style: AppTextStyles.neueMontreal(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 16.h),

              // Multiple selection info text
              if (widget.allowMultipleSelection && selectedBrands.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Text(
                    "${selectedBrands.length} brand${selectedBrands.length == 1 ? '' : 's'} selected",
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),

              SizedBox(
                height: 500.h,
                child: filteredBrands.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 48,
                              color: Colors.grey.shade400,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'No brands found',
                              style: AppTextStyles.neueMontreal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredBrands.length,
                        itemBuilder: (context, index) {
                          // Sort the list alphabetically by brand name
                          final sortedBrands = List.from(filteredBrands)
                            ..sort(
                              (a, b) => (a.name ?? '').toLowerCase().compareTo(
                                (b.name ?? '').toLowerCase(),
                              ),
                            );

                          final brand = sortedBrands[index];
                          final isSelected = widget.allowMultipleSelection
                              ? selectedBrands.contains(brand)
                              : brand == selectedBrand;

                          return Material(
                            color: isSelected
                                ? Colors.grey.shade100
                                : Colors.white,
                            child: InkWell(
                              onTap: () {
                                if (widget.allowMultipleSelection) {
                                  setState(() {
                                    if (selectedBrands.contains(brand)) {
                                      selectedBrands.remove(brand);
                                    } else {
                                      selectedBrands.add(brand);
                                      sellVm.setSelectedBrands(
                                        selectedBrands.toList(),
                                      );
                                    }
                                  });
                                } else {
                                  sellVm.setSelectedBrand(brand);
                                  Navigator.pop(
                                    context,
                                    sellVm.selectedBrandModel,
                                  );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 14,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        brand.name ?? '',
                                        style: AppTextStyles.neueMontreal(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Show tick mark for selected items
                                    if (isSelected)
                                      Icon(
                                        Icons.check,
                                        color: AppColors.primaryColor,
                                        size: 20.sp,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// class AddBrandField extends StatelessWidget {
//   final TextEditingController controller;
//   final Function() onPressed;
//   const AddBrandField({
//     super.key,
//     required this.controller,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: SizedBox(
//                 height: 40.h,
//                 child: TextFormField(
//                   controller: controller,
//                   style: AppTextStyles.neueMontreal(
//                     color: AppColors.primaryBlack,
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: InputDecoration(
//                     hintText: "Enter Brand Name",
//                     contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
//                     hintStyle: AppTextStyles.neueMontreal(
//                       color: Colors.grey,
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.r),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.r),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.r),
//                       borderSide: const BorderSide(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             10.horizontalSpace,
//             CustomAppButtons.primaryButton(
//               onTap: () {
//                 if (controller.text.isNotEmpty) {
//                   onPressed();
//                 }
//               },
//               text: "Add",
//               borderRadius: 10.r,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
