import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../customs/text.dart';

class ConversationFooter extends StatelessWidget {
  final Function()? toggleLeftRecoding;
  final Function()? toggleRightRecoding;
  final Function()? onDelete;
  final Color? leftColor;
  final Color? rightColor;
  final bool isLeft;
  const ConversationFooter({
    super.key,
    this.toggleLeftRecoding,
    this.toggleRightRecoding,
    this.onDelete,
    this.leftColor,
    this.rightColor,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: toggleLeftRecoding,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color:
                  isLeft ? leftColor ?? Colors.white : rightColor ?? Colors.red,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  spreadRadius: -1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: const [
                CustomText(
                  'Record',
                  weight: FontWeight.w600,
                ),
                SizedBox(width: 6),
                Iconify(Ic.baseline_keyboard_voice)
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: onDelete,
            icon: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )),
        GestureDetector(
          onTap: toggleRightRecoding,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: rightColor ?? const Color(0XFFEAEAEA),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  spreadRadius: -1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: const [
                CustomText(
                  'Record',
                  weight: FontWeight.w600,
                ),
                SizedBox(width: 6),
                Iconify(Ic.baseline_keyboard_voice)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
