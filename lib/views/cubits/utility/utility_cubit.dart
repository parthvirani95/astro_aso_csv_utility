import 'dart:io';

import 'package:astro_aso_csv_utility/globals.dart';
import 'package:astro_aso_csv_utility/models/app_list_model.dart';
import 'package:astro_aso_csv_utility/shared/constants/hive_constants.dart';
import 'package:astro_aso_csv_utility/shared/constants/snackbar_type.dart';
import 'package:astro_aso_csv_utility/shared/utils/app_error.dart';
import 'package:astro_aso_csv_utility/shared/utils/custom_snackbar.dart';
import 'package:astro_aso_csv_utility/shared/utils/database_helper.dart';
import 'package:astro_aso_csv_utility/views/cubits/loading/loading_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'utility_state.dart';

Map<String, String> localeLanguageMap = {
  "en-US": "English (U.S.)",
  "en-GB": "English (U.K.)",
  "en-CA": "English (Canada)",
  "en-AU": "English (Australia)",
  "fr-FR": "French",
  "fr-CA": "French (Canada)",
  "es-ES": "Spanish (Spain)",
  "es-MX": "Spanish (Mexico)",
  "de-DE": "German (Germany)",
  "zh-Hans": "Chinese (Simplified)",
  "zh-Hant": "Chinese (Traditional)",
  "pt-PT": "Portuguese (Portugal)",
  "pt-BR": "Portuguese (Brazil)",
  "ar-SA": "Arabic",
  "nl-NL": "Dutch",
  "ca": "Catalan",
  "hr": "Croatian",
  "ro": "Romanian",
  "sk": "Slovak",
  "uk": "Ukrainian",
  "no": "Norwegian",
  "ja": "Japanese",
  "ko": "Korean",
  "ru": "Russian",
  "it": "Italian",
  "sv": "Swedish",
  "da": "Danish",
  "fi": "Finnish",
  "pl": "Polish",
  "tr": "Turkish",
  "he": "Hebrew",
  "th": "Thai",
  "cs": "Czech",
  "el": "Greek",
  "hu": "Hungarian",
  "id": "Indonesian",
  "ms": "Malay",
  "vi": "Vietnamese",
  "hi": "Hindi",
};

