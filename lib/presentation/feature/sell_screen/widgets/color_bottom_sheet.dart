import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectColorSheet extends StatefulWidget {
  const SelectColorSheet({
    super.key,
  });

  @override
  State<SelectColorSheet> createState() => _SelectColorSheetState();
}

class _SelectColorSheetState extends State<SelectColorSheet> {
  @override
  Widget build(BuildContext context) {
    final sellVm = context.watch<SellViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 25,
            runSpacing: 16,
            children: colorMap.entries.map((entry) {
              final name = entry.key;
              final color = entry.value;
              final isSelected = sellVm.selectedColors.contains(name);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      sellVm.toggleColor(name);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: Colors.pink, width: 2)
                            : Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 16,
                        child: name == "White"
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    name,
                    style: AppTextStyles.neueMontreal(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
