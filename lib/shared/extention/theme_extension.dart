import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ThemeTextExtentions on TextTheme {
  TextStyle get bottomBarTextStyle => bodyMedium!.copyWith(
        color: Colors.white,
      );

  TextStyle get primaryBigBoldHeading => headlineLarge!.copyWith(
        color: AppColor.blackBackgroundColor,
        fontSize: 26.sp,
        fontWeight: FontWeight.w600,
      );

  TextStyle get primaryBigLightHeading => headlineMedium!.copyWith(
        color: AppColor.blackBackgroundColor,
        fontSize: 26.sp,
        fontWeight: FontWeight.w600,
      );

  TextStyle get primaryMediumBoldHeading => titleMedium!.copyWith(
        color: AppColor.blackBackgroundColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      );

  TextStyle get primaryMediumLightHeading => titleMedium!.copyWith(
        color: AppColor.blackBackgroundColor,
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
      );

  TextStyle get primarySmallBoldHeading => labelLarge!.copyWith(
        color: AppColor.blackBackgroundColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      );

  TextStyle get primarySmallMediumHeading => labelMedium!.copyWith(
        color: AppColor.blackBackgroundColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      );

  TextStyle get primarySmallLightHeading => labelMedium!.copyWith(
        color: AppColor.blackBackgroundColor,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      );
}
