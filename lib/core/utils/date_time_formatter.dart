import 'package:intl/intl.dart';

class DateTimeFormatter {
  String convertDateFormat(String inputFormat) {
    DateTime dateTime = DateTime.parse(inputFormat);
    String month = DateFormat('MMMM').format(dateTime);
    String day = DateFormat('d').format(dateTime);
    return '$day $month';
  }
}
