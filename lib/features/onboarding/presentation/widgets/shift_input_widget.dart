import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class ShiftInput extends StatelessWidget {
  const ShiftInput({super.key, required this.isPredefined});

  final bool isPredefined;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isPredefined,
      child: Opacity(
        opacity: isPredefined ? 0.4 : 1,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: context.read<FirstStepCubit>().setWorkDays,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.work,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.textTertiary.withOpacity(.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.textTertiary.withOpacity(.3),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.textTertiary.withOpacity(.3),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('x', style: TextStyle(fontSize: 20)),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: context.read<FirstStepCubit>().setRestDays,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.rest,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.textTertiary.withOpacity(.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.textTertiary.withOpacity(.3),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.textTertiary.withOpacity(.3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
