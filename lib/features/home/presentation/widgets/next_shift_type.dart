import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/core/utils/helper.dart';
import 'package:turnos_rotativos/core/utils/shift_helper.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class NextShiftType extends StatelessWidget {
  const NextShiftType({
    super.key,
    required this.nextTypeShift,
    required this.state,
  });

  final ShiftDayType nextTypeShift;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
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
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: nextTypeShift == ShiftDayType.work
                        ? Colors.orange.withOpacity(.1)
                        : Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: nextTypeShift == ShiftDayType.work
                      ? SvgPicture.asset(
                          AppAssets.briefcase,
                          color: Colors.orange,
                          width: 20,
                        )
                      : SvgPicture.asset(
                          AppAssets.coffe,
                          color: Colors.green,
                          width: 20,
                        ),
                ),
                Hgap(10.0),
                Expanded(
                  child: Text(
                    nextTypeShift == ShiftDayType.work
                        ? AppLocalizations.of(context)!.next_work
                        : AppLocalizations.of(context)!.next_rest,
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Vgap(10.0),
            Text(
              nextTypeShift == ShiftDayType.work
                  ? state.nextWorkDay != null
                        ? formatDate(state.nextWorkDay!, context)
                        : '--'
                  : state.nextRestDay != null
                  ? formatDate(state.nextRestDay!, context)
                  : '--',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              nextTypeShift == ShiftDayType.work
                  ? state.nextWorkDay != null
                        ? getDaysLabel(state.nextWorkDay!, context)
                        : '--'
                  : state.nextRestDay != null
                  ? getDaysLabel(state.nextRestDay!, context)
                  : '--',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: nextTypeShift == ShiftDayType.work
                    ? Colors.orange
                    : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
