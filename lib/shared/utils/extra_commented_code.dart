          // Container(
          //   height: ScreenUtil().statusBarHeight + 60.h,
          //   decoration: BoxDecoration(gradient: CommonWidget.linearGradient),
          //   alignment: Alignment.bottomCenter,
          //   child: CommonWidget().commonAppBar(context: context, label: "History"),
          // ),




          // [
          //                   AccordionSection(
          //                     header: Row(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         AutoSizeText(
          //                           "App Info",
          //                           maxLines: 1,
          //                           maxFontSize: 15,
          //                           minFontSize: 8,
          //                           style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
          //                         ),
          //                         SizedBox(width: 6.w),
          //                         CommonWidget().toolTipWidget(
          //                           context,
          //                           message:
          //                               "Localizations fields: Name, Subtitle, Privacy Policy URL, Provicy Policy text(for tvOS apps)",
          //                         ),
          //                         const Spacer(),
          //                         refreshAppLists(state: state, dashboardCubit: dashboardCubit),
          //                       ],
          //                     ),
          //                     rightIcon: const Icon(CupertinoIcons.chevron_down, color: AppColor.inactiveIconColor),
          //                     isOpen: dashboardCubit.openSection == DashboardToggle.appInfo,
          //                     onOpenSection: () =>
          //                         dashboardCubit.updateOpenSection(sectionName: DashboardToggle.appInfo),
          //                     onCloseSection: () => dashboardCubit.updateOpenSection(sectionName: DashboardToggle.none),
          //                     content: myAppsListView(context: context, dashboardCubit: dashboardCubit, state: state),
          //                   ),
          //                   AccordionSection(
          //                     header: Row(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         Text(
          //                           "App Version Info",
          //                           style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
          //                         ),
          //                         SizedBox(width: 6.w),
          //                         CommonWidget().toolTipWidget(
          //                           context,
          //                           message:
          //                               "Localizations fields: Description, Keywords, Marketing URL, Promotional Text, Support URL, What's New Text.",
          //                         ),
          //                         const Spacer(),
          //                         refreshAppLists(state: state, dashboardCubit: dashboardCubit),
          //                       ],
          //                     ),
          //                     rightIcon: const Icon(CupertinoIcons.chevron_down, color: AppColor.inactiveIconColor),
          //                     isOpen: dashboardCubit.openSection == DashboardToggle.appVersion,
          //                     onOpenSection: () =>
          //                         dashboardCubit.updateOpenSection(sectionName: DashboardToggle.appVersion),
          //                     onCloseSection: () => dashboardCubit.updateOpenSection(sectionName: DashboardToggle.none),
          //                     content: myAppsListView(context: context, dashboardCubit: dashboardCubit, state: state),
          //                   )
          //                 ]'


              //   1 == 1?
              //      Accordion(
              //         headerBorderWidth: 1,
              //         maxOpenSections: 1,
              //         headerBackgroundColor: AppColor.custom1,
              //         paddingListTop: 0,
              //         paddingListHorizontal: 0,
              //         paddingListBottom: 0.h,
              //         flipRightIconIfOpen: true,
              //         headerBorderColor: AppColor.custom4,
              //         headerBackgroundColorOpened: AppColor.custom2,
              //         contentBackgroundColor: AppColor.custom2,
              //         headerBorderColorOpened: AppColor.custom7,
              //         contentBorderColor: AppColor.custom7,
              //         contentBorderWidth: 1,
              //         headerBorderRadius: 8.r,
              //         contentBorderRadius: 8.r,
              //         contentHorizontalPadding: 8.w,
              //         contentVerticalPadding: 8.h,
              //         scaleWhenAnimating: true,
              //         openAndCloseAnimation: true,
              //         headerPadding: EdgeInsets.symmetric(vertical: 8.h),
              //         paddingBetweenOpenSections: 0.h,
              //         paddingBetweenClosedSections: 0.h,
              //         sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              //         sectionClosingHapticFeedback: SectionHapticFeedback.light,
              //         children: [
              //           AccordionSection(
              //             header: Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Text(
              //                   "App Versions",
              //                   style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
              //                 ),
              //                 const Spacer(),
              //                 refreshAppVersion(
              //                   state: state,
              //                   dashboardCubit: dashboardCubit,
              //                   isFetching: false,
              //                   onTap: () async => await dashboardCubit.getAppList(state: state),
              //                 ),
              //               ],
              //             ),
              //             paddingBetweenOpenSections: 16.h,
              //             paddingBetweenClosedSections: 16.h,
              //             headerPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              //             content: myAppsListView(
              //               context: context,
              //               dashboardCubit: dashboardCubit,
              //               state: state,
              //             ),
              //           ),
              //           AccordionSection(
              //             header: AutoSizeText(
              //               "App Info",
              //               maxLines: 1,
              //               maxFontSize: 15,
              //               minFontSize: 8,
              //               style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16.sp),
              //             ),
              //             headerPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              //             content: appInfoListView(
              //               context: context,
              //               dashboardCubit: dashboardCubit,
              //               state: state,
              //             ),
              //           ),
              //         ],
              //       )
              // : Expanded(
              //     child: Accordion(
              //       headerBorderWidth: 1,
              //       maxOpenSections: 1,
              //       headerBackgroundColor: AppColor.custom1,
              //       paddingListTop: 0,
              //       paddingListHorizontal: 0,
              //       paddingListBottom: 8.h,
              //       flipRightIconIfOpen: true,
              //       headerBorderColorOpened: AppColor.text,
              //       contentBorderColor: AppColor.text,
              //       headerBorderColor: AppColor.custom4,
              //       headerBackgroundColorOpened: AppColor.custom2,
              //       contentBackgroundColor: AppColor.custom2,
              //       contentBorderWidth: 1,
              //       headerBorderRadius: 8.r,
              //       contentBorderRadius: 8.r,
              //       contentHorizontalPadding: 8.w,
              //       contentVerticalPadding: 12.h,
              //       scaleWhenAnimating: true,
              //       openAndCloseAnimation: true,
              //       headerPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              //       paddingBetweenOpenSections: 16.h,
              //       paddingBetweenClosedSections: 16.h,
              //       sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              //       sectionClosingHapticFeedback: SectionHapticFeedback.light,
              //       children: List.generate(
              //         state.appDataList.length,
              //         (index) {
              //           final appItem = state.appDataList[index];
              //           return AccordionSection(
              //             header: AutoSizeText(
              //               appItem.attributes.name ?? '',
              //               maxLines: 1,
              //               maxFontSize: 15,
              //               minFontSize: 8,
              //               style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
              //             ),
              //             rightIcon: const SizedBox.shrink(),
              //             isOpen: index == state.appIdIndex,
              //             onOpenSection: () => dashboardCubit.updateAppSelection(index: index, state: state),
              //             onCloseSection: () => dashboardCubit.updateAppSelection(index: index, state: state),
              //             content: Container(),
              //           );
              //         },
              //       ),
              //     ),
              //   ),
      

      // avState.iosAppDataList.isNotEmpty
      //           ? ListView.builder(
      //               itemCount: avState.iosAppDataList.length,
      //               shrinkWrap: true,
      //               padding: EdgeInsets.zero,
      //               itemBuilder: (_, index) {
      //                 final appItem = avState.iosAppDataList[index];
      //                 return appVersionInfoItem(context: context, item: appItem);
      //               },
      //             )
      //           :