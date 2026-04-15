// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, empty_catches, depend_on_referenced_packages

import 'dart:async';

import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/extention/theme_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/shared/utils/animated_indicator.dart';
import 'package:catcher_2/catcher_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_tooltip/widget_tooltip.dart';

class CommonWidget {
  Widget backcirclearrow(BuildContext context, {VoidCallback? callback}) {
    return InkWell(
      onTap: callback ?? () => Catcher2.navigatorKey.currentState?.pop(),
      child: Container(
        height: 36.r,
        width: 36.r,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(
          Icons.keyboard_arrow_left_sharp,
          size: 24.r,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder commonBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.multiplyOpacityNew(0.2)),
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  Widget actionButton({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
    required Color backgroundColor,
    EdgeInsets? padding,
    TextStyle? style,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColor.custom4, width: 0.5),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text(
            label,
            style: style ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColor.whiteColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
          ),
        ),
      ),
    );
  }

  Widget homePageAppBar({required BuildContext context, required String label}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.all(6.r),
                  child: SvgPicture.asset(
                    "assets/pngs/images/logo_white_bg.png",
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 16.r,
                    height: 16.r,
                  ),
                ),
                sizesBox(width: 8.w),
                Text(
                  "SocialX Repost+",
                  style: Theme.of(context).textTheme.primaryBigBoldHeading.copyWith(
                        color: Colors.white,
                        fontSize: 22.sp,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget toolTipWidget(BuildContext context, {required String message, Widget? child}) {
    return WidgetTooltip(
      message: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.primary),
      ),
      messagePadding: EdgeInsets.all(12.r),
      triggerMode: WidgetTooltipTriggerMode.tap,
      direction: WidgetTooltipDirection.bottom,
      dismissMode: WidgetTooltipDismissMode.tapAnywhere,
      triangleColor: Colors.green[900]!,
      triangleSize: const Size(16, 16),
      messageDecoration: BoxDecoration(color: Colors.green[900], borderRadius: BorderRadius.circular(12.r)),
      padding: EdgeInsets.all(16.r),
      child: child ??
          Icon(
            CupertinoIcons.info_circle,
            color: AppColor.inactiveIconColor,
            size: 18.r,
          ),
    );
  }

