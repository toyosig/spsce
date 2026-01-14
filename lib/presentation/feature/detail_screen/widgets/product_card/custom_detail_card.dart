import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/product_card/product_mdeia_crausal.dart'
    show ProductMediaCarousel;
import 'package:circ/presentation/feature/detail_screen/widgets/product_card/product_seller_header.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailCard extends StatefulWidget {
  final ProductsData product;
  final bool? isSellerProduct;
  final VoidCallback? onproductTap;
  final Function() onFavoriteToggle;
  final VoidCallback? onSellerProductPress;

  const ProductDetailCard({
    super.key,
    required this.onFavoriteToggle,
    this.onproductTap,
    this.isSellerProduct,
    this.onSellerProductPress,
    required this.product,
  });

  @override
  State<ProductDetailCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductDetailCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onproductTap,
      child: Container(
        decoration: BoxDecoration(color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            ProductSellerHeader(widget: widget),
            ProductMediaCarousel(
              onFavoriteToggle: widget.onFavoriteToggle,
              product: widget.product,
            ),
            buildDetailRow(splitString: widget.product.color?.split(', ')),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow({List<String>? splitString}) {
    final List<String> details = [];

    final brand = widget.product.brand?.name?.trim();
    final subCategory = widget.product.subCategory?.name?.trim();
    final category = widget.product.category?.name?.trim();
    final size = widget.product.sizes?.entries
        .expand((entry) => entry.value.map((v) => '${entry.key}-${v.value}'))
        .join(', ')
        .trim();
    final condition = widget.product.condition?.trim();

    // Show subCategory if available, otherwise show category
    if (subCategory != null && subCategory.isNotEmpty) {
      details.add(subCategory);
    } else if (category != null && category.isNotEmpty) {
      details.add(category);
    }
    if (size != null && size.isNotEmpty && !size.startsWith('null')) {
      details.add(size);
    }
    if (condition != null && condition.isNotEmpty) details.add(condition);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            if (brand != null && brand.isNotEmpty) ...[
              Text(
                brand,
                style: AppTextStyles.neueMontreal(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlack,
                ),
              ),
            ],
            ...List.generate(details.length, (index) {
              return Row(
                children: [
                  SizedBox(width: 10.w),
                  Text(
                    details[index],
                    style: AppTextStyles.neueMontreal(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBlack.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              );
            }),
            if (splitString != null && splitString.isNotEmpty)
              SizedBox(width: 10.w),

            if (splitString != null && splitString.isNotEmpty)
              Row(
                children: splitString.map((colorName) {
                  final color = Formators().colorFromNameInsensitive(
                    colorName.trim(),
                  );
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: CircleAvatar(
                      radius: 5.r,
                      backgroundColor: color,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black87, width: 0.5),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
