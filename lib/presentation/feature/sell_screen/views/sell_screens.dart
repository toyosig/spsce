import 'dart:developer';
import 'dart:io';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/select_dropdown.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/shipping_to.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/views/first_sell_screen.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/brands_bottom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/category_bottoom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/color_bottom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/color_picker.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/condition_bottom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_arrow.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_functions_sheets.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_text_field.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/photo_box.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/register_seller.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/shipping_from_list.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/size_bottom_sheet.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/tag_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/order_action_dialog_box.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../utils/helpers/message_helper.dart';

class SellScreen extends StatefulWidget {
  final bool? isEdit;
  final ProductsData? product;

  const SellScreen({super.key, this.isEdit = false, this.product});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  late SellViewModel viewModel;
  late ProfileViewModel profileVm;
  bool isFirstSale = false;

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<SellViewModel>();
    profileVm = getIt.get<ProfileViewModel>();
    checkFirstSale();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isEdit == true) {
        viewModel.clear();
        viewModel.setControllers(widget.product!);
        viewModel.selectedImages = widget.product!.photos ?? [];
        viewModel.selectedImages = [];
      } else {
        profileVm.getUserProfile();
        viewModel.clear();
      }
    });
  }

  void checkFirstSale() async {
    isFirstSale = await profileVm.getIsFirstSale();
  }

 
  @override
  Widget build(BuildContext context) {   
    return Consumer<ProfileViewModel>(
      builder: (context, profileVm, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: isFirstSale
              ? FirstSaleScreen()
              : profileVm.user?.seller == null
              ? const SellerRegisteration()
              : SellFormContent(
                  isEdit: widget.isEdit ?? false,
                  product: widget.product,
                ),
        );
      },
    );
  }
}

class SellFormContent extends StatelessWidget {
  final bool isEdit;
  final ProductsData? product;

  const SellFormContent({super.key, required this.isEdit, this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryAppBar(
          title: isEdit ? 'Edit item' : 'Sell an item',
          showTrailing: false,
          isBackButtonVisible: isEdit,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: SingleChildScrollView(
              child: SellForm(isEdit: isEdit, product: product),
            ),
          ),
        ),
      ],
    );
  }
}

class SellForm extends StatefulWidget {
  final bool isEdit;
  final ProductsData? product;

  const SellForm({super.key, required this.isEdit, this.product});

  @override
  State<SellForm> createState() => _SellFormState();
}

class _SellFormState extends State<SellForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          const PhotosSection(),
          const ProductDetailsSection(),
          const ProductAttributesSection(),
          const QuantitySection(),
          const ShippingSection(),
          30.verticalSpace,
          ActionButtonsSection(
            isEdit: widget.isEdit,
            product: widget.product,
            formKey: _formKey,
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}

