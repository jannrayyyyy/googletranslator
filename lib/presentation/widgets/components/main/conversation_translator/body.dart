import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/customs/custom_functions.dart';
import '../../../customs/text.dart';

class ConversationBody extends StatelessWidget {
  final bool isSender;
  final String? rawText;
  final String? translatedText;
  const ConversationBody({
    super.key,
    required this.isSender,
    this.rawText,
    this.translatedText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        if (rawText!.isEmpty) {
        } else {
          Clipboard.setData(
            ClipboardData(
              text: translatedText,
            ),
          ).then((value) {
            CustomFunctions.showCustomSnackBar(
              context: context,
              color: Colors.black,
              content: 'Copied to clipboard',
            );
          });
        }
      },
      child: Align(
        alignment: isSender ? Alignment.bottomRight : Alignment.centerLeft,
        child: Container(
          margin: isSender
              ? EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 3.75,
                  4,
                  0,
                  4,
                )
              : EdgeInsets.fromLTRB(
                  0,
                  4,
                  MediaQuery.of(context).size.width / 3.75,
                  4,
                ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSender ? Colors.white : const Color(0XFFEAEAEA),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                spreadRadius: -1,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment:
                isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              CustomText(
                rawText ?? 'empty',
                size: 12,
              ),
              CustomText(
                translatedText ?? 'empty',
                size: 14,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