Map<String, Map<String, List<String>>> countryBasedLocaleMap = {
  "Country Based Localization": {
    "primary": [],
    "secondary": [],
  },
  "Afghanistan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Albania": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Algeria": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA", "fr-FR"],
  },
  "Angola": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Anguilla": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Antigua and Barbuda": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Argentina": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Armenia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Australia": {
    "primary": ["en-AU"],
    "secondary": ["en-GB"],
  },
  "Austria": {
    "primary": ["de-DE"],
    "secondary": ["en-GB"],
  },
  "Azerbaijan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Bahamas": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Bahrain": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Bangladesh": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Barbados": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Belarus": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Belgium": {
    "primary": ["en-GB"],
    "secondary": ["nl-NL", "fr-FR"],
  },
  "Belize": {
    "primary": ["en-GB"],
    "secondary": ["es-MX"],
  },
  "Benin": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Bermuda": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Bhutan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Bolivia": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Bosnia and Herzegovina": {
    "primary": ["en-GB"],
    "secondary": ["hr"],
  },
  "Botswana": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Brazil": {
    "primary": ["pt-BR"],
    "secondary": ["en-GB"],
  },
  "British Virgin Islands": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Brunei": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Bulgaria": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Burkina Faso": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Cambodia": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Cameroon": {
    "primary": ["fr-FR"],
    "secondary": ["en-GB"],
  },
  "Canada": {
    "primary": ["en-CA"],
    "secondary": ["fr-CA"],
  },
  "Cape Verde": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Cayman Islands": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Chad": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Chile": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "China mainland": {
    "primary": ["zh-Hans"],
    "secondary": ["en-GB"],
  },
  "Colombia": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Congo, Democratic Republic of the": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Congo, Republic of the": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Costa Rica": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Cote d’Ivoire": {
    "primary": ["fr-FR"],
    "secondary": ["en-GB"],
  },
  "Croatia": {
    "primary": ["en-GB"],
    "secondary": ["hr"],
  },
  "Cyprus": {
    "primary": ["en-GB"],
    "secondary": ["el", "tr"],
  },
  "Czech Republic": {
    "primary": ["en-GB"],
    "secondary": ["cs"],
  },
  "Denmark": {
    "primary": ["en-GB"],
    "secondary": ["da"],
  },
  "Dominica": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Dominican Republic": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Ecuador": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Egypt": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA", "fr-FR"],
  },
  "El Salvador": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Estonia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Eswatini": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Fiji": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Finland": {
    "primary": ["en-GB"],
    "secondary": ["fi"],
  },
  "France": {
    "primary": ["fr-FR"],
    "secondary": ["en-GB"],
  },
  "Gabon": {
    "primary": ["fr-FR"],
    "secondary": ["en-GB"],
  },
  "Gambia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Georgia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Germany": {
    "primary": ["de-DE"],
    "secondary": ["en-GB"],
  },
  "Ghana": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Greece": {
    "primary": ["en-GB"],
    "secondary": ["el"],
  },
  "Grenada": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Guatemala": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Guinea-Bissau": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Guyana": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Honduras": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Hong Kong": {
    "primary": ["zh-Hant"],
    "secondary": ["en-GB"],
  },
  "Hungary": {
    "primary": ["en-GB"],
    "secondary": ["hu"],
  },
  "Iceland": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "India": {
    "primary": ["en-GB"],
    "secondary": ["hi"],
  },
  "Indonesia": {
    "primary": ["en-GB"],
    "secondary": ["id"],
  },
  "Iraq": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Ireland": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Israel": {
    "primary": ["en-GB"],
    "secondary": ["he"],
  },
  "Italy": {
    "primary": ["it"],
    "secondary": ["en-GB"],
  },
  "Jamaica": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Japan": {
    "primary": ["ja"],
    "secondary": ["en-US"],
  },
  "Jordan": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Kazakhstan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Kenya": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Kosovo": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Kuwait": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Kyrgyzstan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Laos": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Latvia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Lebanon": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA", "fr-FR"],
  },
  "Liberia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Libya": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Lithuania": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Luxembourg": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR", "de-DE"],
  },
  "Macau": {
    "primary": ["zh-Hant"],
    "secondary": ["en-GB"],
  },
  "Madagascar": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Malawi": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Malaysia": {
    "primary": ["en-GB"],
    "secondary": ["ms"],
  },
  "Maldives": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Mali": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Malta": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Mauritania": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA", "fr-FR"],
  },
  "Mauritius": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Mexico": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Micronesia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Moldova": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Mongolia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Montenegro": {
    "primary": ["en-GB"],
    "secondary": ["hr"],
  },
  "Montserrat": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Morocco": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA", "fr-FR"],
  },
  "Mozambique": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Myanmar": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Namibia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Nauru": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Nepal": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Netherlands": {
    "primary": ["nl-NL"],
    "secondary": ["en-GB"],
  },
  "New Zealand": {
    "primary": ["en-AU"],
    "secondary": ["en-GB"],
  },
  "Nicaragua": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Niger": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Nigeria": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "North Macedonia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Norway": {
    "primary": ["en-GB"],
    "secondary": ["no"],
  },
  "Oman": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Pakistan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Palau": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Panama": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Papua New Guinea": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Paraguay": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Peru": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Philippines": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Poland": {
    "primary": ["en-GB"],
    "secondary": ["pl"],
  },
  "Portugal": {
    "primary": ["pt-PT"],
    "secondary": ["en-GB"],
  },
  "Qatar": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Republic of Korea": {
    "primary": ["ko"],
    "secondary": ["en-GB"],
  },
  "Romania": {
    "primary": ["en-GB"],
    "secondary": ["ro"],
  },
  "Russia": {
    "primary": ["ru"],
    "secondary": ["en-GB", "uk"],
  },
  "Rwanda": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Sao Tome and Principe": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Saudi Arabia": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Senegal": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Serbia": {
    "primary": ["en-GB"],
    "secondary": ["hr"],
  },
  "Seychelles": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Sierra Leone": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Singapore": {
    "primary": ["en-GB"],
    "secondary": ["zh-Hans"],
  },
  "Slovakia": {
    "primary": ["en-GB"],
    "secondary": ["sk"],
  },
  "Slovenia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Solomon Islands": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "South Africa": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Spain": {
    "primary": ["es-ES"],
    "secondary": ["ca", "en-GB"],
  },
  "Sri Lanka": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "St. Kitts and Nevis": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "St. Lucia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "St. Vincent and the Grenadines": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Suriname": {
    "primary": ["en-GB"],
    "secondary": ["nl-NL"],
  },
  "Sweden": {
    "primary": ["sv"],
    "secondary": ["en-GB"],
  },
  "Switzerland": {
    "primary": ["de-DE"],
    "secondary": ["en-GB", "fr-FR", "it"],
  },
  "Taiwan": {
    "primary": ["zh-Hant"],
    "secondary": ["en-GB"],
  },
  "Tajikistan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Tanzania": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Thailand": {
    "primary": ["en-GB"],
    "secondary": ["th"],
  },
  "Tonga": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Trinidad and Tobago": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Tunisia": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA", "fr-FR"],
  },
  "Türkiye": {
    "primary": ["en-GB"],
    "secondary": ["tr"],
  },
  "Turkmenistan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Turks and Caicos Islands": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Uganda": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Ukraine": {
    "primary": ["en-GB"],
    "secondary": ["ru", "uk"],
  },
  "United Arab Emirates": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "United Kingdom": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "United States": {
    "primary": ["en-US"],
    "secondary": ["ar-SA", "zh-Hans", "zh-Hant", "fr-FR", "ko", "pt-BR", "ru", "es-MX", "vi"],
  },
  "Uruguay": {
    "primary": ["en-GB"],
    "secondary": ["es-MX"],
  },
  "Uzbekistan": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Vanuatu": {
    "primary": ["en-GB"],
    "secondary": ["fr-FR"],
  },
  "Venezuela": {
    "primary": ["es-MX"],
    "secondary": ["en-GB"],
  },
  "Vietnam": {
    "primary": ["en-GB"],
    "secondary": ["vi"],
  },
  "Yemen": {
    "primary": ["en-GB"],
    "secondary": ["ar-SA"],
  },
  "Zambia": {
    "primary": ["en-GB"],
    "secondary": [],
  },
  "Zimbabwe": {
    "primary": ["en-GB"],
    "secondary": [],
  },
};

