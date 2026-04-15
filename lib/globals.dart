// ignore_for_file: unused_element

import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> templateScaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey buttonGlobalKey = GlobalKey();
final GlobalKey<NavigatorState> navigatorKeyNavState = GlobalKey<NavigatorState>();

late Box locaKitBox;
late bool? isFirst;
late int launchNo;
late bool? isDarkMode;
bool isNewDownloadedPost = false;
late Box appLanguageBox;

// App Temination State
bool isAppDispatched = false;

String globalDownloadLocation = '';
String globalDataLocation = '${Platform.pathSeparator}.data';

class Message {
  String message;
  SendPort sendPort;
  int oldDuration;

  Message({
    required this.message,
    required this.sendPort,
    required this.oldDuration,
  });
}

const int helloAlarmID = 7;

String? currentRouteName;
Object? routeArguments;

bool shouldShowBottomSheet = false;

String? intentData;
bool isInitiatedApp = false;

String currentCaption = '';
String currentUsername = '';

Map<dynamic, dynamic> installedApps = {};

bool isTablat = false;

String postId = '';

var methodChannel = const MethodChannel("com.dpitspace.locakit.ai");
bool shouldCopyCaption = false;
bool shouldAppWatermark = true;
bool isNativeAdAvailable = true;
bool shouldShowSuperwall = false;

bool showRewardIntAppOpen = false;

int tabIndex = 1;

bool isAppOpenAdsShowing = false;
bool isAppOpenAdsLoading = false;

final List<Route> routeStack = [];

DeviceType? deviceType;

String languageLocalPath = '';
late String currentLangCode;

String locaKitDocumentPath = '';
String p8KeyPath = '';
File? p8File;

String defaultModelKey = '';
List<String> googleGeminiApiKey = [];
List<String> deepSeekApiKey = [];
List<String> chatGptApiKey = [];
List<String> deeplApiKey = [];
List<String> claudeApiKey = [];
String appStoreIssuerId = '';
String appStoreKeyId = '';
String appStoreTeamKey = '';
String appStoreP8Content = '';

// App ID, Map of Field Name and Map of Locale and List of Disabled Auto Translate Locale
Map<String, Map<String, List<String>>> disabledAutoTranslateLocale = {};
// List<String> disabledAutoTranslateLocale = [];

String lastImagePickerDirectoryPath = "";
String lastCSVDirectoryPath = "";
String lastCSVExportPath = "";

String appFollowSuggestionCurl = "";
String appFollowAppDataCurl = "";
String appFollowKeywordsCurl = "";
String appFigureAppIdCurl = "";
String appFigureKeywordCurl = "";

bool isAppFiguresEnabled = false;
bool isFetchModeEnabled = false;
bool isAutoModeEnabled = false;
bool isBulkModeEnabled = false;
