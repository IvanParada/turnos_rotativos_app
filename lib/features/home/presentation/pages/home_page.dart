import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/features/home/presentation/widgets/balance_works_widget.dart';
import 'package:turnos_rotativos/features/home/presentation/widgets/next_shift_type.dart';
import 'package:turnos_rotativos/features/home/presentation/widgets/pattern_widget.dart';
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
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .05,
          vertical: size.height * .01,
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WorkTodayWidget(state: state),
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
                  BalanceWorksWidget(state: state),
                  PatternWidget(state: state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
