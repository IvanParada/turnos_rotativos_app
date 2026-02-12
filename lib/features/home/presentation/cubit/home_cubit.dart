import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/core/enums/status_enum.dart';
import 'package:turnos_rotativos/core/utils/shift_helper.dart';
import 'package:turnos_rotativos/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

const predefinedShifts = [
  {'work': 14, 'rest': 14},
  {'work': 10, 'rest': 5},
  {'work': 7, 'rest': 7},
  {'work': 4, 'rest': 2},
  {'work': 21, 'rest': 7},
  {'work': 5, 'rest': 2},
];

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository}) : super(const HomeState());

  Future<void> loadShift() async {
    final shift = await homeRepository.getShiftData();
    if (shift == null) return;

    emit(
      HomeState(
        status: Status.success,
        workDays: shift.workDays,
        restDays: shift.restDays,
        startDate: shift.startDate,
      ),
    );

    calculateShiftInfo();
    calculateMonthlyStats();
  }

  void calculateShiftInfo() {
    if (!state.hasShift) return;

    final today = DateTime.now();

    emit(
      state.copyWith(
        todayType: getShiftDayType(
          startDate: state.startDate!,
          workDays: state.workDays!,
          restDays: state.restDays!,
          targetDate: today,
        ),
        nextWorkDay: getNextWorkDay(
          startDate: state.startDate!,
          workDays: state.workDays!,
          restDays: state.restDays!,
          fromDate: today,
        ),
        nextRestDay: getNextRestDay(
          startDate: state.startDate!,
          workDays: state.workDays!,
          restDays: state.restDays!,
          fromDate: today,
        ),
      ),
    );
  }

  void calculateMonthlyStats({DateTime? date}) {
    if (!state.hasShift) return;

    final ref = date ?? DateTime.now();
    final summary = calculateMonthlySummary(
      startDate: state.startDate!,
      workDays: state.workDays!,
      restDays: state.restDays!,
      year: ref.year,
      month: ref.month,
    );

    emit(
      state.copyWith(
        referenceMonth: DateTime(ref.year, ref.month),
        monthlyWorkedDays: summary.workedDays,
        monthlyRestDays: summary.restDays,
        monthlyTotalDays: summary.totalDays,
        monthlyWorkPercentage: summary.workPercentage,
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void _recalcChangedFlags() {
    final workChanged = state.editingWorkDays != state.workDays;
    final restChanged = state.editingRestDays != state.restDays;
    final patternChanged =
        (state.editingWorkDays != null && state.editingRestDays != null) &&
        (workChanged || restChanged);

    final firstWorkDayChanged =
        state.editingStartDate != null &&
        state.startDate != null &&
        !_isSameDay(state.editingStartDate!, state.startDate!);

    emit(
      state.copyWith(
        patternChanged: patternChanged,
        firstWorkDayChanged: firstWorkDayChanged,
      ),
    );
  }

  void startEditing() {
    final predefinedIndex = _findPredefinedIndex(
      state.workDays,
      state.restDays,
    );

    emit(
      state.copyWith(
        editingShiftType: predefinedIndex != null
            ? ShiftType.predefined
            : ShiftType.custom,
        editingPredefinedIndex: predefinedIndex,
        editingWorkDays: state.workDays,
        editingRestDays: state.restDays,
        editingStartDate: state.startDate,

        patternChanged: false,
        firstWorkDayChanged: false,
      ),
    );
  }

  int? _findPredefinedIndex(int? work, int? rest) {
    if (work == null || rest == null) return null;

    for (int i = 0; i < predefinedShifts.length; i++) {
      if (predefinedShifts[i]['work'] == work &&
          predefinedShifts[i]['rest'] == rest) {
        return i;
      }
    }
    return null;
  }

  void updateEditingWorkDays(String value) {
    emit(state.copyWith(editingWorkDays: int.tryParse(value)));
    _recalcChangedFlags();
  }

  void updateEditingRestDays(String value) {
    emit(state.copyWith(editingRestDays: int.tryParse(value)));
    _recalcChangedFlags();
  }

  void updateEditingStartDate(DateTime date) {
    emit(state.copyWith(editingStartDate: date));
    _recalcChangedFlags();
  }

  void updateEditingShiftType(ShiftType type) {
    emit(
      state.copyWith(
        editingShiftType: type,
        editingPredefinedIndex: type == ShiftType.custom
            ? null
            : state.editingPredefinedIndex,
      ),
    );
    _recalcChangedFlags();
  }

  void selectPredefinedShift(int index) {
    final shift = predefinedShifts[index];

    emit(
      state.copyWith(
        editingShiftType: ShiftType.predefined,
        editingPredefinedIndex: index,
        editingWorkDays: shift['work'],
        editingRestDays: shift['rest'],
      ),
    );
    _recalcChangedFlags();
  }

  Future<void> confirmEditing() async {
    if (!state.canSave) return;

    if (state.editingWorkDays == null ||
        state.editingRestDays == null ||
        state.editingStartDate == null) {
      return;
    }

    await homeRepository.saveShift(
      workDays: state.editingWorkDays!,
      restDays: state.editingRestDays!,
      startDate: state.editingStartDate!,
    );

    await loadShift();
    startEditing();
  }
}
