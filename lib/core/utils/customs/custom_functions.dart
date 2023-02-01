import 'package:flutter/material.dart';

import '../../../presentation/widgets/customs/text.dart';

class CustomFunctions {
  static void showCustomSnackBar({
    required BuildContext context,
    required String content,
    Color? color,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: CustomText(
            content,
            color: textColor ?? Colors.white,
            size: 14,
            weight: FontWeight.w400,
          ),
        ),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? Theme.of(context).colorScheme.onError,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
