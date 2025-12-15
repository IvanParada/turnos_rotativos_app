import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class ShiftListEditWidget extends StatelessWidget {
  const ShiftListEditWidget({
    super.key,
    required this.isEnabled,
    required this.selectedIndex,
    required this.onSelect,
  });

  final bool isEnabled;
  final int? selectedIndex;
  final void Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.4,
      child: AbsorbPointer(
        absorbing: !isEnabled,
        child: Opacity(
          opacity: isEnabled ? 1 : 0.4,
          child: ListView.builder(
            itemCount: predefinedShifts.length,
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              final shift = predefinedShifts[index];

              return GestureDetector(
                onTap: () => onSelect(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
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
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.pattern} ${shift['work']}x${shift['rest']}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textPrimary,
                        ),
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
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
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
                            style: TextStyle(color: AppColors.textSecondary),
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
    );
  }
}
