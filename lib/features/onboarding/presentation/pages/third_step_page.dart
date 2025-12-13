import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';

class ThirdStepPage extends StatelessWidget {
  const ThirdStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: BlocBuilder<FirstStepCubit, FirstStepState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Vgap(size.height * .08),
                  const Text(
                    '¡Todo Listo!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Vgap(size.height * .02),
                  const Text(
                    'Revisa tu configuración antes de comenzar.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Vgap(size.height * .05),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patrón de turnos'),
                        Text(
                          state.selectedPattern,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                          ),
                          child: Divider(
                            color: AppColors.textTertiary.withOpacity(.2),
                          ),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.briefcase,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.workDay,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${state.workDays.toString()} trabajo',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.coffe,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.restDay,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${state.restDays.toString()} descanso',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Vgap(size.height * 0.04),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: AppColors.textTertiary.withOpacity(.2)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Fecha de inicio',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.startDate != null
                                  ? _formatFullDate(state.startDate!)
                                  : '-',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.08),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// jueves, 22 de diciembre de 2025
  String _formatFullDate(DateTime date) {
    const days = [
      'lunes',
      'martes',
      'miércoles',
      'jueves',
      'viernes',
      'sábado',
      'domingo',
    ];

    const months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];

    final dayName = days[date.weekday - 1];
    final monthName = months[date.month - 1];

    return '$dayName, ${date.day} de $monthName de ${date.year}';
  }
}
