import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShiftList extends StatelessWidget {
  const ShiftList({super.key, required this.isPredefined, required this.state});

  final bool isPredefined;
  final FirstStepState state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PrimaryScrollController(
      controller: ScrollController(),
      child: SizedBox(
        height: size.height * 0.4,
        child: AbsorbPointer(
          absorbing: !isPredefined,
          child: Opacity(
            opacity: isPredefined ? 1 : 0.4,
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 3,
              radius: const Radius.circular(8),
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 20),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final bool isSelected =
                      state.selectedPredefinedIndex == index;

                  final shift = predefinedShifts[index];

                  return GestureDetector(
                    onTap: isPredefined
                        ? () {
                            context
                                .read<FirstStepCubit>()
                                .selectPredefinedShift(index);
                          }
                        : null,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 4,
                      ),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.accent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.accent
                              : Colors.grey.shade300,
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Turno ${shift['work']}x${shift['rest']}',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.briefcase,
                                colorFilter: ColorFilter.mode(
                                  AppColors.workDay,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${shift['work']}',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: const Text(' · '),
                              ),
                              SvgPicture.asset(
                                AppAssets.coffe,
                                colorFilter: ColorFilter.mode(
                                  AppColors.restDay,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${shift['rest']}',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
