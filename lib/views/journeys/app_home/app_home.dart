// ignore_for_file: library_private_types_in_public_api, empty_catches, unused_local_variable, unused_element, deprecated_member_use

import 'package:astro_aso_csv_utility/globals.dart';
import 'package:astro_aso_csv_utility/views/journeys/utility/utility_view.dart';
import 'package:flutter/material.dart';

class AppVerseHome extends StatefulWidget {
  const AppVerseHome({super.key});

  @override
  _AppVerseHomeState createState() => _AppVerseHomeState();
}

class _AppVerseHomeState extends State<AppVerseHome> {
  late BuildContext? rootContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    rootContext = context;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: const UtilityView(),
    );
  }
}
