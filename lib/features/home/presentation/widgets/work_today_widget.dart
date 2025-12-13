import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/core/utils/helper.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';

class WorkTodayWidget extends StatelessWidget {
  const WorkTodayWidget({
    super.key,
    required this.state,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: state.todayType == ShiftDayType.work
            ? Colors.orange
            : Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: !state.hasShift
          ? const Text(
              'No hay turnos configurados',
              style: TextStyle(color: Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.sun,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        Hgap(size.width * .02),
                        Text(
                          greetingByHour(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Vgap(size.height * 0.01),
                    Text(
                      state.todayType == ShiftDayType.work
                          ? 'Hoy trabajas'
                          : 'Hoy descansas',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                    Vgap(size.height * 0.01),
    
                    Text(
                      formatDate(DateTime.now()),
                      style: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    Vgap(size.height * 0.01),
    
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.clock,
                          color: Colors.white,
                        ),
                        Hgap(10.0),
                        Text(
                          formatTime(DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
    
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: state.todayType == ShiftDayType.work
                        ? Colors.orangeAccent.withOpacity(.8)
                        : Colors.lightGreen.withOpacity(.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SvgPicture.asset(
                    state.todayType == ShiftDayType.work
                        ? AppAssets.briefcase
                        : AppAssets.coffe,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
