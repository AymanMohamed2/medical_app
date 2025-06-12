import 'package:flutter/material.dart';
import 'package:medical_app/core/entities/message_entity.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.message,
  });
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: message.isUserMessage ? 40 : 10,
          right: !message.isUserMessage ? 40 : 10),
      child: Align(
        alignment: message.isUserMessage
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: ShapeDecoration(
            color: message.isUserMessage
                ? AppColors.lightGrey.withOpacity(0.85)
                : AppColors.darkGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          child: Text(
            softWrap: true,
            message.message,
            style: AppStyles.styleRegular14,
          ),
        ),
      ),
    );
  }
}
