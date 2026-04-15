import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/extention/theme_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/shared/utils/animated_indicator.dart';
import 'package:astro_aso_csv_utility/views/cubits/loading/loading_cubit.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(child: screen),
        BlocBuilder<LoadingCubit, double>(
          builder: (context, shouldShow) {
            if (shouldShow > 0) {
              return Container(
                color: Colors.black.multiplyOpacityNew(0.6),
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: BlocProvider.of<LoadingCubit>(context).loadingMessage.trim().isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedIndicator(isFetching: true, size: 28.r),
                          CommonWidget().sizesBox(height: 32),
                          Text(
                            BlocProvider.of<LoadingCubit>(context).loadingMessage,
                            style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                                  color: Colors.white,
                                  height: 1.8,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          if (BlocProvider.of<LoadingCubit>(context).showCancelButton)
                            CommonWidget().sizesBox(height: 32),
                          if (BlocProvider.of<LoadingCubit>(context).showCancelButton)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<LoadingCubit>(context).isProcessTerminated = true;
                                  BlocProvider.of<LoadingCubit>(context).hide();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.custom8),
                                    color: AppColor.custom1,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 32.w),
                                    child: Text(
                                      "Cancel",
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    : const SizedBox.shrink(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
