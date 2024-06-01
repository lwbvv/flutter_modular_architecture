extension TrimNumber on double {
  /// [precision] null인 경우 들어오는 숫자를 그대로 표시
  /// null이 아닌 경우에는 표시된 만큼 소수점 아래자리 표시
  /// [isTrimFractionLastZero] true인 경우에 소수점 아래 필요없는 0자리를 제거한다
  /// ex) 10.001 == 10.001 / 10.00 == 10 / 10.100 == 10.1
  /// 해당 값은 fractionDigits보다 우선시 된다
  String trimNumber({
    int? precision, // 소수점 자리수
    bool isTrimFractionLastZero = false, // 소수점 아래에서 필요 없는 0을 지울지 말지 여부
  }) {
    final String numberString = precision == null
        ? toString()
        : toStringAsFixed(precision);


    if (isTrimFractionLastZero) {
      List<String> splitDecimal = numberString.split('.');

      if (splitDecimal.length == 1) {
        return splitDecimal.first;
      }

      final String fraction = splitDecimal.last;
      final List<String> fractionCharacters =
      fraction.runes.map((e) => String.fromCharCode(e)).toList(growable: false);
      final List<String> newFractionCharacters =
      List.from(fractionCharacters);

      for (int i = fractionCharacters.length - 1; i >= 0; --i) {
        if (fractionCharacters[i] != '0') {
          break;
        }
        newFractionCharacters.removeLast();
      }
      if (newFractionCharacters.isEmpty) {
        return splitDecimal.first;
      }
      return '${splitDecimal.first}.${newFractionCharacters.join('')}';
    }

    return numberString;
  }
}