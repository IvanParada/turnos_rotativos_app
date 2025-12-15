import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

String greetingByHour(BuildContext context) {
  final hour = DateTime.now().hour;
  final t = AppLocalizations.of(context)!;

  if (hour >= 5 && hour < 12) {
    return t.good_morning;
  } else if (hour >= 12 && hour < 19) {
    return t.good_afternoon;
  } else {
    return t.good_night;
  }
}

String formatDate(DateTime date, BuildContext context) {
  final locale = Localizations.localeOf(context).toString();

  final formatted = DateFormat('EEE dd MMM', locale).format(date);

  return formatted
      .split(' ')
      .map((w) => w.isNotEmpty
          ? w[0].toUpperCase() + w.substring(1)
          : w)
      .join(' ');
}

String formatTime(DateTime date) {
  return DateFormat('HH:mm').format(date);
}

  String formatDateInput(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }