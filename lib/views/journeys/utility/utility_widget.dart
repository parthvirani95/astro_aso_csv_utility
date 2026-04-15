import 'package:astro_aso_csv_utility/shared/di/get_it.dart';
import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/extention/theme_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/views/cubits/utility/utility_cubit.dart';
import 'package:astro_aso_csv_utility/views/journeys/utility/app_list_view.dart';
import 'package:astro_aso_csv_utility/views/journeys/utility/countries_view.dart';
import 'package:astro_aso_csv_utility/views/journeys/utility/keyword_view.dart';
import 'package:astro_aso_csv_utility/views/journeys/utility/platforms_view.dart';
import 'package:astro_aso_csv_utility/views/journeys/utility/utility_view.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UtilityWidget extends State<UtilityView> {
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

  Widget buildBody({required BuildContext context, required UtilityLoadedState state}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Column(
        children: [
          CommonWidget().sizesBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: AppColor.greyColor.withOpacityNew(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
            child: Row(
              children: [
                headingLabel(),
                CommonWidget().sizesBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      Spacer(),
                      CommonWidget().containerField(
                        context: context,
                        title: "Apps",
                        onTap: () async => await bottomSheet(
                          context: context,
                          child: AppListView(utilityCubit: utilityCubit, state: state),
                        ),
                      ),
                      CommonWidget().sizesBox(width: 12),
                      CommonWidget().containerField(
                        context: context,
                        title: "Platforms",
                        onTap: () async => await bottomSheet(
                          context: context,
                          child: PlatformsView(utilityCubit: utilityCubit, state: state),
                        ),
                      ),
                      CommonWidget().sizesBox(width: 12),
                      CommonWidget().containerField(
                        context: context,
                        title: "Keywords",
                        onTap: () async => await bottomSheet(
                          context: context,
                          child: KeywordsView(utilityCubit: utilityCubit, state: state),
                        ),
                      ),
                      CommonWidget().sizesBox(width: 12),
                      CommonWidget().containerField(
                        context: context,
                        title: "Countries",
                        onTap: () async => await bottomSheet(
                          context: context,
                          child: CountriesView(utilityCubit: utilityCubit, state: state),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CommonWidget().sizesBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  selectedAppsView(context: context, state: state),
                  CommonWidget().sizesBox(height: 12),
                  selectedPlatformsView(context: context, state: state),
                  CommonWidget().sizesBox(height: 12),
                  selectedKeywordsView(context: context, state: state),
                  CommonWidget().sizesBox(height: 12),
                  selectedCountriesView(context: context, state: state),
                  CommonWidget().sizesBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: CommonWidget().containerField(
                            context: context, title: "Total CSV Rows : ", width: ScreenUtil().screenWidth),
                      ),
                      CommonWidget().sizesBox(width: 12),
                      Expanded(
                        child: CommonWidget().containerField(
                          context: context,
                          title: "Split CSV (Max Rows per CSV) : ",
                          width: ScreenUtil().screenWidth,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          CommonWidget().sizesBox(height: 16),
          exportButton(state: state),
          CommonWidget().sizesBox(height: 16),
        ],
      ),
    );
  }

  Widget selectedAppsView({required BuildContext context, required UtilityLoadedState state}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greyColor.withOpacityNew(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.greyColor.withOpacityNew(0.1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
      child: Row(
        children: [
          CommonWidget().sizesBox(width: 8),
          optionHeading(context: context, label: "Apps"),
          CommonWidget().sizesBox(width: 8),
          Expanded(
            child: state.selectedApps.isEmpty
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CommonWidget().containerField(
                      context: context,
                      title: "Select Apps",
                      onTap: () async => await bottomSheet(
                        context: context,
                        child: AppListView(utilityCubit: utilityCubit, state: state),
                      ),
                    ),
                  )
                : Wrap(
                    spacing: 12.r,
                    runSpacing: 12.r,
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.end,
                    children: state.selectedApps
                        .map(
                          (app) => CommonWidget().containerField(
                            context: context,
                            title: app.name,
                            onTap: () async => await bottomSheet(
                              context: context,
                              child: AppListView(utilityCubit: utilityCubit, state: state),
                            ),
                          ),
                        )
                        .toList(),
                  ),
          )
        ],
      ),
    );
  }

  Widget optionHeading({required BuildContext context, required String label}) {
    return Text(
      "$label : ",
      style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
            color: AppColor.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget selectedPlatformsView({required BuildContext context, required UtilityLoadedState state}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greyColor.withOpacityNew(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.greyColor.withOpacityNew(0.1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
      child: Row(
        children: [
          CommonWidget().sizesBox(width: 8),
          optionHeading(context: context, label: "Platforms"),
          CommonWidget().sizesBox(width: 8),
          Expanded(
            child: state.selectedPlatforms.isEmpty
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CommonWidget().containerField(
                      context: context,
                      title: "Select Platforms",
                      onTap: () async => await bottomSheet(
                        context: context,
                        child: PlatformsView(utilityCubit: utilityCubit, state: state),
                      ),
                    ))
                : Wrap(
                    spacing: 12.r,
                    runSpacing: 12.r,
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.end,
                    children: state.selectedPlatforms.map(
                      (platform) {
                        return CommonWidget().containerField(
                          context: context,
                          title: platformMap[platform] ?? '',
                          onTap: () async => await bottomSheet(
                            context: context,
                            child: PlatformsView(utilityCubit: utilityCubit, state: state),
                          ),
                        );
                      },
                    ).toList(),
                  ),
          )
        ],
      ),
    );
  }

  Widget selectedKeywordsView({required BuildContext context, required UtilityLoadedState state}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greyColor.withOpacityNew(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.greyColor.withOpacityNew(0.1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
      child: Row(
        children: [
          CommonWidget().sizesBox(width: 8),
          optionHeading(context: context, label: "Keywords"),
          CommonWidget().sizesBox(width: 8),
          Expanded(
            child: state.selectedKeywords.isEmpty
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CommonWidget().containerField(
                      context: context,
                      title: "Enter Keywords",
                      onTap: () async => await bottomSheet(
                        context: context,
                        child: KeywordsView(utilityCubit: utilityCubit, state: state),
                      ),
                    ))
                : Wrap(
                    spacing: 12.r,
                    runSpacing: 12.r,
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.end,
                    children: state.selectedKeywords.map(
                      (keyword) {
                        return CommonWidget().containerField(
                          context: context,
                          title: keyword,
                          onTap: () async => await bottomSheet(
                            context: context,
                            child: KeywordsView(utilityCubit: utilityCubit, state: state),
                          ),
                        );
                      },
                    ).toList(),
                  ),
          )
        ],
      ),
    );
  }

  Widget selectedCountriesView({required BuildContext context, required UtilityLoadedState state}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greyColor.withOpacityNew(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.greyColor.withOpacityNew(0.1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
      child: Row(
        children: [
          CommonWidget().sizesBox(width: 8),
          optionHeading(context: context, label: "Countries"),
          CommonWidget().sizesBox(width: 8),
          Expanded(
            child: state.selectedCountries.isEmpty
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CommonWidget().containerField(
                      context: context,
                      title: "Select Countries",
                      onTap: () async => await bottomSheet(
                        context: context,
                        child: CountriesView(utilityCubit: utilityCubit, state: state),
                      ),
                    ))
                : Wrap(
                    spacing: 12.r,
                    runSpacing: 12.r,
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.end,
                    children: state.selectedCountries.map(
                      (country) {
                        return CommonWidget().containerField(
                          context: context,
                          title: country,
                          onTap: () async => await bottomSheet(
                            context: context,
                            child: CountriesView(utilityCubit: utilityCubit, state: state),
                          ),
                        );
                      },
                    ).toList(),
                  ),
          )
        ],
      ),
    );
  }

  Future<void> bottomSheet({required BuildContext context, required Widget child}) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      useRootNavigator: false,
      elevation: 8.r,
      constraints: BoxConstraints(maxHeight: ScreenUtil().screenHeight * 0.95),
      backgroundColor: AppColor.blackBackgroundColor,
      barrierColor: AppColor.blackColor.withOpacityNew(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r), topRight: Radius.circular(26.r)),
      ),
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r), topRight: Radius.circular(26.r)),
        child: child,
      ),
    );
  }

  Widget headingLabel() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
      child: Text(
        "Astro ASO CSV Utility Tool",
        style: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
              color: AppColor.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget exportButton({required UtilityLoadedState state}) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 150.r,
        height: 50.r,
        child: CommonWidget().commonButton(
          context: context,
          buttonLabel: "Export CSV",
          showPrimaryBg: true,
          textStyle: Theme.of(context).textTheme.primarySmallBoldHeading.copyWith(
                color: AppColor.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
          borderRadius: 12.r,
          onTap: () async => await utilityCubit.exportCSV(state: state),
        ),
      ),
    );
  }
}
