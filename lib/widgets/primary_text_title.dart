import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTextTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLine;
  PrimaryTextTitle(
      {super.key,
      required this.text,
      required this.fontSize,
      this.textColor = Colors.white,
      this.textAlign = TextAlign.center,
      required this.fontWeight,
      this.maxLine});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLine,
        style: GoogleFonts.ibmPlexSansHebrew(
            textStyle: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: 0,
        )));
  }
}
