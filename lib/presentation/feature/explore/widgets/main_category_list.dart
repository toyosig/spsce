import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/explore/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainCategoryList extends StatelessWidget {
  const MainCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExploreViewModel>();  
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: viewModel.mainCategoryList.length,
      itemBuilder: (context, index) {
        final mainCategory = viewModel.mainCategoryList[index];
        final relatedCategories = viewModel.categories[mainCategory.id];
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: GenderCategorySection(
            title: mainCategory.name ?? '',
            image: mainCategory.logo,
            categories: relatedCategories ?? [],
          ),
        );
      },
    );
  }
}
