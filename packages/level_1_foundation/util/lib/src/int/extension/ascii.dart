extension Ascii on int {
  bool get isLowerCase {
    return this >= 97 && this <= 122;
  }

  bool get isUpperCase {
    return this >= 65 && this <= 90;
  }
}