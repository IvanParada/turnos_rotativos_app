import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/onboarding/onboarding_cubit.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/pages/first_step_page.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/pages/second_step_page.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/pages/third_step_page.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/widgets/step_progress_bar_widget.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const int _totalSteps = 3;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit()..checkIfCompleted(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listenWhen: (prev, curr) =>
            prev.status != curr.status &&
            curr.status == OnboardingStatus.completed,
        listener: (context, state) {
          context.go('/');
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: StepProgressBar(
                      currentStep: state.currentStep,
                      totalSteps: _totalSteps,
                    ),
                  ),

                  Expanded(child: _buildStep(context, state.currentStep)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStep(BuildContext context, int step) {
    final firstStepState = context.watch<FirstStepCubit>().state;

    switch (step) {
      case 0:
        return _StepContainer(
          child: const FirstStepPage(),
          canNext: firstStepState.isFirstStepValid,
          onNext: () => context.read<OnboardingCubit>().nextStep(),
        );

      case 1:
        return _StepContainer(
          canNext: firstStepState.isSecondStepValid,
          onNext: () => context.read<OnboardingCubit>().nextStep(),
          onBack: () => context.read<OnboardingCubit>().previousStep(),
          child: const SecondStepPage(),
        );

      case 2:
        return _StepContainer(
          child: const ThirdStepPage(),
          canNext: true,
          onNext: () async {
            await context.read<FirstStepCubit>().persistShift();
            await context.read<OnboardingCubit>().finishOnboarding();
          },
          onBack: () => context.read<OnboardingCubit>().previousStep(),
        );

      default:
        return const SizedBox();
    }
  }
}

class _StepContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback onNext;
  final VoidCallback? onBack;
  final bool canNext;

  const _StepContainer({
    required this.child,
    required this.onNext,
    required this.canNext,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [
          Expanded(child: child),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.1,
              right: size.width * 0.1,
              bottom: size.width * 0.1,
            ),
            child: Row(
              mainAxisAlignment: onBack != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (onBack != null)
                  GestureDetector(
                    onTap: onBack,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.textPrimary,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.back,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.textPrimary),
                        ),
                      ),
                    ),
                  ),

                GestureDetector(
                  onTap: canNext ? onNext : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: canNext
                          ? AppColors.textPrimary
                          : AppColors.textPrimary.withOpacity(.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.next,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.accentSoft,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
