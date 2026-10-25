import 'package:intl/intl.dart';

class DateFormatter {
  static String? dateFormatter(DateTime? date) {
    if (date == null) return null;
    return DateFormat('dd-MM-yyyy HH:mm:ss a').format(date);
    // return DateFormat('yyyy-MM-dd').format(date);
    // return DateFormat('MMMM dd, yyyy').format(date);
    // return DateFormat('EEEE, MMM dd, yyyy').format(date);
  }
}
