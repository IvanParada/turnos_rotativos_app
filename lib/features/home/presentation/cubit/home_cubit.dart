import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turnos_rotativos/core/enums/status_enum.dart';
import 'package:turnos_rotativos/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository})
      : super(const HomeState());

  Future<void> loadShift() async {
    final shift = await homeRepository.getShiftData();
    if (shift == null) return;

    emit(
      HomeState(
        workDays: shift.workDays,
        restDays: shift.restDays,
        startDate: shift.startDate,
      ),
    );
  }
}

