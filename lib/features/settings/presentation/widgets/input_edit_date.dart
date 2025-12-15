import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/utils/helper.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class InputEditDate extends StatelessWidget {
  const InputEditDate({super.key, required this.cubit, required this.state});

  final HomeCubit cubit;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: state.editingStartDate ?? DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
          cancelText: AppLocalizations.of(context)!.cancel,
          confirmText: AppLocalizations.of(context)!.agree,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  surface: Colors.white,
                  primary: AppColors.textPrimary,
                  onPrimary: Colors.white,
                  onSurface: AppColors.textPrimary,
                ),
                datePickerTheme: DatePickerThemeData(
                  backgroundColor: Colors.white,
                  cancelButtonStyle: TextButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    textStyle: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  confirmButtonStyle: TextButton.styleFrom(
                    backgroundColor: AppColors.textPrimary,

                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (picked != null) {
          cubit.updateEditingStartDate(picked);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today_outlined),
            const SizedBox(width: 12),
            Text(
              state.editingStartDate == null
                  ? AppLocalizations.of(context)!.new_date_text
                  : formatDateInput(state.editingStartDate!),
            ),
          ],
        ),
      ),
    );
  }
}
