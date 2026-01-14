import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryBottoomSheet extends StatefulWidget {
  const CategoryBottoomSheet({super.key});

  @override
  State<CategoryBottoomSheet> createState() => _CategoryBottoomSheetState();
}

class _CategoryBottoomSheetState extends State<CategoryBottoomSheet> {
  bool showSubCategory = false;
  bool isSubSubCategory = false;
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<SellViewModel>(
      builder: (context, viewModel, _) {
        Widget currentChild;
        switch (viewModel.currentLevel) {
          case 0:
            currentChild = _buildMainCategories(context, viewModel);
            break;
          case 1:
            currentChild = _buildCategories(context, viewModel);
            break;
          case 2:
            currentChild = _buildSubCategories(context, viewModel);
            break;
          default:
            currentChild = const SizedBox.shrink();
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: currentChild,
        );
      },
    );
  }

  Widget _buildMainCategories(BuildContext context, SellViewModel vm) {
    return Column(
      key: const ValueKey('main'),
      children: vm.mainCategories.map((category) {
        return ListTile(
          title: Text(category.name ?? 'Unnamed'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            vm.setMainCategory(category);
            vm.getCategories(context, category.id ?? '').then((value) {
              if (value == true && vm.categories.isNotEmpty) {
                vm.setCurrentPage(1);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildCategories(BuildContext context, SellViewModel vm) {
    return Column(
      key: const ValueKey('sub'),
      children: vm.categories.map((category) {
        return ListTile(
          title: Text(category.name ?? 'Unnamed'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            vm.setCategory(category);
            vm.getSubCategories(context, category.id ?? '').then((value) {
              if (value == true && vm.subCategories.isNotEmpty) {
                vm.setCurrentPage(2);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildSubCategories(BuildContext context, SellViewModel vm) {
    return Column(
      key: const ValueKey('subsub'),
      children: vm.subCategories.map((category) {
        return ListTile(
          title: Text(category.name ?? 'Unnamed'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            vm.setSubCategory(category);
            Navigator.of(
              context,
            ).pop(category.name ?? '');
          },
        );
      }).toList(),
    );
  }
}
