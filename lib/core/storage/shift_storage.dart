import 'package:shared_preferences/shared_preferences.dart';

class ShiftStorage {
  static const _workDaysKey = 'work_days';
  static const _restDaysKey = 'rest_days';
  static const _startDateKey = 'start_date';

  Future<void> saveShift({
    required int workDays,
    required int restDays,
    required DateTime startDate,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_workDaysKey, workDays);
    await prefs.setInt(_restDaysKey, restDays);
    await prefs.setString(
      _startDateKey,
      startDate.toIso8601String(),
    );
  }

  Future<ShiftData?> loadShift() async {
    final prefs = await SharedPreferences.getInstance();

    final workDays = prefs.getInt(_workDaysKey);
    final restDays = prefs.getInt(_restDaysKey);
    final startDateStr = prefs.getString(_startDateKey);

    if (workDays == null ||
        restDays == null ||
        startDateStr == null) {
      return null;
    }

    return ShiftData(
      workDays: workDays,
      restDays: restDays,
      startDate: DateTime.parse(startDateStr),
    );
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_workDaysKey);
    await prefs.remove(_restDaysKey);
    await prefs.remove(_startDateKey);
  }
}

class ShiftData {
  final int workDays;
  final int restDays;
  final DateTime startDate;

  ShiftData({
    required this.workDays,
    required this.restDays,
    required this.startDate,
  });
}
