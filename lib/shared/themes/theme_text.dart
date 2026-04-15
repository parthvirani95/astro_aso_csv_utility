import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _dmSansTextTheme => GoogleFonts.dmSansTextTheme();
  static TextTheme get _interTextTheme => GoogleFonts.interTextTheme();

  // Headline Styles
  static TextStyle get headline1 => _dmSansTextTheme.displayLarge!.copyWith(
        fontSize: 75.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.h1,
      );

  static TextStyle get headline2 => _interTextTheme.displayMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.h2,
      );

  static TextStyle get headline3 => _dmSansTextTheme.displaySmall!.copyWith(
        fontSize: 45.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.h3,
      );

  static TextStyle get headline4 => _dmSansTextTheme.headlineMedium!.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.h4,
      );

  static TextStyle get headline5 => _dmSansTextTheme.headlineSmall!.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.h5,
      );

  // Body Text Styles
  static TextStyle get bodyText1 => _interTextTheme.bodyLarge!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.text,
      );

  static TextStyle get bodyText2 => _interTextTheme.bodyMedium!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.text,
      );

  // Button Text
  static TextStyle get button => _interTextTheme.labelLarge!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.buttonText,
      );

  static TextTheme getTextTheme() => _dmSansTextTheme.copyWith(
        displayLarge: headline1,
        displayMedium: headline2,
        displaySmall: headline3,
        headlineMedium: headline4,
        headlineSmall: headline5,
        bodyLarge: bodyText1,
        bodyMedium: bodyText2,
        labelLarge: button,
      );
}
