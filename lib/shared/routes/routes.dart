import 'package:astro_aso_csv_utility/shared/constants/route_constants.dart';
import 'package:astro_aso_csv_utility/views/journeys/app_home/app_home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => const AppVerseHome(),
      };
}
