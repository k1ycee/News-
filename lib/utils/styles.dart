import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getNormalStyle({@required double fontSize, @required Color color}) =>
    GoogleFonts.nunito(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
        height: 1
      ),
    );

TextStyle getMediumStyle({@required double fontSize, @required Color color}) =>
    GoogleFonts.nunito(
      textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w700,
          height: 1.3
      ),
    );

TextStyle getBoldStyle({@required double fontSize, @required Color color}) =>
    GoogleFonts.nunito(
      textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w800,
          height: 1
      ),
    );
