import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class BalanceWorksWidget extends StatelessWidget {
  const BalanceWorksWidget({super.key, required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textTertiary.withOpacity(.2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.trend),
                  Hgap(10.0),
                  Text(AppLocalizations.of(context)!.this_month),
                ],
              ),
            ],
          ),
          Vgap(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 20,
            children: [
              Column(
                children: [
                  Text(state.monthlyWorkedDays.toString()),
                  Text(AppLocalizations.of(context)!.worked),
                ],
              ),
              Column(
                children: [
                  Text(state.monthlyRestDays.toString()),
                  Text(AppLocalizations.of(context)!.rested),
                ],
              ),
              Column(
                children: [
                  Text(state.monthlyTotalDays.toString()),
                  Text(AppLocalizations.of(context)!.total),
                ],
              ),
            ],
          ),
          Vgap(20.0),
          Text(AppLocalizations.of(context)!.balance_text),
          Vgap(10.0),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: state.monthlyWorkPercentage,
                  minHeight: 8,
                  color: Colors.orange,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          Vgap(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.work),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.rest),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
