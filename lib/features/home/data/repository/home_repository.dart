import 'package:turnos_rotativos/features/home/data/datasource/home_datasource.dart';
import 'package:turnos_rotativos/core/storage/shift_storage.dart';

class HomeRepository {
  const HomeRepository({required this.homeDatasource});

  final HomeDatasource homeDatasource;

  Future<ShiftData?> getShiftData() {
    return homeDatasource.getShiftData();
  }
}
