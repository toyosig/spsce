import 'package:circ/data/models/chat/inbox/message_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// import '../../../../../data/models/chat/inbox/message_model.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles({super.key, required this.isMe, required this.message});

  final bool isMe;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
                bottomLeft: isMe ? Radius.circular(16.r) : Radius.circular(4.r),
                bottomRight: isMe
                    ? Radius.circular(4.r)
                    : Radius.circular(16.r),
              ),
              color: isMe ? AppColors.chatgreen : AppColors.chatgrey,
            ),
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  message.text ?? '',
                  style: TextStyle(color: AppColors.black, fontSize: 16.sp),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          Text(
            message.createdAt != null && message.createdAt!.isNotEmpty
                ? DateFormat.jm().format(
                    DateTime.parse(message.createdAt!).toLocal(),
                  )
                : '',
            style: AppTextStyles.neueMontreal(
              fontSize: 11.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
