import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/core/storage/shift_storage.dart';

part 'first_step_state.dart';

const predefinedShifts = [
  {'work': 14, 'rest': 14},
  {'work': 10, 'rest': 5},
  {'work': 7, 'rest': 7},
  {'work': 4, 'rest': 3},
  {'work': 21, 'rest': 7},
  {'work': 5, 'rest': 2},
];

class FirstStepCubit extends Cubit<FirstStepState> {
  final ShiftStorage _storage;

  FirstStepCubit(this._storage)
    : super(const FirstStepState(shiftType: ShiftType.predefined));

  void selectShiftType(ShiftType type) {
    emit(
      FirstStepState(
        shiftType: type,
        selectedPredefinedIndex: null,
        workDays: null,
        restDays: null,
        startDate: state.startDate,
      ),
    );
  }

  void selectPredefinedShift(int index) {
    final shift = predefinedShifts[index];

    emit(
      state.copyWith(
        selectedPredefinedIndex: index,
        workDays: shift['work'],
        restDays: shift['rest'],
      ),
    );
  }

  void setWorkDays(String value) {
    emit(state.copyWith(workDays: int.tryParse(value)));
  }

  void setRestDays(String value) {
    emit(state.copyWith(restDays: int.tryParse(value)));
  }

  void setStartDate(DateTime date) {
    emit(state.copyWith(startDate: date));
  }

  Future<void> persistShift() async {
    if (state.workDays == null ||
        state.restDays == null ||
        state.startDate == null) {
      return;
    }

    await _storage.saveShift(
      workDays: state.workDays!,
      restDays: state.restDays!,
      startDate: state.startDate!,
    );
  }

  Future<void> restoreShift() async {
    final data = await _storage.loadShift();
    if (data == null) return;

    emit(
      state.copyWith(
        shiftType: ShiftType.custom,
        workDays: data.workDays,
        restDays: data.restDays,
        startDate: data.startDate,
      ),
    );
  }
}
