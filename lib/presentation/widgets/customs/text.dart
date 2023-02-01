import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  const CustomText(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.quicksand(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}
