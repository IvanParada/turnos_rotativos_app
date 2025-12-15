import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class ShiftInputEditWidget extends StatelessWidget {
  const ShiftInputEditWidget({
    super.key,
    required this.isPredefined,
    required this.workController,
    required this.restController,
  });

  final bool isPredefined;
  final TextEditingController workController;
  final TextEditingController restController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return AbsorbPointer(
      absorbing: isPredefined,
      child: Opacity(
        opacity: isPredefined ? 0.4 : 1,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: workController,
                keyboardType: TextInputType.number,
                onChanged: cubit.updateEditingWorkDays,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.work,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
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
                controller: restController,
                keyboardType: TextInputType.number,
                onChanged: cubit.updateEditingRestDays,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.rest,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
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
