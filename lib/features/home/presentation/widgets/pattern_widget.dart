import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class PatternWidget extends StatelessWidget {
  const PatternWidget({super.key, required this.state});

  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.your_pattern,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    state.workDays.toString(),
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge!.copyWith(color: Colors.orange),
                  ),
                  Text(
                    AppLocalizations.of(context)!.days_work,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  ' x ',
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Text(
                    state.restDays.toString(),
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge!.copyWith(color: Colors.green),
                  ),
                  Text(
                    AppLocalizations.of(context)!.days_rest,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          Text(
            state.hasShift
                ? AppLocalizations.of(
                    context,
                  )!.cycle_days(state.workDays! + state.restDays!)
                : 'Sin ciclo definido',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
