import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/translator/from_value/from_value_cubit.dart';
import '../../../../bloc/translator/to_value/to_value_cubit.dart';
import '../../../customs/mirai_popup_menu.dart';

class CustomLangPopUp extends StatelessWidget {
  final String? langText;
  final bool isTrue;
  const CustomLangPopUp({
    super.key,
    required this.langText,
    required this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: CustomPopUpMenu(
        text: langText ?? 'English',
        onChanged: (value) {
          isTrue
              ? context.read<FromValueCubit>().changeFromValue(
                    fromLangText: value.country,
                    fromValue: value.language,
                  )
              : context.read<ToValueCubit>().changeToValue(
                    toLangText: value.country,
                    toValue: value.language,
                  );
        },
      ),
    );
  }
}
