import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  double fontSize;
  String titleText;
  TextWidget( this.fontSize, this.titleText);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: fontSize,
        letterSpacing: 2,
        fontWeight : FontWeight.bold,
      ),
    );
  }
}