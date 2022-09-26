import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = _theme();

ThemeData _theme() {
  final base = ThemeData.light();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
        background: Colors.white,
        onBackground: Colors.white,
      ),
      textTheme: _textTheme(base.textTheme),
      // textButtonTheme: 
      );
}


TextTheme _textTheme(TextTheme base) => base.copyWith(
      // displaySmall: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // displayMedium: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // displayLarge: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // headlineSmall: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // headlineMedium: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // headlineLarge: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // bodySmall: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // bodyMedium: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // bodyLarge: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // labelSmall: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // labelMedium: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // labelLarge: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // titleSmall: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // titleMedium: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
      // titleLarge: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 18,
      //   color: AppColor.blackColor,
      // ),
    
      headline1: GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColor.blackColor,
      ),
      headline2: GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColor.blackColor,
      ),
      headline3: GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Colors.black,
      ),
      headline4: GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColor.blackColor,
      ),
      headline5: GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        fontSize: 27,
        color: AppColor.blackColor,
      ),
      headline6: GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColor.darkGreyColor,
      ),
      // titleSmall: GoogleFonts.mulish(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 12,
      //   color: AppColor.blackColor,
      // ),
      bodyText1: GoogleFonts.mulish(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColor.greyColor,
      ),
      bodyText2: GoogleFonts.mulish(
        fontWeight: FontWeight.normal,
        fontSize: 10,
        color: Colors.black,
      ),
      caption: GoogleFonts.mulish(
        fontWeight: FontWeight.bold,
        fontSize: 8,
        color: Colors.white,
      ),
    );

class AppColor {
  static const blackColor = Color(0xFF0F1828);
  static const greyColor = Color(0xFFADB5BD);
  static const darkGreyColor = Color(0xFFA4A4A4);
  static const blueColor = Color(0xFF002DE3);
}
