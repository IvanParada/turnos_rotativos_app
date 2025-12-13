part of 'onboarding_cubit.dart';

enum OnboardingStatus { initial, inProgress, completed }

class OnboardingState {
  final int currentStep;
  final OnboardingStatus status;

  const OnboardingState({
    required this.currentStep,
    required this.status,
  });

  const OnboardingState.initial()
      : currentStep = 0,
        status = OnboardingStatus.initial;

  OnboardingState copyWith({
    int? currentStep,
    OnboardingStatus? status,
  }) {
    return OnboardingState(
      currentStep: currentStep ?? this.currentStep,
      status: status ?? this.status,
    );
  }
}
