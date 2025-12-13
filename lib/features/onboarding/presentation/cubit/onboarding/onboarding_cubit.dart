import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turnos_rotativos/core/storage/onboarding_storage.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  static const _storageKey = 'onboarding_completed';

  OnboardingCubit() : super(const OnboardingState.initial());

  Future<void> checkIfCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final completed = prefs.getBool(_storageKey) ?? false;

    emit(
      state.copyWith(
        status: completed
            ? OnboardingStatus.completed
            : OnboardingStatus.inProgress,
      ),
    );
  }

  void nextStep() {
    if (state.currentStep < 2) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  Future<void> finishOnboarding() async {
    await OnboardingStorage.markCompleted();
    emit(state.copyWith(status: OnboardingStatus.completed));
  }
}
