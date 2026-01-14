import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/categories/category_data_model.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/explore/widgets/custom_bottom_sheet.dart';
import 'package:circ/presentation/feature/explore/widgets/custom_dropdown.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FilterRow extends StatefulWidget {
  final ExploreViewModel viewModel;

  const FilterRow({super.key, required this.viewModel});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppButtons.primaryIconButton(
              text: 'Filters',
              onTap: () {
                final sellVm = Provider.of<SellViewModel>(
                  context,
                  listen: false,
                );
                final exploreVm = widget.viewModel;
                sellVm.syncFromExploreFilters(
                  size: exploreVm.appliedSize,
                  colors: List<String>.from(exploreVm.appliedColors),
                  brandIds: exploreVm.appliedBrandIds,
                  brandNames: exploreVm.appliedBrandName,
                  conditions: exploreVm.appliedConditions,
                  shippingFrom: exploreVm.appliedShippingFrom,
                  allBrands: exploreVm.brands,
                  allConditions: conditions,
                  allShippingFrom: sellVm.shipFromList,
                );
                BuildContext bottomSheetContext = context;
                showModalBottomSheet(
                  context: bottomSheetContext,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) =>
                      CustomBottomSheetScreen(viewModel: widget.viewModel),
                );
              },
              svg: SvgPicture.asset(
                AppImages.filterIcon,
                height: 18.h,
                width: 18.w,
              ),
              iconColor: AppColors.primaryBlack,
              width: 165.5.w,
              height: 47.h,
              backgroundColor: AppColors.white,
              textColor: AppColors.primaryBlack,
              borderRadius: 8.r,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              borderColor: Colors.grey.shade400,
            ),
            CustomDropdown(
              items: const [
                'Newest first',
                'Oldest first',
                'Price low to high',
                'Price high to low',
                'Most Popular',
              ],
              selectedValue: widget.viewModel.selectedSortOption,
              openAbove: false,
              onChanged: (val) {
                setState(() => widget.viewModel.selectedSortOption = val);
                widget.viewModel.sortSearchResults(val);
              },
            ),
          ],
        ),
        // --- Applied Filters Horizontal List ---
        if ((widget.viewModel.appliedCategories != null &&
                widget.viewModel.appliedCategories!.isNotEmpty) ||
            (widget.viewModel.appliedSize != null &&
                widget.viewModel.appliedSize!.isNotEmpty) ||
            widget.viewModel.appliedColors.isNotEmpty ||
            (widget.viewModel.appliedBrandName != null &&
                widget.viewModel.appliedBrandName!.isNotEmpty) ||
            (widget.viewModel.appliedConditions != null &&
                widget.viewModel.appliedConditions!.isNotEmpty) ||
            (widget.viewModel.appliedPrice != null) ||
            (widget.viewModel.appliedShippingFrom != null &&
                widget.viewModel.appliedShippingFrom!.isNotEmpty))
          Container(
            height: 38,
            margin: EdgeInsets.only(top: 8, bottom: 2),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Subcategory filter chip
                if (widget.viewModel.selectedSubCategoryId != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      color: WidgetStateProperty.all(AppColors.primaryBlack),
                      label: Text(
                        (widget.viewModel.selectedMainCategoryId != null &&
                                widget.viewModel.categories[widget
                                        .viewModel
                                        .selectedMainCategoryId!] !=
                                    null)
                            ? (widget
                                      .viewModel
                                      .categories[widget
                                          .viewModel
                                          .selectedMainCategoryId!]!
                                      .firstWhere(
                                        (subcat) =>
                                            subcat.id ==
                                            widget
                                                .viewModel
                                                .selectedSubCategoryId,
                                        orElse: () =>
                                            CategoryData(id: '', name: ''),
                                      )
                                      .name ??
                                  '')
                            : '',
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onDeleted: () {
                        setState(() {
                          widget.viewModel.setSelectedCategory(
                            mainCategoryId:
                                widget.viewModel.selectedMainCategoryId,
                            subCategoryId: null,
                            name: null,
                          );
                        });
                        widget.viewModel.getProductsByCategory(
                          context,
                          isRefresh: true,
                        );
                      },
                      iconTheme: IconThemeData(color: AppColors.white),
                      onSelected: (_) {},
                    ),
                  ),
                // Third-level category filter chip
                if (widget.viewModel.selectedThirdCategoryId != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      color: WidgetStateProperty.all(AppColors.primaryBlack),
                      label: Text(
                        (widget.viewModel.selectedSubCategoryId != null &&
                                widget.viewModel.thirdLevelCategories[widget
                                        .viewModel
                                        .selectedSubCategoryId!] !=
                                    null)
                            ? (widget
                                      .viewModel
                                      .thirdLevelCategories[widget
                                          .viewModel
                                          .selectedSubCategoryId!]!
                                      .firstWhere(
                                        (cat) =>
                                            cat.id ==
                                            widget
                                                .viewModel
                                                .selectedThirdCategoryId,
                                        orElse: () =>
                                            CategoryData(id: '', name: ''),
                                      )
                                      .name ??
                                  '')
                            : '',
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      iconTheme: IconThemeData(color: AppColors.white),
                      onDeleted: () {
                        setState(() {
                          widget.viewModel.setSelectedCategory(
                            mainCategoryId:
                                widget.viewModel.selectedMainCategoryId,
                            subCategoryId:
                                widget.viewModel.selectedSubCategoryId,
                            thirdCategoryId: null,
                            name: null,
                          );
                        });
                        widget.viewModel.getProductsByCategory(
                          context,
                          isRefresh: true,
                        );
                      },
                      onSelected: (_) {},
                    ),
                  ),

                if (widget.viewModel.appliedCategories != null &&
                    widget.viewModel.appliedCategories!.isNotEmpty)
                  ...widget.viewModel.appliedCategories!.map(
                    (cat) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FilterChip(
                        color: WidgetStateProperty.all(AppColors.primaryBlack),
                        label: Text(
                          'Category: $cat',
                          style: AppTextStyles.neueMontreal(
                            color: AppColors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        iconTheme: IconThemeData(color: AppColors.white),
                        onDeleted: () {
                          widget.viewModel.removeAppliedCategory(category: cat);
                          widget.viewModel.filterSearchResults(
                            size: null,
                            colors: widget.viewModel.appliedColors,
                            brandIds: widget.viewModel.appliedBrandIds,
                            conditions: widget.viewModel.appliedConditions,
                            shippingFrom: widget.viewModel.appliedShippingFrom,
                            price: widget.viewModel.appliedPrice,
                            categories: widget.viewModel.appliedCategories,
                          );
                        },
                        onSelected: (_) {},
                      ),
                    ),
                  ),
                // Size filter chip
                if (widget.viewModel.appliedSize != null &&
                    widget.viewModel.appliedSize!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      color: WidgetStateProperty.all(AppColors.primaryBlack),
                      label: Text(
                        'Size: ${widget.viewModel.appliedSize}',
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      iconTheme: IconThemeData(color: AppColors.white),
                      onDeleted: () {
                        widget.viewModel.removeAppliedSize();
                        widget.viewModel.filterSearchResults(
                          size: null,
                          colors: widget.viewModel.appliedColors,
                          brandIds: widget.viewModel.appliedBrandIds,
                          conditions: widget.viewModel.appliedConditions,
                          shippingFrom: widget.viewModel.appliedShippingFrom,
                          price: widget.viewModel.appliedPrice,
                          categories: widget.viewModel.appliedCategories,
                        );
                      },
                      onSelected: (_) {},
                    ),
                  ),

                if (widget.viewModel.appliedPrice != null &&
                    widget.viewModel.appliedPrice! > 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      color: WidgetStateProperty.all(AppColors.primaryBlack),
                      label: Text(
                        'Price: ${widget.viewModel.appliedPrice!.toStringAsFixed(2)}',
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      iconTheme: IconThemeData(color: AppColors.white),
                      onDeleted: () {
                        widget.viewModel.removeAppliedPrice();
                        widget.viewModel.filterSearchResults(
                          size: widget.viewModel.appliedSize,
                          colors: widget.viewModel.appliedColors,
                          brandIds: null,
                          conditions: widget.viewModel.appliedConditions,
                          shippingFrom: widget.viewModel.appliedShippingFrom,
                          price: widget.viewModel.appliedPrice,
                          categories: widget.viewModel.appliedCategories,
                        );
                      },
                      onSelected: (_) {},
                    ),
                  ),
                // Color filter chips
                ...widget.viewModel.appliedColors.map(
                  (color) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      color: WidgetStateProperty.all(AppColors.primaryBlack),
                      label: Text(
                        'Color: $color',
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      iconTheme: IconThemeData(color: AppColors.white),
                      onDeleted: () {
                        widget.viewModel.removeAppliedColor(color);
                        widget.viewModel.filterSearchResults(
                          size: widget.viewModel.appliedSize,
                          colors: List<String>.from(
                            widget.viewModel.appliedColors,
                          ),
                          brandIds: widget.viewModel.appliedBrandIds,
                          conditions: widget.viewModel.appliedConditions,
                          shippingFrom: widget.viewModel.appliedShippingFrom,
                          price: widget.viewModel.appliedPrice,
                          categories: widget.viewModel.appliedCategories,
                        );
                      },
                      onSelected: (_) {},
                    ),
                  ),
                ),
                // Build one chip per selected brand
                if (widget.viewModel.appliedBrandIds != null &&
                    widget.viewModel.appliedBrandIds!.isNotEmpty)
                  ...widget.viewModel.appliedBrandIds!.map((id) {
                    final brandName = widget.viewModel.brands
                        .firstWhere(
                          (b) => b.id == id,
                          orElse: () => BrandModel(id: id, name: id),
                        )
                        .name;

                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FilterChip(
                        color: WidgetStateProperty.all(AppColors.primaryBlack),
                        label: Text(
                          'Brand: $brandName',
                          style: AppTextStyles.neueMontreal(
                            color: AppColors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        iconTheme: IconThemeData(color: AppColors.white),
                        onDeleted: () {
                          final newIds = List<String>.from(
                            widget.viewModel.appliedBrandIds!,
                          )..remove(id);

                          widget.viewModel.removeAppliedBrand(id: id);
                          widget.viewModel.filterSearchResults(
                            size: widget.viewModel.appliedSize,
                            colors: widget.viewModel.appliedColors,
                            brandIds: newIds.isEmpty ? null : newIds,
                            conditions: widget.viewModel.appliedConditions,
                            shippingFrom: widget.viewModel.appliedShippingFrom,
                            price: widget.viewModel.appliedPrice,
                            categories: widget.viewModel.appliedCategories,
                          );
                        },
                        onSelected: (_) {},
                      ),
                    );
                  }),
                // Condition filter chip
                if (widget.viewModel.appliedConditions != null &&
                    widget.viewModel.appliedConditions!.isNotEmpty)
                  ...widget.viewModel.appliedConditions!.map(
                    (cond) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FilterChip(
                        color: WidgetStateProperty.all(AppColors.primaryBlack),
                        label: Text(
                          'Condition: $cond',
                          style: AppTextStyles.neueMontreal(
                            color: AppColors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        iconTheme: IconThemeData(color: AppColors.white),
                        onDeleted: () {
                          widget.viewModel.removeAppliedCondition(
                            condition: cond,
                          );
                          widget.viewModel.filterSearchResults(
                            size: widget.viewModel.appliedSize,
                            colors: widget.viewModel.appliedColors,
                            brandIds: widget.viewModel.appliedBrandIds,
                            conditions: widget.viewModel.appliedConditions,
                            shippingFrom: widget.viewModel.appliedShippingFrom,
                            price: widget.viewModel.appliedPrice,
                            categories: widget.viewModel.appliedCategories,
                          );
                        },
                        onSelected: (_) {},
                      ),
                    ),
                  ),
                // Shipping From filter chip
                if (widget.viewModel.appliedShippingFrom != null &&
                    widget.viewModel.appliedShippingFrom!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      color: WidgetStateProperty.all(AppColors.primaryBlack),
                      label: Text(
                        'Shipping: ${widget.viewModel.appliedShippingFrom}',
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      iconTheme: IconThemeData(color: AppColors.white),
                      onDeleted: () {
                        widget.viewModel.removeAppliedShippingFrom();
                        widget.viewModel.filterSearchResults(
                          size: widget.viewModel.appliedSize,
                          colors: widget.viewModel.appliedColors,
                          brandIds: widget.viewModel.appliedBrandIds,
                          conditions: widget.viewModel.appliedConditions,
                          shippingFrom: null,
                          price: widget.viewModel.appliedPrice,
                          categories: widget.viewModel.appliedCategories,
                        );
                      },
                      onSelected: (_) {},
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
