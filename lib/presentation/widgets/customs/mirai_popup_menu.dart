// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

import '../../../core/utils/constant/language.dart';
import '../../../data/models/language.dart';

class CustomPopUpMenu extends StatelessWidget {
  final String text;
  final Function(LanguageModel)? onChanged;
  final double? size;
  final Color? color;
  final Color? textColor;
  const CustomPopUpMenu({
    Key? key,
    required this.text,
    this.onChanged,
    this.size,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MiraiPopupMenu<LanguageModel>(
      key: UniqueKey(),
      enable: true,
      children: langList.map((e) {
        return e;
      }).toList(),
      itemWidgetBuilder: (index, item) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(item.country),
      ),
      onChanged: onChanged,
      child: SizedBox(
        key: GlobalKey(),
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textColor ?? Colors.white,
                    fontSize: size ?? 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: textColor ?? Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