class PhotosSection extends StatelessWidget {
  const PhotosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        final imageCount = sellVm.selectedImages.length;
        final canAddMoreImages = imageCount < 4;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Photos',
                  style: AppTextStyles.neueMontreal(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  '$imageCount/4',
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: imageCount >= 4
                        ? AppColors.pink
                        : AppColors.lightblack,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Add up to 4 images of your item',
              style: AppTextStyles.neueMontreal(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.lightblack,
              ),
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16.w,
                children: [
                  if (canAddMoreImages)
                    AddPhotoBox(
                      onTap: () {
                        if (canAddMoreImages) {
                          sellVm.pickImageFromGallery(context);
                        } else {
                          MessageHelper.showErrorMessage(
                            context,
                            "You can add only 4 media content",
                          );
                        }
                      },
                      text: 'Add a photo',
                      icon: Icons.camera_alt_outlined,
                    ),
                  if (sellVm.videoThumbnail == null) ...[AddVideoBox()],
                  if (sellVm.selectedImages.isNotEmpty ||
                      sellVm.videoThumbnail != null) ...[
                    Row(
                      children: [
                        if (sellVm.selectedImages.isNotEmpty) ...[
                          SelectedImagesList(
                            selectedImages: sellVm.selectedImages,
                          ),
                        ],
                        if (sellVm.videoThumbnail != null &&
                            sellVm.videoThumbnail!.isNotEmpty) ...[
                          VideoSection(videoThumbnail: sellVm.videoThumbnail!),
                          SizedBox(width: 16.h),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (!canAddMoreImages) ...[
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.primaryColor.withAlpha(
                      (255 * 0.3).toInt(),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.primaryColor,
                      size: 16.sp,
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Maximum 4 images allowed. Remove some images to add more.',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class SelectedImagesList extends StatelessWidget {
  final List<String> selectedImages;

  const SelectedImagesList({super.key, required this.selectedImages});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        selectedImages.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: ImageItem(imagePath: selectedImages[index], index: index),
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imagePath;
  final int index;

  const ImageItem({super.key, required this.imagePath, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return SizedBox(
          width: 128.w,
          height: 94.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: imagePath.startsWith('file')
                    ? NetworkImageHelper(
                        imagePath: imagePath,
                        width: 128.w,
                        height: 94.h,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(imagePath),
                        width: 128.w,
                        height: 94.h,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                top: -7,
                right: -7,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlack.withValues(alpha: 0.4),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.grey, width: 1),
                        ),
                        child: Icon(
                          Icons.crop,
                          color: AppColors.grey,
                          size: 14.sp,
                        ),
                      ),
                      onTap: () {
                        sellVm.cropSingleImage(context, index);
                      },
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlack.withValues(alpha: 0.4),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.grey, width: 1),
                        ),
                        child: Icon(
                          Icons.close,
                          color: AppColors.grey,
                          size: 14.sp,
                        ),
                      ),
                      onTap: () {
                        sellVm.selectedImages.removeAt(index);
                        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                        sellVm.notifyListeners();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddVideoBox extends StatelessWidget {
  const AddVideoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return AddPhotoBox(
          onTap: () => sellVm.pickVideoFromGallery(context),
          text: 'Add video',
          icon: Icons.ondemand_video_sharp,
          isSelected: true,
        );
      },
    );
  }
}

class VideoSection extends StatelessWidget {
  final String videoThumbnail;

  const VideoSection({super.key, required this.videoThumbnail});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: 128.w,
              height: 94.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.file(File(videoThumbnail), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: -7,
              right: -7,
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlack.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.grey, width: 1),
                  ),
                  child: Icon(Icons.close, color: AppColors.grey, size: 14.sp),
                ),
                onTap: () {
                  sellVm.removeVideo();
                  log(
                    "thumb nail removed ${sellVm.videoThumbnail} || ${sellVm.pickedVideo}",
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return Column(
          children: [
            LabeledTextField(
              label: 'Title',
              hintText: 'What are you selling',
              controller: sellVm.titleController,
              maxLines: 1,
              isTitleVisible: true,

              // focusNode: ,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus(sellVm.firstFocus);
              },
              validator: FormValidators.validateRequired,
            ),
            10.verticalSpace,
            LabeledTextField(
              focusNode: sellVm.firstFocus,
              textInputAction: TextInputAction.newline,
              label: 'Description',
              textInputType: TextInputType.multiline,
              hintText: 'Enter the description of your item',
              controller: sellVm.descriptionController,
              maxLines: 7,
              isTitleVisible: true,
              validator: FormValidators.validateRequired,
            ),
            10.verticalSpace,
            TagInputField(
              key: ValueKey(sellVm.tags.join(',')),
              label: 'Tags',
              hintText: 'e.g. shoes, sneakers',
              initialTags: sellVm.tags,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus(sellVm.priceFocus);
              },
              onChanged: sellVm.onTagsChanged,
            ),
            10.verticalSpace,
            LabeledTextField(
              label: 'Price',
              hintText: 'Enter price',
              controller: sellVm.priceController,
              focusNode: sellVm.priceFocus,
              // nextFocusNode: sellVm.dropdownFocus,
              maxLines: 1,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus(sellVm.dropdownFocus);
              },
              isTitleVisible: true,
              textInputType: TextInputType.number,
              validator: FormValidators.validateRequired,
            ),
          ],
        );
      },
    );
  }
}

class ProductAttributesSection extends StatelessWidget {
  const ProductAttributesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        sellVm.priceFocus.unfocus();
        return Column(
          children: [
            CategorySelector(categoryDisplayText: sellVm.categoryDisplayText),
            10.verticalSpace,
            ConditionSelector(selectedCondition: sellVm.selectedCondition),
            10.verticalSpace,
            SizeSelector(selectedSizeOption: sellVm.selectedSizeOption),
            10.verticalSpace,
            BrandSelector(),
            10.verticalSpace,
            ColorSelector(selectedColors: sellVm.selectedColors),
          ],
        );
      },
    );
  }
}

class CategorySelector extends StatelessWidget {
  final String categoryDisplayText;

  const CategorySelector({super.key, required this.categoryDisplayText});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return CustomArrowButton(
          onTap: () {
            sellVm.getMainCategories(context).then((value) {
              if (value &&
                  context.mounted &&
                  sellVm.mainCategories.isNotEmpty) {
                BottomSheetHelper().showCategoryBottomSheet(
                  context: context,
                  child: const CategoryBottoomSheet(),
                  title: 'Select Category',
                );
              }
            });
          },
          text: categoryDisplayText,
          height: 50.h,
          width: double.infinity,
        );
      },
    );
  }
}

class ConditionSelector extends StatelessWidget {
  final dynamic selectedCondition;

  const ConditionSelector({super.key, this.selectedCondition});

