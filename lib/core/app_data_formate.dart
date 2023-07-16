import 'package:intl/intl.dart';

class AppDateFormat {
  static String toDate(DateTime time) {
    return DateFormat.yMd().format(time);
  }

  static String formatExpirationDate(DateTime time) {
    return DateFormat('MM/yy').format(time);
  }
}
