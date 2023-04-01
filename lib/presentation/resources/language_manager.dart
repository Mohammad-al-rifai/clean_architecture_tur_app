enum LanguageType {
  kENGLISH,
  kARABIC,
}

const String kARABIC = "ar";
const String kENGLISH = "en";

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
