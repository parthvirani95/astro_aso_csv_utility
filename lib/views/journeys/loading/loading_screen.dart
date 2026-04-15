import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
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
    final loadingCubit = BlocProvider.of<LoadingCubit>(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(child: screen),
        BlocBuilder<LoadingCubit, double>(
          bloc: loadingCubit,
          builder: (context, shouldShow) {
            if (shouldShow > 0) {
              return Container(
                color: Colors.black.multiplyOpacityNew(0.6),
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: loadingCubit.loadingMessage.trim().isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonWidget().loadingIos(
                            context: context,
                            message: loadingCubit.loadingMessage,
                          ),
                          CommonWidget().sizesBox(height: 32),
                          if (loadingCubit.showCancelButton) CommonWidget().sizesBox(height: 32),
                          if (loadingCubit.showCancelButton)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: InkWell(
                                onTap: () {
                                  loadingCubit.isProcessTerminated = true;
                                  loadingCubit.hide();
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
