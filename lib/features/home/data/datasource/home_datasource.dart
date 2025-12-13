import 'package:turnos_rotativos/core/storage/shift_storage.dart';

class HomeDatasource {
  final ShiftStorage shiftStorage;

  HomeDatasource({required this.shiftStorage});

  Future<ShiftData?> getShiftData() {
    return shiftStorage.loadShift();
  }
}
