import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

void commonPrint(Object data) {
  if (kDebugMode) {
    print("Common Print : ${data.toString()}");
  }
}

class AppFunctions {
  String customFormatNumber(String input) {
    try {
      // Format integer and decimal parts separately
      final List<String> parts = input.split(".");
      final String integerPart = NumberFormat("#,##,###").format(int.parse(parts[0]));

      if (parts.length > 1) {
        return "$integerPart.${parts[1]}"; // Keep decimal part as is
      }

      return integerPart;
    } catch (e) {
      return input; // Return original input if parsing fails
    }
  }

  String formatNumber({required String input, required bool isTheResultField}) {
    if (input.isEmpty) return "";

    if (input.endsWith(".")) return input;

    if (isTheResultField &&
        RegExp(r'^\d+\.\d*0+$').hasMatch(input) &&
        double.tryParse(input) != null &&
        double.parse(input).toString().endsWith('.0')) {
      final number = double.parse(input).toInt();
      return NumberFormat("##,##,###.#########").format(number);
    }

    if (RegExp(r'^\d+\.\d*0+$').hasMatch(input)) return input;

    try {
      if (isTheResultField) {
        final number = double.parse(input);
        return NumberFormat("##,##,###.##").format(number);
      }
      return customFormatNumber(input);
    } catch (e) {
      return input; // Keep user input if parsing fails
    }
  }
}
