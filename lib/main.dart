import 'dart:async';
import 'dart:io';

import 'package:astro_aso_csv_utility/globals.dart';
import 'package:astro_aso_csv_utility/shared/constants/hive_constants.dart';
import 'package:astro_aso_csv_utility/shared/di/get_it.dart' as get_it;
import 'package:astro_aso_csv_utility/views/appverse_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:catcher_2/catcher_2.dart';

Future<void> main() async {
  await mainFunction();
}

Future<void> mainFunction() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  } else {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  csvKitDocumentPath =
      '${(await path_provider.getApplicationDocumentsDirectory()).absolute.path}${Platform.pathSeparator}CSVKit';

  Hive.init('$csvKitDocumentPath${Platform.pathSeparator}localDb');

  locaKitBox = await Hive.openBox(HiveBoxConstants.LOCAKIT_AI_BOX);
  appLanguageBox = await Hive.openBox(HiveBoxConstants.APP_LANGUAGE_BOX);

  isFirst = await locaKitBox.get(HiveConstants.IS_FIRST_LOAD, defaultValue: true);
  launchNo = await locaKitBox.get(HiveConstants.LAUNCH_NUMBER, defaultValue: 0);
  currentLangCode = await appLanguageBox.get(HiveConstants.PREFERRED_LANGUAGE, defaultValue: 'en');

  unawaited(get_it.init());

  final Catcher2Options debugOptions = Catcher2Options(SilentReportMode(), [ConsoleHandler()]);

  /// Release configuration. Same as above, but once user accepts dialog, user will be prompted to send email with crash to support.
  final Catcher2Options releaseOptions = Catcher2Options(SilentReportMode(), [ConsoleHandler()]);

  Catcher2(
    rootWidget: const AppVerseApp(),
    ensureInitialized: true,
    enableLogger: true,
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}
