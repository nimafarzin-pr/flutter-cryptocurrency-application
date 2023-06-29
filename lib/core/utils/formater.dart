import 'package:intl/intl.dart';

class Formatter {
  static String toPercent(num? value) {
    if (value == null) {
      return value.toString();
    }
    NumberFormat percentFormat =
        NumberFormat.decimalPatternDigits(decimalDigits: 2);
    String formattedValue = percentFormat.format(value);
    return formattedValue;
  }

  static String toCurrency(double? value) {
    final val = value ?? 0.0;
    NumberFormat percentFormat = NumberFormat.simpleCurrency();
    String formattedValue = percentFormat.format(val);
    return formattedValue;
  }
}
