import 'trim_number.dart';

extension FormattedCurrencyNumber on double {
  /// 통화에 사용되는 숫자 포맷
  /// 심볼은 적용되지 않고 숫자만 적용된다
  String toFormattedCurrencyNumber({
    int separateCount = 3, // 구분자를 몇 자리수마다 찍어줄지
    String separator = ',', // separateCount마다 찍히는 점
    String decimalSeparator = '.', // 정수와 소수점 아래 자리 구분자
    int? precision, // 소수점 몇째 자리까지 표시할지 여부
    bool isTrimFractionLastZero = false, // 소수점 아래에서 필요 없는 0을 지울지 말지 여부
  }) {
    final bool isNegativeNumber = this < 0;
    String numberString = trimNumber(precision: precision, isTrimFractionLastZero: isTrimFractionLastZero,);
    if (isNegativeNumber) {
      numberString = numberString.replaceAll('-', '');
    }
    List<String> dotSplitNumber = numberString.split('.');

    final List<String> numberList =
    dotSplitNumber.first.runes.map((e) => String.fromCharCode(e)).toList(growable: false);
    var result = '';
    var count = 0;

    // separator 찍어주는 부분
    for (var index = numberList.length - 1; index >= 0; index--) {
      result = numberList[index] + result;

      ++count;

      if (index == 0) {
        break;
      }

      if (count == separateCount && numberList.length > separateCount) {
        result = separator + result;
        count = 0;
      }
    }

    if (dotSplitNumber.length == 2) {
      result = result + decimalSeparator + dotSplitNumber.last;
    }

    if (isNegativeNumber) {
      return '-$result';
    }
    return result;
  }
}