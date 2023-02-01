import 'package:a_translator/presentation/widgets/customs/text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int length;
  final Widget button;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.length,
    this.onChanged,
    required this.button,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              spreadRadius: -1,
              blurRadius: 2,
            ),
          ]),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              maxLength: 2000,
              maxLines: 10,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: hint,
                counter: const CustomText(''),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                '$length/2000',
              ),
              button
            ],
          )
        ],
      ),
    );
  }
}