  @override
  Widget build(BuildContext context) {
    return CustomArrowButton(
      onTap: () {
        BottomSheetHelper().showCategoryBottomSheet(
          context: context,
          title: "Select Condition",
          child: const SelectConditionSheet(),
        );
      },
      text: selectedCondition?.title ?? 'Select Condition',
      height: 50.h,
      width: double.infinity,
    );
  }
}

class SizeSelector extends StatelessWidget {
  final dynamic selectedSizeOption;
  const SizeSelector({super.key, this.selectedSizeOption});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return CustomArrowButton(
          onTap: () async {
            final categoryId = sellVm.selectedCategory?.id;
            if (categoryId == null || categoryId.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select a category first.'),
                ),
              );
              return;
            }
            await sellVm.fetchSizesForCategory(context, categoryId).then((
              value,
            ) {
              if (context.mounted) {
                BottomSheetHelper().showCategoryBottomSheet(
                  context: context,
                  title: "Select Size",
                  child: const SelectSizeSheet(),
                );
              } else {
                log('context is not mounted');
              }
            });
          },
          text: (() {
            final sellVm = context.read<SellViewModel>();
            if (sellVm.selectedSizeIds.isNotEmpty &&
                sellVm.groupedSizes.isNotEmpty) {
              final selectedValues = <String>[];
              sellVm.groupedSizes.forEach((tab, sizes) {
                for (final s in sizes) {
                  if (sellVm.selectedSizeIds.contains(s.id)) {
                    selectedValues.add(s.value);
                  }
                }
              });
              return selectedValues.join(', ');
            }
            return 'Select Size';
          })(),
          height: 50.h,
          width: double.infinity,
        );
      },
    );
  }
}

class BrandSelector extends StatelessWidget {
  const BrandSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return CustomArrowButton(
          onTap: () {
            sellVm.getBrands(context).then((value) {
              if (value && context.mounted && sellVm.brands.isNotEmpty) {
                BottomSheetHelper().showCategoryBottomSheet(
                  context: context,
                  title: "Select Brands",
                  child: SelectBrandSheet(),
                );
              }
            });
          },
          text: sellVm.selectedBrandModel?.name ?? 'Brand',
          height: 50.h,
          width: double.infinity,
        );
      },
    );
  }
}

class ColorSelector extends StatelessWidget {
  final List<dynamic> selectedColors;

  const ColorSelector({super.key, required this.selectedColors});

  @override
  Widget build(BuildContext context) {
    return ColorSelectorTile(
      label: selectedColors.isNotEmpty
          ? selectedColors.map((e) => e.toString()).join(', ')
          : 'Enter Color',
      initialColor: Colors.greenAccent.shade100,
      onColorChanged: (newColor) {
        // sellVm.setColor(newColor.toString());
      },
      onTap: () {
        BottomSheetHelper().showCategoryBottomSheet(
          context: context,
          title: "Select Color",
          child: SelectColorSheet(),
        );
      },
    );
  }
}

class QuantitySection extends StatelessWidget {
  const QuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        sellVm.priceFocus.unfocus();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity:',
              style: AppTextStyles.neueMontreal(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            10.verticalSpace,
            Container(
              height: 40.h,
              width: 140.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.lightgrey, width: 1.3),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  _QuantityButton(
                    icon: Icons.remove,
                    onTap: () {
                      if (int.tryParse(sellVm.quantityController.text) !=
                              null &&
                          int.parse(sellVm.quantityController.text) > 1) {
                        sellVm.decreaseQuantity();
                      }
                    },
                    isLeft: true,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        sellVm.quantityController.text.isNotEmpty
                            ? sellVm.quantityController.text
                            : '1',

                        style: AppTextStyles.neueMontreal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  _QuantityButton(
                    icon: Icons.add,
                    onTap: () => sellVm.increaseQuantity(),
                    isRight: true,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool isLeft;
  final bool isRight;

  const _QuantityButton({
    required this.icon,
    this.onTap,
    this.isLeft = false,
    this.isRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.horizontal(
        left: isLeft ? Radius.circular(20.r) : Radius.zero,
        right: isRight ? Radius.circular(20.r) : Radius.zero,
      ),
      child: Container(
        width: 40.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            left: isRight
                ? BorderSide(color: AppColors.lightgrey, width: 1.3)
                : BorderSide.none,
            right: isLeft
                ? BorderSide(color: AppColors.lightgrey, width: 1.3)
                : BorderSide.none,
          ),
          borderRadius: BorderRadius.horizontal(
            left: isLeft ? Radius.circular(20.r) : Radius.zero,
            right: isRight ? Radius.circular(20.r) : Radius.zero,
          ),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.grey, size: 18.sp),
      ),
    );
  }
}

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        sellVm.priceFocus.unfocus();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping',
              style: AppTextStyles.neueMontreal(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            10.verticalSpace,
            ShippingFromSelector(
              selectedShippingFromModel: sellVm.selectedShippingFromModel,
              shipFromList: sellVm.shipFromList,
            ),
            10.verticalSpace,
            ShippingToSelector(
              selectedShippingToModel: sellVm.selectedShippingToModel,
              shipToList: sellVm.shipToList,
            ),
          ],
        );
      },
    );
  }
}

