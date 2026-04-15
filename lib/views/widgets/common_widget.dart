// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, empty_catches, depend_on_referenced_packages

import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/extention/theme_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CommonWidget {
  Widget containerField({required BuildContext context, required String title, double? width, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: AppColor.greyColor.withOpacityNew(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.greyColor.withOpacityNew(0.2)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
        child: Text(
          title,
          style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                color: AppColor.whiteColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }

  Widget loadingIos({required BuildContext context, String? message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(color: Colors.white, radius: 12.r),
          CommonWidget().sizesBox(height: 22),
          Text(
            message ?? 'Please wait...',
            style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }

  Widget dataNotFound({
    required BuildContext context,
    String? imagePath,
    String? heading,
    String? subHeading,
    VoidCallback? onTap,
    String? buttonLabel,
    Color? buttonColor,
    EdgeInsetsGeometry? padding,
    Widget? actionButton,
    bool removeImage = false,
    Color? fontColor,
    Color? buttonFontColor,
    TextAlign? textAlign,
  }) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r), topRight: Radius.circular(26.r)),
        ),
        // height: ScreenUtil().screenHeight,
        padding: padding ?? EdgeInsets.only(bottom: 80.h),
        width: ScreenUtil().screenWidth,
        child: Padding(
          padding: EdgeInsets.only(bottom: 0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              removeImage
                  ? const SizedBox.shrink()
                  : Lottie.asset("assets/animation/data_not_found.json", width: 160.r, height: 160.r),
              CommonWidget().sizesBox(height: 24),
              Text(
                heading ?? '',
                style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                      fontSize: 22.sp,
                      color: fontColor ?? AppColor.appTextColor,
                    ),
              ),
              CommonWidget().sizesBox(height: 16),
              Text(
                subHeading?.replaceAll("==", "\n") ?? '',
                style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                      color: fontColor?.withOpacityNew(0.8) ?? AppColor.appTextColor.multiplyOpacityNew(0.9),
                      height: 1.6,
                    ),
                textAlign: textAlign ?? TextAlign.center,
              ),
              CommonWidget().sizesBox(height: 42),
              actionButton ??
                  SizedBox(
                    height: 50.h,
                    width: 300.w,
                    child: CommonWidget().commonButton(
                      context: context,
                      buttonLabel: buttonLabel ?? '',
                      textStyle: Theme.of(context).textTheme.primaryBigBoldHeading.copyWith(
                            color: buttonFontColor ?? Colors.white,
                            fontSize: 18.sp,
                          ),
                      borderRadius: 26.r,
                      buttonBgColor: buttonColor ?? const Color(0xFFDA1921),
                      onTap: onTap ?? () {},
                      showGradient: buttonColor != null ? false : true,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sizesBox({double? height, double? width, Widget? child}) {
    return SizedBox(height: height?.h, width: width?.w, child: child);
  }

  Widget commonButton({
    required BuildContext context,
    required String buttonLabel,
    required VoidCallback onTap,
    bool showPrimaryBg = false,
    TextStyle? textStyle,
    Widget? customWidget,
    double? borderRadius,
    bool showMargin = true,
    Color? buttonBgColor,
    Color? borderColor,
    bool showGradient = false,
    bool showBorder = false,
    LinearGradient? gradient,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: showMargin ? null : EdgeInsets.only(top: 14.h, bottom: 14.h, right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: buttonBgColor ?? (showPrimaryBg ? AppColor.primaryColor : Colors.white),
          borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
          border: showBorder ? Border.all(color: borderColor ?? Colors.transparent, width: 2) : null,
          gradient: gradient,
        ),
        child: customWidget ??
            Text(
              buttonLabel,
              style: textStyle ??
                  Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                        color: showPrimaryBg ? Colors.white : AppColor.primaryColor,
                      ),
            ),
      ),
    );
  }

  Widget commnBackgroundGradient({required double width, required double height, required Widget child}) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, -0.04),
          end: Alignment(-1, 0.04),
          colors: [Color(0xFFFFB368), Color(0xFFFF4D73), Color(0xFFBC3FF6)],
        ),
      ),
      child: child,
    );
  }

  Widget commonPadding({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: child,
    );
  }
}
