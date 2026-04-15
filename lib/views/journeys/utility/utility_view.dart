import 'package:astro_aso_csv_utility/shared/di/get_it.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/shared/utils/app_error.dart';
import 'package:astro_aso_csv_utility/views/cubits/utility/utility_cubit.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UtilityView extends StatefulWidget {
  const UtilityView({super.key});

  @override
  State<UtilityView> createState() => _UtilityViewState();
}

class _UtilityViewState extends State<UtilityView> with SingleTickerProviderStateMixin {
  BuildContext? buildContext;
  late final UtlityCubit utilityCubit;

  @override
  void initState() {
    super.initState();
    utilityCubit = getItInstance<UtlityCubit>();
    utilityCubit.loadData();
  }

  @override
  void dispose() {
    utilityCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<UtlityCubit, UtilityState>(
        bloc: utilityCubit,
        builder: (_, state) {
          if (state is UtilityLoadingState) {
            return CommonWidget().loadingIos(context: context);
          } else if (state is UtilityErrorState) {
            return dashboardErrorView(context: context, state: state);
          } else if (state is UtilityLoadedState) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget dashboardErrorView({required BuildContext context, required UtilityErrorState state}) {
    return Center(
      child: CommonWidget().dataNotFound(
        context: context,
        onTap: () async => await utilityCubit.loadData(isRetry: true),
        buttonLabel: state.appError.errorType == AppErrorType.database ? "Grant Access" : "Try Again",
        heading:
            state.appError.errorType == AppErrorType.database ? "Database Access Required" : "Something went wrong",
        subHeading: state.appError.errorMessage,
        buttonColor: const Color(0xFF8AFF00),
        fontColor: AppColor.whiteColor,
        buttonFontColor: AppColor.blackColor,
        textAlign: state.appError.errorType == AppErrorType.database ? TextAlign.left : TextAlign.center,
      ),
    );
  }
}
