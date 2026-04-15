import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtension on num {
  String convertToPercentageString() {
    return '${((this) * 10).toStringAsFixed(0)} %';
  }

  double toDp() {
    final double width = ScreenUtil().screenWidth;
    // double height = ScreenUtil().screenHeight;
    // print((width * this) / 1080);
    return ((width * this) / 1080);

    // if (kDebugMode) {
    //     print(this.toString() + ":" + (this / 3).toString());
    // }
    // // // print(ScreenUtil().screenWidth);
    // return (this / 3);
  }

  double toWidthDp() {
    final double width = ScreenUtil().screenWidth;
    // double height = ScreenUtil().screenHeight;

    return ((width * this) / 1080);

    // return (this / 3);
  }

  double toHeightDp() {
    // double width = ScreenUtil().screenWidth;
    final double height = ScreenUtil().screenHeight;

    return ((height * this) / 1920).toDouble();
    // return ((1080 * this) / height) / 2;

    // return (this / 3);
  }

  double toImageHeightDp({double? newHeight}) {
    // double width = ScreenUtil().screenWidth;

    return (((newHeight ?? 1385.2) * this) / 1920).toDouble();
    // return ((1080 * this) / height) / 2;

    // return (this / 3);
  }

  double toSreenDp() {
    // double width = ScreenUtil().screenWidth;
    // double height = ScreenUtil().screenHeight;
    final double pixelRatio = ScreenUtil().pixelRatio?.toDouble() ?? 3;

    return (this / pixelRatio);

    // return (this / 3);
  }

  double toStoryHeightDp() {
    final double height = ScreenUtil().scaleHeight;
    // double height = ScreenUtil().screenHeight;

    return ((height * this) / 1920);

    // return (this / 3);
  }

  double toOrigional() {
    // print(this.toString() + ":" + (this / 3).toString());
    // // print(ScreenUtil().screenWidth);
    return (this).toDouble();
  }

  double toScaledFont() {
    // print(this.toString() + ":" + (this / 3).toString());
    // // print(ScreenUtil().screenWidth);
    return (this * 3).toDouble();
  }

  double opacityInScale() {
    return (this / 100) > 1 ? 1 : (this / 100);
  }
}