Map<String, String> countryCodeMap = {
  "Afghanistan": "af",
  "Albania": "al",
  "Algeria": "dz",
  "Angola": "ao",
  "Anguilla": "ai",
  "Antigua and Barbuda": "ag",
  "Argentina": "ar",
  "Armenia": "am",
  "Australia": "au",
  "Austria": "at",
  "Azerbaijan": "az",
  "Bahamas": "bs",
  "Bahrain": "bh",
  "Bangladesh": "bd",
  "Barbados": "bb",
  "Belarus": "by",
  "Belgium": "be",
  "Belize": "bz",
  "Benin": "bj",
  "Bermuda": "bm",
  "Bhutan": "bt",
  "Bolivia": "bo",
  "Bosnia and Herzegovina": "ba",
  "Botswana": "bw",
  "Brazil": "br",
  "British Virgin Islands": "vg",
  "Brunei": "bn",
  "Bulgaria": "bg",
  "Burkina Faso": "bf",
  "Cambodia": "kh",
  "Cameroon": "cm",
  "Canada": "ca",
  "Cape Verde": "cv",
  "Cayman Islands": "ky",
  "Chad": "td",
  "Chile": "cl",
  "China mainland": "cn",
  "Colombia": "co",
  "Congo, Democratic Republic of the": "cd",
  "Congo, Republic of the": "cg",
  "Costa Rica": "cr",
  "Cote d’Ivoire": "ci",
  "Croatia": "hr",
  "Cyprus": "cy",
  "Czech Republic": "cz",
  "Denmark": "dk",
  "Dominica": "dm",
  "Dominican Republic": "do",
  "Ecuador": "ec",
  "Egypt": "eg",
  "El Salvador": "sv",
  "Estonia": "ee",
  "Eswatini": "sz",
  "Fiji": "fj",
  "Finland": "fi",
  "France": "fr",
  "Gabon": "ga",
  "Gambia": "gm",
  "Georgia": "ge",
  "Germany": "de",
  "Ghana": "gh",
  "Greece": "gr",
  "Grenada": "gd",
  "Guatemala": "gt",
  "Guinea-Bissau": "gw",
  "Guyana": "gy",
  "Honduras": "hn",
  "Hong Kong": "hk",
  "Hungary": "hu",
  "Iceland": "is",
  "India": "in",
  "Indonesia": "id",
  "Iraq": "iq",
  "Ireland": "ie",
  "Israel": "il",
  "Italy": "it",
  "Jamaica": "jm",
  "Japan": "jp",
  "Jordan": "jo",
  "Kazakhstan": "kz",
  "Kenya": "ke",
  "Kosovo": "xk",
  "Kuwait": "kw",
  "Kyrgyzstan": "kg",
  "Laos": "la",
  "Latvia": "lv",
  "Lebanon": "lb",
  "Liberia": "lr",
  "Libya": "ly",
  "Lithuania": "lt",
  "Luxembourg": "lu",
  "Macau": "mo",
  "Madagascar": "mg",
  "Malawi": "mw",
  "Malaysia": "my",
  "Maldives": "mv",
  "Mali": "ml",
  "Malta": "mt",
  "Mauritania": "mr",
  "Mauritius": "mu",
  "Mexico": "mx",
  "Micronesia": "fm",
  "Moldova": "md",
  "Mongolia": "mn",
  "Montenegro": "me",
  "Montserrat": "ms",
  "Morocco": "ma",
  "Mozambique": "mz",
  "Myanmar": "mm",
  "Namibia": "na",
  "Nauru": "nr",
  "Nepal": "np",
  "Netherlands": "nl",
  "New Zealand": "nz",
  "Nicaragua": "ni",
  "Niger": "ne",
  "Nigeria": "ng",
  "North Macedonia": "mk",
  "Norway": "no",
  "Oman": "om",
  "Pakistan": "pk",
  "Palau": "pw",
  "Panama": "pa",
  "Papua New Guinea": "pg",
  "Paraguay": "py",
  "Peru": "pe",
  "Philippines": "ph",
  "Poland": "pl",
  "Portugal": "pt",
  "Qatar": "qa",
  "Republic of Korea": "kr",
  "Romania": "ro",
  "Russia": "ru",
  "Rwanda": "rw",
  "Sao Tome and Principe": "st",
  "Saudi Arabia": "sa",
  "Senegal": "sn",
  "Serbia": "rs",
  "Seychelles": "sc",
  "Sierra Leone": "sl",
  "Singapore": "sg",
  "Slovakia": "sk",
  "Slovenia": "si",
  "Solomon Islands": "sb",
  "South Africa": "za",
  "Spain": "es",
  "Sri Lanka": "lk",
  "St. Kitts and Nevis": "kn",
  "St. Lucia": "lc",
  "St. Vincent and the Grenadines": "vc",
  "Suriname": "sr",
  "Sweden": "se",
  "Switzerland": "ch",
  "Taiwan": "tw",
  "Tajikistan": "tj",
  "Tanzania": "tz",
  "Thailand": "th",
  "Tonga": "to",
  "Trinidad and Tobago": "tt",
  "Tunisia": "tn",
  "Türkiye": "tr",
  "Turkmenistan": "tm",
  "Turks and Caicos Islands": "tc",
  "Uganda": "ug",
  "Ukraine": "ua",
  "United Arab Emirates": "ae",
  "United Kingdom": "gb",
  "United States": "us",
  "Uruguay": "uy",
  "Uzbekistan": "uz",
  "Vanuatu": "vu",
  "Venezuela": "ve",
  "Vietnam": "vn",
  "Yemen": "ye",
  "Zambia": "zm",
  "Zimbabwe": "zw",
};

