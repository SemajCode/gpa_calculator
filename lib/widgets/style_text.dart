import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText extends StatelessWidget {
  const StyleText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    super.key,
  });

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        color: const Color.fromARGB(242, 255, 255, 255),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
