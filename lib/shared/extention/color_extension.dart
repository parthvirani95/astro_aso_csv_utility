// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Color withOpacityNew(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  /// Returns current opacity value (0.0–1.0)
  /// Example: color.opacityValue -> 0.8
  double get opacityValue {
    return alpha / 255.0;
  }

  /// Multiplies the existing alpha by a given opacity factor.
  /// Similar to Flutter's built-in withOpacity(), but safer for custom logic.
  Color multiplyOpacityNew(double factor) {
    return withValues(alpha: (alpha * factor).clamp(0, 255));
  }
}
