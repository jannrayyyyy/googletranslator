import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/translator/from_value/from_value_cubit.dart';
import '../../../../bloc/translator/to_value/to_value_cubit.dart';
import '../../../customs/mirai_popup_menu.dart';

class ConversationHeader extends StatelessWidget {
  final String? fromLangtext;
  final String? fromValue;
  final String? toLangText;
  final String? toValue;
  const ConversationHeader({
    super.key,
    this.fromLangtext,
    this.fromValue,
    this.toLangText,
    this.toValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
            child: CustomPopUpMenu(
              text: fromLangtext ?? 'English',
              size: 11,
              onChanged: (value) {
                context.read<FromValueCubit>().changeFromValue(
                      fromLangText: value.country,
                      fromValue: value.language,
                    );
              },
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
                color: const Color(0XFFEAEAEA),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    spreadRadius: -1,
                    blurRadius: 2,
                  ),
                ]),
            child: CustomPopUpMenu(
              text: toLangText ?? 'English',
              textColor: Colors.black,
              size: 11,
              color: const Color(0XFFEAEAEA),
              onChanged: (value) {
                context.read<ToValueCubit>().changeToValue(
                      toLangText: value.country,
                      toValue: value.language,
                    );
              },
            ),
          ),
        ),
      ],
    );
  }
}
