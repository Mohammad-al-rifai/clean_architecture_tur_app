import 'package:flutter/material.dart';

enum LanguageType {
  kENGLISH,
  kARABIC,
}

const String kARABIC = "ar";
const String kENGLISH = "en";
const String ASSET_PATH_LOCALISATIONS = "assets/translations";

const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.kENGLISH:
        return kENGLISH;
      case LanguageType.kARABIC:
        return kARABIC;
    }
  }
}
