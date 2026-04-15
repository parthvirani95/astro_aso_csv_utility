import 'package:astro_aso_csv_utility/globals.dart';
import 'package:astro_aso_csv_utility/shared/constants/snackbar_type.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackbar {
  static void show({
    required SnackbarType snackbarType,
    required String message,
    IconData? icon,
    Color? bgColor,
    Duration? duration,
    bool showCloseButton = false,
    ScaffoldMessengerState? messanger,
  }) {
    final snackBar = SnackBar(
      padding: EdgeInsets.all(12.w),
      elevation: 8,
      duration: duration ?? const Duration(seconds: 2),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SvgPicture.asset(
              snackbarType == SnackbarType.ERROR ? "assets/svgs/warning_icon.svg" : "assets/svgs/circle_check.svg",
              colorFilter:
                  ColorFilter.mode(snackbarType == SnackbarType.SUCCESS ? Colors.black : Colors.white, BlendMode.srcIn),
              height: 20.w,
              width: 20.w,
            ),
          ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: snackbarType == SnackbarType.SUCCESS ? Colors.black : Colors.white,
                fontSize: showCloseButton ? 16.sp : 14.sp,
                fontWeight: showCloseButton ? FontWeight.w500 : FontWeight.w700,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          if (showCloseButton)
            IconButton(
              splashRadius: 22.r,
              onPressed: () => snackbarKey.currentState?.hideCurrentSnackBar(),
              color: snackbarType == SnackbarType.SUCCESS ? AppColor.custom8 : AppColor.whiteColor,
              icon: Icon(
                CupertinoIcons.clear,
                color: snackbarType == SnackbarType.SUCCESS ? AppColor.blackBackgroundColor : AppColor.whiteColor,
              ),
            ),
        ],
      ),
      backgroundColor: bgColor ??
          (snackbarType == SnackbarType.ERROR
              ? Colors.red[900]
              : snackbarType == SnackbarType.PROCESSING
                  ? Colors.green[900]
                  : AppColor.secondary),
    );
    messanger != null ? messanger.hideCurrentSnackBar() : snackbarKey.currentState?.hideCurrentSnackBar();
    messanger != null ? messanger.clearSnackBars() : snackbarKey.currentState?.clearSnackBars();
    messanger != null ? messanger.showSnackBar(snackBar) : snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
