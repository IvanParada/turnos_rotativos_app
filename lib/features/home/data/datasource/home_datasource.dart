import 'package:turnos_rotativos/core/storage/shift_storage.dart';

class HomeDatasource {
  final ShiftStorage shiftStorage;

  HomeDatasource({required this.shiftStorage});

  Future<ShiftData?> getShiftData() {
    return shiftStorage.loadShift();
  }

  Future<void> saveShift({
    required int workDays,
    required int restDays,
    required DateTime startDate,
  }) {
    return shiftStorage.saveShift(
      workDays: workDays,
      restDays: restDays,
      startDate: startDate,
    );
  }
}
