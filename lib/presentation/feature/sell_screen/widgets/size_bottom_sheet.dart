import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectSizeSheet extends StatefulWidget {
  const SelectSizeSheet({super.key});

  @override
  State<SelectSizeSheet> createState() => _SelectSizeSheetState();
}

class _SelectSizeSheetState extends State<SelectSizeSheet>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final sellVm = context.read<SellViewModel>();
    final tabLength = sellVm.groupedSizes.keys.length;
    if (tabLength > 0) {
      _tabController ??= TabController(length: tabLength, vsync: this);
      if (_tabController!.length != tabLength) {
        _tabController!.dispose();
        _tabController = TabController(length: tabLength, vsync: this);
      }
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sellVm = context.watch<SellViewModel>();
    final groupedSizes = sellVm.groupedSizes;
    final filteredGroupedSizes = Map.fromEntries(
      groupedSizes.entries.where((e) => e.value.isNotEmpty),
    );
    final screenHeight = MediaQuery.of(context).size.height;
    if (filteredGroupedSizes.isEmpty) {
      return Center(child: Text('No sizes available for this category'));
    }
    final tabKeys = filteredGroupedSizes.keys.toList();
    if (_tabController == null || _tabController!.length != tabKeys.length) {
      _tabController?.dispose();
      _tabController = TabController(length: tabKeys.length, vsync: this);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xffEFF3F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              labelStyle: AppTextStyles.neueMontreal(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              unselectedLabelStyle: AppTextStyles.neueMontreal(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              tabs: tabKeys.map((key) => Tab(text: key)).toList(),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.3,
            child: TabBarView(
              controller: _tabController,
              children: tabKeys.map((category) {
                final sizes = filteredGroupedSizes[category]!;
                return LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth;
                    final crossAxisCount = maxWidth ~/ 100;
                    return GridView.count(
                      crossAxisCount: crossAxisCount > 2 ? crossAxisCount : 2,
                      childAspectRatio: 2.3,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: sizes.map((size) {
                        final isSelected = sellVm.selectedSizeIds.contains(
                          size.id,
                        );
                        return GestureDetector(
                          onTap: () {
                            sellVm.toggleSelectedSize(category, size.id);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.pink.shade50
                                  : Colors.white,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.pink
                                    : Colors.grey.shade400,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              size.value,
                              style: AppTextStyles.leagueSpartan(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? Colors.pink : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomAppButtons.primaryButton(
              text: 'Done',
              onTap: () {
                if (sellVm.selectedSizeIds.isNotEmpty) {
                  Navigator.pop(context);
                }
              },
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class SizeOption {
  final String label;
  final String category;

  SizeOption({required this.label, required this.category});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SizeOption &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          category == other.category;

  @override
  int get hashCode => label.hashCode ^ category.hashCode;
}
