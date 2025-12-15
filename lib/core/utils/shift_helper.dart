import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';

ShiftDayType getShiftDayType({
  required DateTime startDate,
  required int workDays,
  required int restDays,
  required DateTime targetDate,
}) {
  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final target = DateTime(targetDate.year, targetDate.month, targetDate.day);

  final daysFromStart = target.difference(start).inDays;

  if (daysFromStart < 0) {
    return ShiftDayType.rest;
  }

  final cycleLength = workDays + restDays;
  final dayInCycle = daysFromStart % cycleLength;

  return dayInCycle < workDays ? ShiftDayType.work : ShiftDayType.rest;
}

DateTime getNextWorkDay({
  required DateTime startDate,
  required int workDays,
  required int restDays,
  required DateTime fromDate,
}) {
  DateTime date = DateTime(fromDate.year, fromDate.month, fromDate.day);

  while (true) {
    date = date.add(const Duration(days: 1));

    final type = getShiftDayType(
      startDate: startDate,
      workDays: workDays,
      restDays: restDays,
      targetDate: date,
    );

    if (type == ShiftDayType.work) {
      return date;
    }
  }
}

DateTime getNextRestDay({
  required DateTime startDate,
  required int workDays,
  required int restDays,
  required DateTime fromDate,
}) {
  DateTime date = DateTime(fromDate.year, fromDate.month, fromDate.day);

  while (true) {
    date = date.add(const Duration(days: 1));

    final type = getShiftDayType(
      startDate: startDate,
      workDays: workDays,
      restDays: restDays,
      targetDate: date,
    );

    if (type == ShiftDayType.rest) {
      return date;
    }
  }
}

String getDaysLabel(DateTime targetDate) {
  final today = DateTime.now();
  final todayOnly = DateTime(today.year, today.month, today.day);
  final targetOnly = DateTime(
    targetDate.year,
    targetDate.month,
    targetDate.day,
  );

  final diffDays = targetOnly.difference(todayOnly).inDays;

  if (diffDays == 0) {
    return 'Hoy';
  }

  if (diffDays == 1) {
    return 'Mañana';
  }

  return '$diffDays días';
}

class MonthlyShiftSummary {
  final int workedDays;
  final int restDays;
  final int totalDays;

  const MonthlyShiftSummary({
    required this.workedDays,
    required this.restDays,
    required this.totalDays,
  });

  double get workPercentage => totalDays == 0 ? 0 : workedDays / totalDays;
}

MonthlyShiftSummary calculateMonthlySummary({
  required DateTime startDate,
  required int workDays,
  required int restDays,
  required int year,
  required int month,
}) {
  final firstDayOfMonth = DateTime(year, month, 1);
  final lastDayOfMonth = DateTime(year, month + 1, 0);

  int worked = 0;
  int rest = 0;

  DateTime current = firstDayOfMonth;

  while (!current.isAfter(lastDayOfMonth)) {
    final dayType = getShiftDayType(
      startDate: startDate,
      workDays: workDays,
      restDays: restDays,
      targetDate: current,
    );

    if (dayType == ShiftDayType.work) {
      worked++;
    } else {
      rest++;
    }

    current = current.add(const Duration(days: 1));
  }

  return MonthlyShiftSummary(
    workedDays: worked,
    restDays: rest,
    totalDays: worked + rest,
  );
}
