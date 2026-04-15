import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

extension StringExtension on String {
  String intelliTrim({int maxLength = 15}) {
    return length > maxLength ? '${substring(0, maxLength)}...' : this;
  }

  String capitalize() {
    return length > 2 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : this;
  }

  String fixEncoding() {
    return utf8.decode(latin1.encode(this), allowMalformed: true);
  }

  String countryTrim() {
    return length > 20 ? '${substring(0, 20)}...' : this;
  }

  String toCamelcase() {
    return toLowerCase().replaceAllMapped(RegExp(r'\b\w'), (match) => match.group(0)!.toUpperCase());
    // return length > 1 ? substring(0, 1).toUpperCase() + substring(1, length) : this;
  }

  Color toColor() {
    try {
      var hexColor = replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      if (hexColor.length == 8) {
        return Color(int.parse("0x$hexColor"));
      }
      return const Color(0xFFFFFFFF);
    } on Exception {
      return const Color(0xFFFFFFFF);
    }
  }

  String removeHTMLTag() {
    if (Platform.isAndroid) {
      return toString();
    }
    return toString()
        .replaceAll("<p>", "")
        .replaceAll("</p>", "")
        .replaceAll("<br />", "")
        .replaceAll("&nbsp;", " ")
        .replaceAll("&amp;", "&")
        .replaceAll("</p>", "")
        .replaceAll(".", "");
  }

  String boldTag() {
    return "<b>${toString()}</b>".replaceAll(".", "");
  }

  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidWebsite() {
    return RegExp(r"^((https?|ftp|smtp):\/\/)?(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$").hasMatch(this);
  }

  bool isValidTwitter() {
    return RegExp(r"http(?:s)?:\/\/(?:www\.)?twitter\.com\/([a-zA-Z0-9_]+)").hasMatch(this);
  }

  bool isValidFacebook() {
    return RegExp(
            r"(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?")
        .hasMatch(this);
  }

  bool isValidYouTubeUrl() {
    return RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$',
      caseSensitive: false,
    ).hasMatch(this);
  }

  bool isValidLinkedin() {
    return RegExp(r"((https?:\/\/)?((www|\w\w)\.)?linkedin\.com\/)((([\w]{2,3})?)|([^\/]+\/(([\w|\d-&#?=])+\/?){1,}))$")
        .hasMatch(this);
  }

  bool isPhoneSticker() {
    const pattern = r'\b\d{3}[-.]?\d{3}[-.]?\d{4}\b';
    final regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  bool isEmailSticker() {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  bool isWebsiteSticker() {
    const pattern = r"(http(s)?:\/\/)?([A-Za-z0-9\-]+\.){1,2}[A-Za-z]{2,}(\/\S*)?";
    final regex = RegExp(pattern);
    return regex.hasMatch(this) && !contains('@');
  }

  bool isAddressSticker() {
    const pattern = r'.*[-, ]\d{6}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(this);
  }
}
