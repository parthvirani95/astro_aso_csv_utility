import 'package:astro_aso_csv_utility/shared/constants/snackbar_type.dart';
import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/extention/theme_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/shared/utils/custom_snackbar.dart';
import 'package:astro_aso_csv_utility/views/cubits/utility/utility_cubit.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CountriesView extends StatefulWidget {
  final UtlityCubit utilityCubit;
  final UtilityLoadedState state;
  const CountriesView({super.key, required this.utilityCubit, required this.state});

  @override
  State<CountriesView> createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  late final UtlityCubit utilityCubit;
  late final UtilityLoadedState state;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController languageSearchController = TextEditingController();

  bool showLoader = true;

  List<String> selectedList = [];
  List<String> allCountriesList = [];
  List<String> filteredCountriesList = [];

  List<String> selectedLanguageList = [];

  @override
  void initState() {
    state = widget.state;

    allCountriesList.addAll(countryCodeMap.keys.toList());
    filteredCountriesList.addAll(countryCodeMap.keys.toList());
    selectedList.addAll(widget.state.selectedCountries);

    if (selectedList.isNotEmpty) {
      for (var country in selectedList) {
        selectedLanguageList.addAll(countryBasedLocaleMap[country]?["primary"] ?? []);
        selectedLanguageList.addAll(countryBasedLocaleMap[country]?["secondary"] ?? []);
        selectedLanguageList = selectedLanguageList.toSet().toList();
      }
    }

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
    languageSearchController.dispose();
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
              CommonWidget().containerField(context: context, title: "Select Countries"),
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
                  selectedLanguageList.clear();
                  selectedList.clear();
                  setState(() {});
                },
              ),
              CommonWidget().sizesBox(width: 12),
              CommonWidget().containerField(
                context: context,
                title: "Select All",
                onTap: () async {
                  selectedList.addAll(allCountriesList);
                  setState(() {});
                },
              ),
              CommonWidget().sizesBox(width: 12),
              CommonWidget().containerField(
                context: context,
                title: "Apply",
                onTap: () async {
                  Navigator.pop(context);
                  utilityCubit.updateSelectedCountries(countries: selectedList, state: state);
                },
              ),
            ],
          ),
        ),
        CommonWidget().sizesBox(height: 12),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Row(
              children: [
                Expanded(child: countriesList()),
                CommonWidget().sizesBox(width: 12),
                Container(width: 1.r, color: AppColor.greyColor.withOpacityNew(0.2), height: ScreenUtil().screenHeight),
                CommonWidget().sizesBox(width: 12),
                Expanded(child: languageList()),
              ],
            ),
          ),
        ),
        CommonWidget().sizesBox(height: 12),
      ],
    );
  }

  void processFilter() {
    String value = searchController.text.trim();

    filteredCountriesList.clear();

    if (value.trim().isEmpty) {
      filteredCountriesList.addAll(allCountriesList);
    } else {
      filteredCountriesList.addAll(
        allCountriesList.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList(),
      );
    }
    setState(() {});
  }

  Widget countriesList() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.greyColor.withOpacityNew(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.greyColor.withOpacityNew(0.2)),
          ),
          child: TextField(
            controller: searchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Search country name",
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
        CommonWidget().sizesBox(height: 12),
        Expanded(
          child: showLoader
              ? CommonWidget().loadingIos(context: context)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8.r,
                        runSpacing: 8.r,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runAlignment: WrapAlignment.start,
                        children: filteredCountriesList.map((option) {
                          return FilterChip(
                            label: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 6.r),
                              child: Text(
                                option,
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
                              List<String> primaryLang = countryBasedLocaleMap[option]?["primary"] ?? [];
                              List<String> secondaryLang = countryBasedLocaleMap[option]?["secondary"] ?? [];

                              if (isSelected) {
                                selectedList.add(option);
                                selectedLanguageList.addAll(primaryLang.toSet().toList());
                                selectedLanguageList.addAll(secondaryLang.toSet().toList());
                              } else {
                                selectedList.remove(option);
                                selectedLanguageList.removeWhere((element) => primaryLang.contains(element));
                                selectedLanguageList.removeWhere((element) => secondaryLang.contains(element));
                              }
                              setState(() {});
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget languageList() {
    List<String> data = [];
    String searchValue = languageSearchController.text.trim();
    if (searchValue.trim().isNotEmpty) {
      data.addAll(localeLanguageMap.values.where((e) => e.toLowerCase().contains(searchValue.toLowerCase())).toList());
    } else {
      data.addAll(localeLanguageMap.values.toList());
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.greyColor.withOpacityNew(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.greyColor.withOpacityNew(0.2)),
          ),
          child: TextField(
            controller: languageSearchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Search language name",
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
            onChanged: (_) => setState(() {}),
            onTapOutside: (_) => setState(() {}),
            onEditingComplete: () => setState(() {}),
          ),
        ),
        CommonWidget().sizesBox(height: 12),
        Expanded(
          child: showLoader
              ? CommonWidget().loadingIos(context: context)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8.r,
                        runSpacing: 8.r,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runAlignment: WrapAlignment.start,
                        children: data.map((option) {
                          String languageCode = localeLanguageMap.entries.firstWhere((e) => e.value == option).key;

                          return FilterChip(
                            label: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 6.r),
                              child: Text(
                                option,
                                style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                                      color: AppColor.whiteColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                            selected: selectedLanguageList.contains(languageCode),
                            backgroundColor: Colors.green[900]?.withOpacityNew(0.01),
                            selectedColor: Colors.green[900],
                            labelStyle: TextStyle(color: Colors.white),
                            showCheckmark: false,
                            onSelected: (isSelected) {
                              List<String> country = countryBasedLocaleMap.entries
                                  .where((e) => e.value["primary"]?.contains(languageCode) ?? false)
                                  .map((e) => e.key)
                                  .toList();
                              List<String> secondaryCountry = countryBasedLocaleMap.entries
                                  .where((e) => e.value["secondary"]?.contains(languageCode) ?? false)
                                  .map((e) => e.key)
                                  .toList();

                              if (isSelected) {
                                selectedLanguageList.add(languageCode);
                                selectedList.addAll(country);
                                selectedList.addAll(secondaryCountry);
                              } else {
                                selectedLanguageList.remove(languageCode);

                                selectedList.removeWhere((element) => country.contains(element));
                                selectedList.removeWhere((element) => secondaryCountry.contains(element));
                              }
                              setState(() {});
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
        ),
        CommonWidget().sizesBox(height: 12),
        Text(
          "If you select language then it will select the countries that support that language\n(e.g. if you select English (U.S) then it will select all the countries that has primary or secondary language as English (U.S) )",
          style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                fontSize: 12.sp,
                color: AppColor.whiteColor,
                height: 1.5,
              ),
          textAlign: TextAlign.center,
        ),
        InkWell(
          onTap: () async {
            String url = "https://tryastro.app/tools/localizations/";
            bool canLaunch = await canLaunchUrl(Uri.parse(url));
            if (canLaunch) {
              await launchUrl(Uri.parse(url));
            } else {
              CustomSnackbar.show(snackbarType: SnackbarType.ERROR, message: "Could not launch the URL");
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
            child: Text(
              "Tap for more info : https://tryastro.app/tools/localizations/",
              style: Theme.of(context).textTheme.primarySmallLightHeading.copyWith(
                    fontSize: 12.sp,
                    color: AppColor.whiteColor,
                    height: 1.5,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
