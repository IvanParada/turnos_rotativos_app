import 'package:intl/intl.dart';

String greetingByHour() {
  final hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    return 'Buenos días';
  } else if (hour >= 12 && hour < 19) {
    return 'Buenas tardes';
  } else {
    return 'Buenas noches';
  }
}

String formatDate(DateTime date) {
  final text = DateFormat('EEE dd MMM', 'es_ES').format(date);
  return text
      .split(' ')
      .map((w) => w[0].toUpperCase() + w.substring(1))
      .join(' ');
}

String formatTime(DateTime date) {
  return DateFormat('HH:mm').format(date);
}