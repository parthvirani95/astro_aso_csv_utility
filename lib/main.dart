import 'dart:async';
import 'dart:io';

import 'package:astro_aso_csv_utility/globals.dart';
import 'package:astro_aso_csv_utility/shared/constants/hive_constants.dart';
import 'package:astro_aso_csv_utility/shared/di/get_it.dart' as get_it;
import 'package:astro_aso_csv_utility/views/securelab_app.dart';
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
  csvKitBox = await Hive.openBox(HiveBoxConstants.CSVKIT_BOX);
  unawaited(get_it.init());
  databaseAccessGranted = csvKitBox.get(HiveConstants.DATABASE_ACCESS_GRANTED, defaultValue: false);

  final Catcher2Options debugOptions = Catcher2Options(SilentReportMode(), [ConsoleHandler()]);
  final Catcher2Options releaseOptions = Catcher2Options(SilentReportMode(), [ConsoleHandler()]);

  Catcher2(
    rootWidget: const SecureLabApp(),
    ensureInitialized: true,
    enableLogger: true,
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}