String databaseAccessMsg = '''
  We need access to the Astro app database to list apps during CSV build.

  • Read-only access (no changes will be made)
  • The database will only be copied locally

  Steps to continue:
  1. Allow access when prompted, OR
  2. Go to System Settings → Privacy & Security → Full Disk Access
  3. Enable access for this app
  4. Restart the app

  You can also select the Astro folder manually if needed.
  ''';

class UtlityCubit extends Cubit<UtilityState> {
  final LoadingCubit loadingCubit;

  UtlityCubit({required this.loadingCubit})
      : super(
          databaseAccessGranted
              ? UtilityLoadingState()
              : UtilityDatabaseAccessState(databaseAccessMsg: databaseAccessMsg),
        );

  Future<void> loadData({bool isRetry = false}) async {
    emit(UtilityLoadingState());

    try {
      bool status = await copyAstroDatabaseFile(isRetry: isRetry);
      bool dbExists = await isAstroDatabaseExists();
      if (status && dbExists) {
        final appList = await DatabaseHelper.instance.getAppNameAndIds();
        emit(UtilityLoadedState(appList: appList));
      } else {
        emit(
          UtilityErrorState(
            appError: AppError(
              errorType: AppErrorType.database,
              errorMessage: 'Astro database file not found\n$databaseAccessMsg',
            ),
          ),
        );
      }
    } catch (e) {
      String errorMessage = '';
      bool dbExists = await isAstroDatabaseExists();
      if (dbExists && e.toString().contains("Operation not permitted")) {
        final appList = await DatabaseHelper.instance.getAppNameAndIds();
        CustomSnackbar.show(
          snackbarType: SnackbarType.ERROR,
          message: 'Using old database file due to lake of access to the new database file',
        );
        emit(UtilityLoadedState(appList: appList));
        return;
      } else if (e.toString().contains("Operation not permitted")) {
        errorMessage = databaseAccessMsg;
        openDiskAccess();
        emit(UtilityErrorState(appError: AppError(errorType: AppErrorType.data, errorMessage: errorMessage.trim())));
      } else {
        errorMessage = "Error: ${e.toString()}";
        emit(UtilityErrorState(appError: AppError(errorType: AppErrorType.data, errorMessage: errorMessage.trim())));
      }
    }
  }

