import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final List<String> initialTags;
  final ValueChanged<List<String>> onChanged;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  const TagInputField({
    super.key,
    required this.label,
    this.focusNode,
    required this.onFieldSubmitted,
    required this.hintText,
    required this.onChanged,
    this.initialTags = const [],
  });

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  final TextEditingController _controller = TextEditingController();
  final int _maxTags = 5;
  late List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tags = [...widget.initialTags];
  }

  void _handleTagInput(String value) {
    final newTags = value
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty && !_tags.contains(tag))
        .map(
          (tag) => tag.startsWith('#') ? tag : '#$tag',
        ) // Add # if not already present
        .toList();

    if (_tags.length + newTags.length > _maxTags) {
      newTags.removeRange(_maxTags - _tags.length, newTags.length);
    }

    setState(() {
      _tags.addAll(newTags);
      _controller.clear();
    });

    widget.onChanged(_tags);
  }

  void _removeTag(int index) {
    setState(() {
      _tags.removeAt(index);
    });
    widget.onChanged(_tags);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.neueMontreal(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: widget.focusNode ,
                  controller: _controller,
                  onFieldSubmitted: widget.onFieldSubmitted ?? _handleTagInput,
                  enabled: _tags.length < _maxTags,
                  decoration: InputDecoration(
                    hintText: widget.hintText,

                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    hintStyle: AppTextStyles.neueMontreal(
                      color: AppColors.lightblack.withValues(alpha: 0.7),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              4.horizontalSpace,
              ElevatedButton(
                onPressed: () => _handleTagInput(_controller.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                child: Text(
                  'Add',
                  style: AppTextStyles.neueMontreal(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        10.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: _tags.asMap().entries.map((entry) {
            final e = entry.value;
            final index = entry.key;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    e,
                    style: AppTextStyles.neueMontreal(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  4.horizontalSpace,
                  InkWell(
                    onTap: () => _removeTag(index),
                    child: Icon(Icons.close, size: 13.sp, color: Colors.grey),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        if (_tags.length >= _maxTags)
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "Maximum of 5 tags allowed.",
              style: AppTextStyles.neueMontreal(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
