import 'package:intl/intl.dart';

String formatDateToString(DateTime dateTime) {
  // Format the date to "yyyy-MM-dd"
  String formattedDateString = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDateString;
}