class ShippingFromSelector extends StatelessWidget {
  final dynamic selectedShippingFromModel;
  final List<dynamic> shipFromList;

  const ShippingFromSelector({
    super.key,
    this.selectedShippingFromModel,
    required this.shipFromList,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return DropdownSelectorTile(
          label: "Shipping From",
          selectedValue: sellVm.selectedShippingFromModel?.name,
          onTap: () {
            sellVm.getShipFrom(context).then((value) {
              if (value && context.mounted && sellVm.shipFromList.isNotEmpty) {
                BottomSheetHelper().showBottomSheet(
                  context: context,
                  title: "Shipping From",
                  child: ShippingFromList(),
                );
              }
            });
          },
        );
      },
    );
  }
}

class ShippingToSelector extends StatelessWidget {
  final dynamic selectedShippingToModel;
  final List<dynamic> shipToList;

  const ShippingToSelector({
    super.key,
    this.selectedShippingToModel,
    required this.shipToList,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return DropdownSelectorTile(
          label: "Shipping To",
          selectedValue: sellVm.selectedShippingToModel?.title,
          onTap: () {
            sellVm.getShipTo(context).then((value) {
              if (value && context.mounted && sellVm.shipToList.isNotEmpty) {
                BottomSheetHelper().showBottomSheet(
                  context: context,
                  title: "Shipping To",
                  child: ShippingToList(),
                );
              }
            });
          },
        );
      },
    );
  }
}

class ActionButtonsSection extends StatelessWidget {
  final bool isEdit;
  final ProductsData? product;
  final GlobalKey<FormState> formKey;

  const ActionButtonsSection({
    super.key,
    required this.isEdit,
    this.product,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, sellVm, _) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            if (!isEdit)
              CustomAppButtons.primaryButton(
                text: 'Save to draft',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    sellVm.priceFocus.unfocus();
                    if (sellVm.selectedCategory != null &&
                        (sellVm.selectedCategory != null ||
                            sellVm.selectedCategory!.id != "")) {
                      sellVm.submitProductForSale(context, isDraft: true);
                    } else {
                      MessageHelper.showErrorMessage(
                        context,
                        "Please select a Category",
                        subTitle:
                            "Main Category and Sub Category are mandatory",
                      );
                    }
                  }
                },
                backgroundColor: AppColors.white,
                textColor: AppColors.black,
                borderRadius: 2,
                width: 150.w,
              ),
            CustomAppButtons.primaryButton(
              width: 150.w,
              text: product?.isDraft == true
                  ? "Post"
                  : isEdit
                  ? 'Update'
                  : 'Post',
              onTap: () {
                sellVm.priceFocus.unfocus();
                if (isEdit) {
                  sellVm
                      .updateProduct(
                        context: context,
                        productId: product!.id!,
                        isDraft: false,
                      )
                      .then((val) {
                        if (val == true && context.mounted) {
                          context.pop();
                          context.pop();
                          final homeViewModel = getIt.get<HomeViewModel>();
                          homeViewModel.setIndex(0);
                          Future.microtask(() {
                            if (context.mounted) {
                              showDialog(
                                // ignore: use_build_context_synchronously
                                context: Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).context,
                                barrierDismissible: false,
                                builder: (_) => Dialog(
                                  backgroundColor: Colors.white,
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                  ),
                                  shape: RoundedRectangleBorder(),
                                  child: OrderActionDialogBox(
                                    onSubmitText: "See Product",
                                    onCancelTap: () {
                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).pop();
                                    },
                                    onCancelText: '',
                                    title: "Your Listing is posted and live",
                                    subTitle:
                                        'you can see your product in live',
                                    isSuccess: true,
                                    showButtons: false,
                                    buttonText: '',
                                    onSubmitTap: () {},
                                  ),
                                ),
                              );
                            }
                          });
                        }
                      });
                } else {
                  if (formKey.currentState!.validate()) {
                    if (sellVm.selectedCategory != null &&
                        (sellVm.selectedCategory != null ||
                            sellVm.selectedCategory!.id != "")) {
                      sellVm.submitProductForSale(context, isDraft: false);
                    } else {
                      MessageHelper.showErrorMessage(
                        context,
                        "Please select a Category",
                        subTitle:
                            "Main Category and Sub Category are mandatory",
                      );
                    }
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
