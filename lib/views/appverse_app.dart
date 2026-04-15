// ignore_for_file: empty_catches, invalid_return_type_for_catch_error, prefer_const_constructors

import 'package:astro_aso_csv_utility/shared/constants/route_constants.dart';
import 'package:astro_aso_csv_utility/shared/di/get_it.dart';
import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/routes/routes.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/shared/themes/theme_text.dart';
import 'package:astro_aso_csv_utility/shared/utils/fade_page_route_builder.dart';
import 'package:astro_aso_csv_utility/views/cubits/loading/loading_cubit.dart';
import 'package:astro_aso_csv_utility/views/journeys/loading/loading_screen.dart';
import 'package:catcher_2/catcher_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astro_aso_csv_utility/globals.dart';

class AppVerseApp extends StatefulWidget {
  const AppVerseApp({super.key});

  @override
  State<AppVerseApp> createState() => _AppVerseAppState();
}

class _AppVerseAppState extends State<AppVerseApp> with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late LoadingCubit _loadingCubit;

  @override
  void initState() {
    super.initState();
    _loadingCubit = getItInstance<LoadingCubit>();
    WidgetsBinding.instance.addObserver(this);
    _initilize();
    isNewDownloadedPost = true;
  }

  BuildContext? rootContext;
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _loadingCubit.close();
    super.dispose();
  }

  void _initilize() {}

  @override
  Widget build(BuildContext context) {
    rootContext = context;

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
      ],
      child: Material(
        child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: ScreenUtil().deviceType(context) == DeviceType.mac
              ? Size(1728, 1117)
              : ScreenUtil().deviceType(context) == DeviceType.tablet
                  ? Size(
                      MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first).size.width - 300,
                      MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first).size.height - 300,
                    )
                  : const Size(414, 896),
          // ScreenUtil().screenWidth > 600 ? const Size(834, 1194) :
          rebuildFactor: (old, data) => RebuildFactors.change(old, data),
          minTextAdapt: true,
          splitScreenMode: true,
          fontSizeResolver: (fontSize, instance) => FontSizeResolvers.height(fontSize, instance),
          // designSize: const Size(414, 896),
          // logicalWidth > 600 ? const Size(834, 1194) : const Size(414, 896),
          builder: (BuildContext context, Widget? widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
                boldText: false,
              ),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "LocaKit",
                scaffoldMessengerKey: snackbarKey,
                navigatorKey: Catcher2.navigatorKey,
                theme: ThemeData(
                  useMaterial3: false,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  primaryColor: AppColor.primary, // Primary
                  secondaryHeaderColor: AppColor.secondary, // Secondary
                  scaffoldBackgroundColor: AppColor.background, // Background
                  buttonTheme: ButtonThemeData(
                    buttonColor: AppColor.buttonBgColor, // Button background
                    textTheme: ButtonTextTheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    thumbVisibility: WidgetStateProperty.all(false),
                    crossAxisMargin: -16.w,
                  ),
                  appBarTheme: const AppBarTheme(
                    elevation: 8,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: AppColor.primaryColor,
                      statusBarIconBrightness: Brightness.dark,
                      statusBarBrightness: Brightness.dark,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColor.primaryColor),
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: TextStyle(color: Colors.grey.multiplyOpacityNew(0.6), fontSize: 20.sp),
                  ),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    secondary: AppColor.blackBackgroundColor,
                    brightness: Brightness.dark,
                  ),
                ),
                themeMode: ThemeMode.dark,
                builder: (context, child) {
                  return LoadingScreen(screen: child!);
                },
                initialRoute: RouteList.initial,
                onGenerateRoute: (RouteSettings settings) {
                  if (kDebugMode) {
                    print(settings.name);
                  }
                  routeArguments = settings.arguments;
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder? builder = routes[settings.name];
                  return SlidePageRouteBuilder(
                    builder: builder!,
                    settings: settings,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
