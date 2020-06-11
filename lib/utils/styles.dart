import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getNormalStyle({@required double fontSize, @required Color color}) =>
    GoogleFonts.nunito(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
