import 'package:astro_aso_csv_utility/shared/di/get_it.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/views/cubits/dashboard/dashboard_cubit.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with SingleTickerProviderStateMixin {
  BuildContext? buildContext;
  late final DashboardCubit dashboardCubit;

  @override
  void initState() {
    super.initState();
    dashboardCubit = getItInstance<DashboardCubit>();
  }

  @override
  void dispose() {
    dashboardCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<DashboardCubit, DashboardState>(
        bloc: dashboardCubit,
        builder: (_, state) {
          if (state is DashboardLoadingState) {
            return CommonWidget().loadingIos(context: context);
          } else if (state is DashboardErrorState) {
            return dashboardErrorView(context: context, state: state);
          } else if (state is DashboardLoadedState) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget dashboardErrorView({required BuildContext context, required DashboardErrorState state}) {
    return Center(
      child: CommonWidget().dataNotFound(
        context: context,
        buttonLabel: "Try Again",
        heading: "Something went wrong",
        subHeading: state.errorMessage,
        buttonColor: const Color(0xFF8AFF00),
        fontColor: AppColor.whiteColor,
        buttonFontColor: AppColor.blackColor,
        padding: EdgeInsets.only(bottom: 30.h),
      ),
    );
  }
}
