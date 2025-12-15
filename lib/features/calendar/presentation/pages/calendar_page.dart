import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/calendar/presentation/pages/indicator_shift_type_widget.dart';
import 'package:turnos_rotativos/features/calendar/presentation/widgets/export_calendar_widget.dart';
import 'package:turnos_rotativos/features/calendar/presentation/widgets/monthly_calendar_page.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Calendario',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .05,
              vertical: size.height * .01,
            ),
            child: Column(
              spacing: 10,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: AppColors.textTertiary.withOpacity(.2),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(AppAssets.arrowLeft),
                        onPressed: () {
                          context.read<HomeCubit>().calculateMonthlyStats(
                            date: DateTime(
                              state.referenceMonth!.year,
                              state.referenceMonth!.month - 1,
                            ),
                          );
                        },
                      ),
                      Column(
                        children: [
                          Text(
                            DateFormat.MMMM(
                              'es',
                            ).format(state.referenceMonth!).toUpperCase(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${state.referenceMonth!.year}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      IconButton(
                        icon: SvgPicture.asset(AppAssets.arrowRight),
                        onPressed: () {
                          context.read<HomeCubit>().calculateMonthlyStats(
                            date: DateTime(
                              state.referenceMonth!.year,
                              state.referenceMonth!.month + 1,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                if (state.referenceMonth != null)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: AppColors.textTertiary.withOpacity(.2),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: MonthlyCalendarPage(
                      referenceMonth: state.referenceMonth!,
                      startDate: state.startDate!,
                      workDays: state.workDays!,
                      restDays: state.restDays!,
                    ),
                  ),
                IndicatorShiftTypeWidget(),
                Vgap(15.0),
                ExportCalendarWidget(size: size),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * .005,
                      horizontal: size.width * 0.1,
                    ),
                    child: Text(
                      'Descarga archivo .ics compatible con cualquier calendario.',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.textTertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
