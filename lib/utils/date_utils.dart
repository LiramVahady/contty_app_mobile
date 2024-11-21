import 'package:intl/intl.dart';

class MyDateUtils {
  static formatDateTime(DateTime date) {
    // Hebrew weekday names
    const hebrewWeekdays = [
      'יום ראשון',
      'יום שני',
      'יום שלישי',
      'יום רביעי',
      'יום חמישי',
      'יום שישי',
      'שבת'
    ];

    // Get the weekday name in Hebrew
    String weekday = hebrewWeekdays[date.weekday - 1];

    // Format the date as dd.MM.yyyy
    String formattedDate = DateFormat('dd.MM.yyyy').format(date);

    // Get the day of the month (number)
    String dayOfMonth = date.day.toString();

    return '$weekday $formattedDate ($dayOfMonth)';
  }
}
