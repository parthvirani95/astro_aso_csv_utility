import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();
  // System Colors
  static const Color primary = Color(0xFFFFFFFF); // White
  static const Color secondary = Color(0xFFC9F31D); // Lime Green
  static const Color text = Color(0xA6FFFFFF); // White with opacity
  static const Color accent = Color(0x1AFFFFFF); // White with opacity

  // Custom Colors
  static const Color custom1 = Color(0xFF1F1F1F); // Dark Gray
  static const Color custom2 = Color(0xFF070707); // Almost Black
  static const Color custom3 = Color(0x59FFFFFF); // White with opacity
  static const Color custom4 = Color(0x73FFFFFF); // White with opacity
  static const Color custom5 = Color(0xFF131313); // Dark Gray
  static const Color custom6 = Color(0x33FFFFFF); // White with opacity
  static const Color custom7 = Color(0xFF9A9A9A); // Gray
  static const Color custom8 = Color(0x22FFFFFF); // Gray

  // Background Color
  static const Color background = Color(0xFF000000);

  // Heading Colors
  static const Color h1 = Color(0xFFFFFFFF);
  static const Color h2 = Color(0x59FFFFFF); // White with opacity
  static const Color h3 = Color(0xFFFFFFFF);
  static const Color h4 = Color(0xFFFFFFFF);
  static const Color h5 = Color(0xFFC9F31D);

  // Button Colors
  static const Color buttonBackground = Color(0xFFC9F31D);
  static const Color buttonText = Color(0xFF1F1F1F);
  static const Color buttonHoverBackground = Color(0xFFFFFFFF);
  static const Color buttonHoverText = Color(0xFF1F1F1F);
  static const Color transparent = Colors.transparent;

  // Old Colors
  // static const Color vulcan = Color(0xFFFAE3DD);

  static const Color primaryColor = Color(0xFFFA7235);
  static const Color darkPrimaryColor = Color(0xFF131313);

  static const Color secondaryColor = Color(0xFFFA7235);
  static const Color darkSecondaryColor = Color(0xFFF2F2F2);

  static const Color inactiveIconColor = Color(0xFFBCBECA);
  static const Color darkInactiveIconColor = Color(0xFFBCBECA);

  static const Color backgroundColor = Color(0xFFf3f4f6); //Color.fromARGB(255, 241, 237, 237);
  static const Color darkBackgroundColor = Color(0xFF353154);

  // static const Color vulcan = Color(0xFFFAE3DD);
  static const Color blackBackgroundColor = Color(0xFF141221);
  static const Color violet = Color(0xFFE0A584);

  static const Color bottomSheetActionBg = Color(0xFFF9F9F9);
  // static const Color shareIconColor = Color(0xFF353154);
  static const Color shareIconColor = Color(0xFFF3F3F3);

  static const Color appTextColor = Color(0xFF084277);
  static const Color appcolor = Color(0xFF084277);

  static const Color fillColor = Color(0xFFF3F8FF);
  static const Color blackColor = Color(0xFF000000);
  static const Color swapIconBgColor = Color(0xFF2C2C2E);
  static const Color textFiledBGColor = Color(0xFF1C1C1E);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color buttonBgColor = Color(0xFF8AFF00);

  static const Color greyColor = Color(0xFFC7C7C7);
  static Color materialGreyColor = Colors.grey.multiplyOpacityNew(0.8);
  static Color retingEmoji = Colors.yellow;
  static Color grey = const Color(0xFF757575);

  static Color settingMenuHeadingColor = const Color(0xFF8E8D91);
  // static const Color royalBlue = Color(0xFF604FEF);
  // static const Color violet = Color(0xFFA74DBC);

  static LinearGradient linearGradient = const LinearGradient(
    begin: Alignment(1.00, -0.04),
    end: Alignment(-1, 0.04),
    colors: [Color(0xFFA525B6), Color(0xFFE20090), Color(0xFFFF391F)],
  );
  static LinearGradient twoColorLinearGradient = const LinearGradient(
    begin: Alignment(1.00, -0.04),
    end: Alignment(-1, 0.04),
    colors: [Color(0xFFA525B6), Color(0xFFFF391F)],
  );
}