  Widget commonAppBar({required BuildContext context, required String label, Widget? leftWidget}) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 36.h),
      child: 1 == 1
          ? CommonWidget().appBarView(
              context: context,
              leftWidget: CommonWidget().backButton(iconColor: Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 46.w, child: leftWidget),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.primaryBigBoldHeading.copyWith(
                          color: Colors.white,
                          fontSize: 16.sp,
                          letterSpacing: 1.3,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
    );
  }

  Widget appBarView({
    required BuildContext context,
    String? iconPath,
    Widget? leftWidget,
    Color? bgColors,
    String? label,
    Color? fontColor,
  }) {
    return Container(
      height: 55.h,
      color: bgColors ?? Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 4.w),
          if (leftWidget != null) leftWidget,
          Expanded(
            child: Text(
              label ?? "",
              style: Theme.of(context).textTheme.primaryBigBoldHeading.copyWith(
                    color: fontColor ?? Colors.black,
                    fontSize: 18.sp,
                  ),
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }

  Widget homeButton({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
    String? icon,
    Widget? iconWidget,
    required Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.white.multiplyOpacityNew(0.1), offset: Offset.zero, blurRadius: 3, spreadRadius: 0)
              ],
              color: Colors.white.multiplyOpacityNew(0.2),
              borderRadius: BorderRadius.circular(26.r),
            ),
            padding: EdgeInsets.all(8.r),
            child: iconWidget ??
                (icon == null
                    ? const SizedBox.shrink()
                    : SvgPicture.asset(
                        icon,
                        colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
                        width: 16.r,
                        height: 16.r,
                      )),
          ),
          CommonWidget().sizesBox(height: 4.h),
          Text(
            label,
            style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                  color: color ?? Colors.white,
                  fontSize: 10.sp,
                ),
          )
        ],
      ),
    );
  }

  Widget readOnlyLabel(BuildContext context, {String? label, double? fontSize}) {
    return Container(
      decoration: BoxDecoration(color: AppColor.custom8, borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Text(
        label ?? "Read Only",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColor.whiteColor, fontSize: fontSize),
      ),
    );
  }

  Widget searchDecoration({Widget? child}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 50.h,
        width: 270.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue[50],
        ),
        child: child,
      ),
    );
  }

  Widget backArrow(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back_ios, color: Colors.white),
    );
  }

  Widget title({required BuildContext context, required String title, Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          title,
          style: Theme.of(context).textTheme.primaryMediumBoldHeading.copyWith(color: color),
        ),
      ),
    );
  }

  Widget loadingIos({required BuildContext context}) {
    return AnimatedIndicator(isFetching: true, size: 36.r);
  }

  Widget commonErrorWidget({required BuildContext context, required double maxHeight}) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(
        minHeight: maxHeight,
        minWidth: ScreenUtil().screenWidth,
      ),
      child: Center(
        child: Text(
          "Something went wrong, try again!",
          style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                color: AppColor.appTextColor,
              ),
        ),
      ),
    );
  }

  Widget circularIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: AppColor.appTextColor,
        strokeWidth: 1,
      ),
    );
  }

  Widget containerBody({Widget? child}) {
    return Container(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: child,
    );
  }

  Widget iosStatusBar({
    required BuildContext context,
    String? iconPath,
    String? screenName,
    VoidCallback? onTap,
    bool centerTitle = false,
    Color bgColor = Colors.white,
    Color color = AppColor.primaryColor,
    Widget? rightWidget,
    bool hideBackButton = false,
  }) {
    return Container(
      height: 56.r,
      color: bgColor,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap ?? () => Navigator.of(context).pop(),
            borderRadius: BorderRadius.circular(32.r),
            radius: 32.r,
            child: Image.asset(
              iconPath ?? "assets/pngs/otp/arrow.png",
              width: 26.w,
              height: 26.h,
              color: color,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
            ),
          ),
          centerTitle ? const SizedBox.shrink() : SizedBox(width: 16.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Text(
                screenName ?? '',
                textAlign: centerTitle ? TextAlign.center : TextAlign.left,
                style: Theme.of(context).textTheme.primaryMediumBoldHeading.copyWith(color: color, fontSize: 20.sp),
              ),
            ),
          ),
          rightWidget != null ? Align(alignment: Alignment.centerRight, child: rightWidget) : const SizedBox.shrink(),
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
                  : Lottie.asset(
                      "assets/animation/data_not_found.json",
                      width: 160.r,
                      height: 160.r,
                    ),
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
                      color: fontColor ?? AppColor.appTextColor.multiplyOpacityNew(0.9),
                      height: 1.3,
                    ),
                textAlign: TextAlign.center,
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
    return SizedBox(
      height: height?.h,
      width: width?.w,
      child: child,
    );
  }

  Widget commingSoon({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r), topRight: Radius.circular(26.r)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Center(
        child: Image.asset(
          "assets/pngs/common/comming_soon.png",
          height: 150.h,
          width: 150.w,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ),
    );
  }

  static LinearGradient linearGradient = const LinearGradient(
    begin: Alignment(1.00, -0.04),
    end: Alignment(-1, 0.04),
    colors: [Color(0xFFA525B6), Color(0xFFE20090), Color(0xFFFF391F)],
  );

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
          gradient: gradient ?? (showGradient ? linearGradient : null),
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

  Widget showOptionDialog({
    required BuildContext context,
    required String heading,
    required String subHeading,
    required String nagativeHeading,
    required String positiveHeading,
    required VoidCallback nagativeCallback,
    required VoidCallback positiveCallback,
  }) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(16.r),
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading.isNotEmpty
                  ? Text(
                      heading,
                      style: Theme.of(context).textTheme.primaryMediumBoldHeading,
                    )
                  : const SizedBox.shrink(),
              heading.isNotEmpty ? CommonWidget().sizesBox(height: 12) : const SizedBox.shrink(),
              Text(
                subHeading,
                style: Theme.of(context).textTheme.primarySmallLightHeading,
              ),
              CommonWidget().sizesBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: nagativeCallback,
                      child: Container(
                        height: 40.h,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(26), color: AppColor.appTextColor),
                        alignment: Alignment.center,
                        child: Text(
                          nagativeHeading,
                          style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  CommonWidget().sizesBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: positiveCallback,
                      child: Container(
                        height: 40.h,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(26), color: AppColor.appTextColor),
                        alignment: Alignment.center,
                        child: Text(
                          positiveHeading,
                          style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget homeHint({required BuildContext context}) {
    return Container(
      color: Colors.transparent,
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              'tap_on_post',
              style: Theme.of(context)
                  .textTheme
                  .primarySmallBoldHeading
                  .copyWith(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 180.w, bottom: 60.h),
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset("assets/pngs/home/right_down_arrow.png", width: 100.r, height: 100.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget downloadPostHint({required BuildContext context}) {
    return Container(
      color: Colors.transparent,
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.only(top: 56.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: Text(
                'download_your_business_post',
                style: Theme.of(context)
                    .textTheme
                    .primarySmallBoldHeading
                    .copyWith(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Image.asset("assets/pngs/home/right_down_arrow.png", width: 50.r, height: 100.r),
          ),
        ],
      ),
    );
  }

  Widget dividerLine({double? height}) {
    return Divider(
      color: AppColor.greyColor.multiplyOpacityNew(0.1),
      thickness: 2,
      height: height ?? 46.h,
    );
  }

  Widget showLikeAnimation({required AnimationController animationController}) {
    return Lottie.asset(
      'assets/animation/like.json',
      width: 200.r,
      height: 200.r,
      fit: BoxFit.contain,
      repeat: false,
      controller: animationController,
    );
  }

  Widget statusBarBG() {
    return Container(
      height: ScreenUtil().statusBarHeight,
      // decoration: BoxDecoration(gradient: CommonWidget.linearGradient),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget backButton({VoidCallback? onTap, String? iconPath, Color? iconColor}) {
    return InkWell(
      onTap: onTap ?? () => Catcher2.navigatorKey.currentState?.pop(),
      child: RotatedBox(
        quarterTurns: iconPath == null ? 4 : 0,
        child: Image.asset(
          iconPath ?? "assets/pngs/arrow.png",
          width: 46.r,
          height: 32.r,
          color: iconColor ?? Colors.white,
        ),
      ),
    );
  }

  Widget downloadIcon({VoidCallback? onTap, String? iconPath}) {
    return InkWell(
      onTap: onTap ?? () => Catcher2.navigatorKey.currentState?.pop(),
      child: RotatedBox(
        quarterTurns: iconPath == null ? 3 : 0,
        child: CircleAvatar(
          radius: 16.r,
          backgroundColor: Colors.white,
          child: Center(
            child: Image.asset(
              iconPath ?? "assets/pngs/arrow.png",
              width: 18.r,
              height: 18.r,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> openBottomSheet({
    required BuildContext context,
    required Widget screen,
    double? maxHeight,
    Widget? prefix,
    String? labelConstants,
    Widget? suffix,
  }) async {
    final result = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r), topRight: Radius.circular(26.r)),
      ),
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight ?? 200.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    prefix ?? SizedBox(width: 32.r, height: 32.r),
                    Text(
                      labelConstants ?? "Repost",
                      style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    suffix ?? const SizedBox.shrink()
                  ],
                ),
              ),
              Expanded(child: screen),
            ],
          ),
        );
      },
    );

    return result;
  }

  Future<bool?> showAdsOrPremiumPopup({required BuildContext context}) async {
    final result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(12.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Catcher2.navigatorKey.currentState?.pop(),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.multiplyOpacityNew(0.1),
                              offset: Offset.zero,
                              blurRadius: 3,
                              spreadRadius: 0,
                            )
                          ],
                          color: AppColor.blackBackgroundColor,
                          borderRadius: BorderRadius.circular(26.r),
                        ),
                        padding: EdgeInsets.all(4.r),
                        child: Padding(
                          padding: EdgeInsets.all(2.r),
                          child: SvgPicture.asset(
                            "assets/svgs/close.svg",
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            width: 20.r,
                            height: 20.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async => Catcher2.navigatorKey.currentState?.pop(true),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
                    child: Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(1, 1),
                          end: Alignment(-0, 1),
                          colors: [Color(0xFF0575FC), Color(0xFF4D74FF), Color(0xFF9672FF)],
                        ),
                        borderRadius: BorderRadius.circular(26.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.multiplyOpacityNew(0.1),
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.r),
                            child: Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                              size: 36.r,
                            ),
                          ),
                          CommonWidget().sizesBox(width: 4.w),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Watch Ads & Continue",
                              style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          CommonWidget().sizesBox(width: 6.w),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColor.greyColor,
                        height: 26.h,
                        thickness: 2,
                        indent: 12.w,
                        endIndent: 16.w,
                      ),
                    ),
                    Text(
                      "OR",
                      style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColor.greyColor,
                        height: 26.h,
                        thickness: 2,
                        indent: 16.w,
                        endIndent: 12.w,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async => Catcher2.navigatorKey.currentState?.pop(false),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
                    child: Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                        // gradient: CommonWidget.linearGradient,
                        borderRadius: BorderRadius.circular(26.r),
                        color: const Color(0xFFFFB07D),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.multiplyOpacityNew(0.1),
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.multiplyOpacityNew(0.1),
                                  offset: Offset.zero,
                                  blurRadius: 3,
                                  spreadRadius: 0,
                                )
                              ],
                              color: Colors.white.multiplyOpacityNew(0.2),
                              borderRadius: BorderRadius.circular(26.r),
                            ),
                            padding: EdgeInsets.all(4.r),
                            child: Padding(
                              padding: EdgeInsets.all(2.r),
                              child: SvgPicture.asset(
                                "assets/svgs/premium.svg",
                                colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                                width: 18.r,
                                height: 18.r,
                              ),
                            ),
                          ),
                          CommonWidget().sizesBox(width: 8.w),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Go Premium (Pro Version)",
                              style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          CommonWidget().sizesBox(width: 6.w),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return bool.tryParse(result.toString());
  }
}
