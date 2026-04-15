import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/extention/theme_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/views/cubits/utility/utility_cubit.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlatformsView extends StatefulWidget {
  final UtlityCubit utilityCubit;
  final UtilityLoadedState state;
  const PlatformsView({super.key, required this.utilityCubit, required this.state});

  @override
  State<PlatformsView> createState() => _PlatformsViewState();
}

class _PlatformsViewState extends State<PlatformsView> {
  late final UtlityCubit utilityCubit;
  late final UtilityLoadedState state;

  List<String> selectedPlatform = [];
  Map<String, String> allPlatform = {};

  @override
  void initState() {
    state = widget.state;
    allPlatform.addAll(platformMap);
    selectedPlatform.addAll(state.selectedPlatforms);
    utilityCubit = widget.utilityCubit;
    super.initState();
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
              CommonWidget().containerField(context: context, title: "Select Platforms"),
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
                  selectedPlatform.clear();
                  setState(() {});
                },
              ),
              CommonWidget().sizesBox(width: 12),
              CommonWidget().containerField(
                context: context,
                title: "Apply",
                onTap: () async {
                  Navigator.pop(context);
                  utilityCubit.updateSelectedPlatforms(platforms: selectedPlatform, state: state);
                },
              ),
            ],
          ),
        ),
        CommonWidget().sizesBox(height: 16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: SizedBox(
              width: ScreenUtil().screenWidth,
              child: Wrap(
                spacing: 12.r,
                runSpacing: 12.r,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                children: allPlatform.entries.map((entry) {
                  return FilterChip(
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
                      child: Text(
                        entry.value,
                        style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                              color: AppColor.whiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    selected: selectedPlatform.contains(entry.key),
                    backgroundColor: Colors.green[900]?.withOpacityNew(0.01),
                    selectedColor: Colors.green[900],
                    labelStyle: TextStyle(color: Colors.white),
                    showCheckmark: false,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        selectedPlatform.add(entry.key);
                      } else {
                        selectedPlatform.remove(entry.key);
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
}
