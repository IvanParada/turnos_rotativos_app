import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: List.generate(totalSteps, (index) {
        final isCompleted = index < currentStep;
        final isActive = index == currentStep;

        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 6,
            decoration: BoxDecoration(
              color: isCompleted || isActive
                  ? AppColors.textPrimary
                  : AppColors.textTertiary,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}
