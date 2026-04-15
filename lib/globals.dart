// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

late Box csvKitBox;

DeviceType? deviceType;

String csvKitDocumentPath = '';
String lastImagePickerDirectoryPath = "";
String lastCSVDirectoryPath = "";
String lastCSVExportPath = "";

bool databaseAccessGranted = false;