  Future<bool> copyAstroDatabaseFile({bool isRetry = false}) async {
    final sourcePath = getAstroPath();
    final destinationPath = '$csvKitDocumentPath${Platform.pathSeparator}astro_backup';

    if (!await canAccess(sourcePath)) {
      String errorMessage = databaseAccessMsg;
      emit(UtilityErrorState(appError: AppError(errorType: AppErrorType.database, errorMessage: errorMessage)));

      if (isRetry) {
        await openDiskAccess();
      }
      return false;
    }

    final sourceDir = Directory(sourcePath);
    final destDir = Directory(destinationPath);

    if (!sourceDir.existsSync()) {
      emit(UtilityErrorState(appError: AppError(errorType: AppErrorType.database, errorMessage: databaseAccessMsg)));
      if (isRetry) {
        await openDiskAccess();
      }
      return false;
    }

    await copyDirectory(sourceDir, destDir);

    if (destDir.listSync(recursive: true).isEmpty) {
      return false;
    } else {
      csvKitBox.put(HiveConstants.DATABASE_ACCESS_GRANTED, true);
    }

    return true;
  }

  String getAstroPath() {
    final home = Platform.environment['HOME'];
    return '$home/Library/Containers/matteospada.it.ASO/Data/Library/Application Support/Astro';
  }

  Future<bool> isAstroDatabaseExists() async {
    final dbPath = '$csvKitDocumentPath${Platform.pathSeparator}astro_backup';
    return await Directory(dbPath).exists();
  }

  Future<bool> canAccess(String path) async {
    try {
      final dir = Directory(path);
      await dir.list().first;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> copyDirectory(Directory source, Directory destination) async {
    if (!destination.existsSync()) {
      destination.createSync(recursive: true);
    }

    await for (final entity in source.list(recursive: false)) {
      final newPath = '${destination.path}/${entity.uri.pathSegments.last}';

      if (entity is Directory) {
        await copyDirectory(entity, Directory(newPath));
      } else if (entity is File) {
        await entity.copy(newPath);
      }
    }
  }

  Future<dynamic> openDiskAccess() async {
    try {
      await openFullDiskAccessSettings();
    } catch (e) {
      emit(
        UtilityErrorState(
          appError: AppError(
            errorType: AppErrorType.database,
            errorMessage: 'Failed to open full disk access settings. Please do manually in settings.',
          ),
        ),
      );
    }
  }

  Future<void> openFullDiskAccessSettings() async {
    Process.run('open', ['x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles']);
  }
}
