import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/core/enums/status_enum.dart';
import 'package:turnos_rotativos/core/utils/shift_helper.dart';
import 'package:turnos_rotativos/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

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
}
