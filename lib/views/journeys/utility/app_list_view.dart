import 'package:astro_aso_csv_utility/models/app_list_model.dart';
import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/extention/theme_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/views/cubits/utility/utility_cubit.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppListView extends StatefulWidget {
  final UtlityCubit utilityCubit;
  final UtilityLoadedState state;
  const AppListView({super.key, required this.utilityCubit, required this.state});

  @override
  State<AppListView> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  late final UtlityCubit utilityCubit;
  late final UtilityLoadedState state;
  final TextEditingController searchController = TextEditingController();

  bool showLoader = true;

  List<AppListModel> selectedList = [];
  List<AppListModel> allAppList = [];
  List<AppListModel> filteredAppList = [];

  @override
  void initState() {
    state = widget.state;

    allAppList.addAll(widget.state.appList);
    filteredAppList.addAll(widget.state.appList);

    selectedList.addAll(state.selectedApps);

    super.initState();
    utilityCubit = widget.utilityCubit;
    Future.delayed(
      Duration(milliseconds: 400),
      () {
        if (mounted) {
          showLoader = false;
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonWidget().sizesBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: Row(
            children: [
              CommonWidget().containerField(context: context, title: "Select Apps"),
              Spacer(),
              CommonWidget().containerField(
                context: context,
                title: "Cancel",
                onTap: () async => Navigator.pop(context),
              ),
              CommonWidget().sizesBox(width: 12),
              CommonWidget().containerField(
                context: context,
                title: "Clear All",
                onTap: () async {
                  selectedList.clear();
                  setState(() {});
                },
              ),
              CommonWidget().sizesBox(width: 12),
              CommonWidget().containerField(
                context: context,
                title: "Apply",
                onTap: () async {
                  Navigator.pop(context);
                  utilityCubit.updateSelectedApps(apps: selectedList, state: state);
                },
              ),
            ],
          ),
        ),
        CommonWidget().sizesBox(height: 16),
        // Serach field
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.greyColor.withOpacityNew(0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.greyColor.withOpacityNew(0.2)),
            ),
            child: TextField(
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search app name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                labelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
                hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 15.sp,
                      color: AppColor.custom4,
                    ),
              ),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.whiteColor,
                  ),
              onChanged: (_) => processFilter(),
              onTapOutside: (_) => processFilter(),
              onEditingComplete: () => processFilter(),
            ),
          ),
        ),

        CommonWidget().sizesBox(height: 16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: showLoader
                ? CommonWidget().loadingIos(context: context)
                : SizedBox(
                    width: ScreenUtil().screenWidth,
                    child: Wrap(
                      spacing: 12.r,
                      runSpacing: 12.r,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: filteredAppList.map((option) {
                        return FilterChip(
                          label: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
                            child: Text(
                              option.name,
                              style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                                    color: AppColor.whiteColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          selected: selectedList.contains(option),
                          backgroundColor: Colors.green[900]?.withOpacityNew(0.01),
                          selectedColor: Colors.green[900],
                          labelStyle: TextStyle(color: Colors.white),
                          showCheckmark: false,
                          onSelected: (isSelected) {
                            if (isSelected) {
                              selectedList.add(option);
                            } else {
                              selectedList.remove(option);
                            }
                            setState(() {});
                          },
                        );
                      }).toList(),
                    ),
                  ),
          ),
        ),
        CommonWidget().sizesBox(height: 12),
      ],
    );
  }

  void processFilter() {
    String value = searchController.text.trim();

    filteredAppList.clear();

    if (value.trim().isEmpty) {
      filteredAppList.addAll(allAppList);
    } else {
      filteredAppList.addAll(
        allAppList.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList(),
      );
    }
    setState(() {});
  }
}
