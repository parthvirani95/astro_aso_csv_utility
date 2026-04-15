// ignore_for_file: library_private_types_in_public_api, empty_catches, unused_local_variable, unused_element, deprecated_member_use

import 'dart:async';

import 'package:astro_aso_csv_utility/globals.dart';
import 'package:astro_aso_csv_utility/views/cubits/loading/loading_cubit.dart';
import 'package:astro_aso_csv_utility/views/journeys/utility/utility_view.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Future<bool> onWillPop({required BuildContext context}) async {
    BlocProvider.of<LoadingCubit>(context).hide();
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CommonWidget().showOptionDialog(
        context: context,
        heading: "Exit app",
        subHeading: "Are you sure want to exists?",
        nagativeHeading: "No",
        positiveHeading: "Yes",
        nagativeCallback: () => Navigator.pop(context, false),
        positiveCallback: () => Navigator.pop(context, true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    rootContext = context;
    return WillPopScope(
      onWillPop: () async {
        final result = await onWillPop(context: context);
        return result;
      },
      child: Scaffold(key: scaffoldKey, resizeToAvoidBottomInset: false, body: const UtilityView()),
    );
  }
}
