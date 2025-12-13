import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/core/utils/helper.dart';
import 'package:turnos_rotativos/core/utils/shift_helper.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/features/home/presentation/widgets/next_shift_type.dart';
import 'package:turnos_rotativos/features/home/presentation/widgets/work_today_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Turnos App',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Gestión de Turnos',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .05,
          vertical: size.width * .05,
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WorkTodayWidget(state: state),
                Vgap(10.0),

                Row(
                  children: [
                    NextShiftType(
                      nextTypeShift: ShiftDayType.work,
                      state: state,
                    ),
                    const SizedBox(width: 12),
                    NextShiftType(
                      nextTypeShift: ShiftDayType.rest,
                      state: state,
                    ),
                  ],
                ),
                Vgap(10.0),

                Container(
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
                              Text('Este mes'),
                            ],
                          ),
                          Text('Mostrar mes'),
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
                              Text('Trabajados'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(state.monthlyRestDays.toString()),
                              Text('Descansados'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(state.monthlyTotalDays.toString()),
                              Text('Total'),
                            ],
                          ),
                        ],
                      ),
                      Vgap(20.0),
                      Text('Balance trabajo / descanso'),
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
                      //TODO: CIRCLE INDICATOR
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
