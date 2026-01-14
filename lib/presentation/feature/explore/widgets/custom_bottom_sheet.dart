// ignore_for_file: use_build_context_synchronously

import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/select_dropdown.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/explore/widgets/price_range_slider.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/brands_bottom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/color_bottom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/color_picker.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/condition_bottom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_arrow.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_functions_sheets.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/shipping_from_list.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/size_bottom_sheet.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetScreen extends StatefulWidget {
  final ExploreViewModel viewModel;
  const CustomBottomSheetScreen({super.key, required this.viewModel});

  @override
  State<CustomBottomSheetScreen> createState() =>
      _CustomBottomSheetScreenState();
}

class _CustomBottomSheetScreenState extends State<CustomBottomSheetScreen> {
  double selectedPrice = 0;
  @override
  Widget build(BuildContext context) {
    final sellVm = context.watch<SellViewModel>();

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  height: 5.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter',
                    style: AppTextStyles.neueMontreal(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              PriceSliderCard(
                value: sellVm.selectedPriceRange ?? 0,
                onChanged: (val) {
                  sellVm.setSelectedPriceRange(val);
                },
              ),
              const SizedBox(height: 16),
              CustomArrowButton(
                onTap: () {
                  BottomSheetHelper().showCategoryBottomSheet(
                    context: context,
                    title: 'Select Categories',
                    child: StatefulBuilder(
                      builder: (ctx, setStateSheet) {
                        final allCats = [
                          ...sellVm.categories,
                          ...sellVm.subCategories,
                        ];
                        return SizedBox(
                          height: 420.h,
                          child: ListView.separated(
                            itemCount: allCats.length,
                            separatorBuilder: (_, __) =>
                                Divider(height: 1, color: Colors.grey.shade200),
                            itemBuilder: (_, i) {
                              final c = allCats[i];
                              final name = c.name ?? '';
                              final selected = sellVm.selectedFilterCategories
                                  .contains(name);
                              return ListTile(
                                title: Text(name),
                                trailing: Checkbox(
                                  value: selected,
                                  onChanged: (v) {
                                    sellVm.toggleFilterCategory(name);
                                    setStateSheet(() {});
                                  },
                                ),
                                onTap: () {
                                  sellVm.toggleFilterCategory(name);
                                  setStateSheet(() {});
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
                text: sellVm.selectedFilterCategories.isEmpty
                    ? 'Category'
                    : sellVm.selectedFilterCategories.length <= 2
                    ? sellVm.selectedFilterCategories.join(', ')
                    : '${sellVm.selectedFilterCategories.take(2).join(', ')} & ${sellVm.selectedFilterCategories.length - 2} more',
                height: 50.h,
                width: double.infinity,
              ),
              15.verticalSpace,
              CustomArrowButton(
                onTap: () {
                  sellVm.getBrands(context).then((value) {
                    if (value && context.mounted && sellVm.brands.isNotEmpty) {
                      BottomSheetHelper().showCategoryBottomSheet(
                        context: context,
                        title: "Select Brands",
                        child: SelectBrandSheet(allowMultipleSelection: true),
                      );
                    }
                  });
                },
                text: () {
                  final brands = context
                      .watch<SellViewModel>()
                      .selectedBrands; // <-- replace with actual provider
                  if (brands.isEmpty) return 'Brand';

                  if (brands.length <= 2) {
                    return brands.map((e) => e.name).join(', ');
                  } else {
                    final firstFour = brands
                        .take(2)
                        .map((e) => e.name)
                        .join(', ');
                    final moreCount = brands.length - 2;
                    return '$firstFour & $moreCount more';
                  }
                }(),
                height: 50.h,
                width: double.infinity,
              ),
              15.verticalSpace,
              CustomArrowButton(
                onTap: () {
                  BottomSheetHelper().showCategoryBottomSheet(
                    context: context,
                    title: "Select Condition",
                    child: const SelectConditionSheet(),
                  );
                },
                text: sellVm.selectedFilterConditions.isEmpty
                    ? 'Select Conditions'
                    : sellVm.selectedFilterConditions.length <= 2
                    ? sellVm.selectedFilterConditions.join(', ')
                    : '${sellVm.selectedFilterConditions.take(2).join(', ')} & ${sellVm.selectedFilterConditions.length - 2} more',
                height: 50.h,
                width: double.infinity,
              ),
              15.verticalSpace,
              CustomArrowButton(
                onTap: () {
                  BottomSheetHelper().showCategoryBottomSheet(
                    context: context,
                    title: "Size",
                    child: const SelectSizeSheet(),
                  );
                },
                text: sellVm.selectedSizeOption?.label ?? 'Size',
                height: 50.h,
                width: double.infinity,
              ),
              3.verticalSpace,
              ColorSelectorTile(
                title: '',
                label: context.watch<SellViewModel>().selectedColors.isNotEmpty
                    ? context
                          .watch<SellViewModel>()
                          .selectedColors
                          .map((e) => e.toString())
                          .join(', ')
                    : 'Color',
                initialColor: Colors.greenAccent.shade100,
                onColorChanged: (newColor) {},
                onTap: () {
                  BottomSheetHelper().showCategoryBottomSheet(
                    context: context,
                    title: "Select Color",
                    child: SelectColorSheet(),
                  );
                },
              ),

              15.verticalSpace,
              DropdownSelectorTile(
                label: "Shipping From",
                selectedValue: sellVm.selectedShippingFromModel?.name,
                onTap: () {
                  sellVm.getShipFrom(context).then((value) {
                    if (value &&
                        context.mounted &&
                        sellVm.shipFromList.isNotEmpty) {
                      BottomSheetHelper().showBottomSheet(
                        context: context,
                        title: "Shipping From",
                        child: ShippingFromList(),
                      );
                    }
                  });
                },
              ),
              30.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomAppButtons.primaryButton(
                      text: 'Clear All',
                      onTap: () {
                        sellVm.clear();
                        Navigator.pop(context);
                      },
                      backgroundColor: AppColors.white,
                      textColor: AppColors.black,
                      width: 160.w,
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: CustomAppButtons.primaryButton(
                      text: 'Apply',
                      width: 160.w,
                      onTap: () async {
                        final sellVm = getIt.get<SellViewModel>();
                        widget.viewModel.filterSearchResults(
                          categories: sellVm.selectedFilterCategories.isEmpty
                              ? null
                              : List<String>.from(
                                  sellVm.selectedFilterCategories,
                                ),
                          size: sellVm.selectedSizeOption != null
                              ? "${sellVm.selectedSizeOption?.category}-${sellVm.selectedSizeOption?.label}"
                              : null,
                          colors: sellVm.selectedColors
                              .map((e) => e.toLowerCase())
                              .toList(),
                          brandIds: sellVm.selectedBrands
                              .map((e) => e.id)
                              .nonNulls
                              .toList(),
                          conditions: sellVm.selectedFilterConditions.isEmpty
                              ? null
                              : List<String>.from(
                                  sellVm.selectedFilterConditions,
                                ),
                          shippingFrom: sellVm.selectedShippingFromModel?.name,
                          price: sellVm.selectedPriceRange,
                        );
                        Navigator.pop(context);
                        sellVm.clear();
                      },
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
