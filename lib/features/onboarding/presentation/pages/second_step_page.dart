import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/utils/helper.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';

class SecondStepPage extends StatelessWidget {
  const SecondStepPage({super.key});

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
                    '¿Cuándo empieza tu ciclo?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Vgap(size.height * .02),
                  const Text(
                    'Selecciona el primer día de tu próximo turno de trabajo.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Vgap(size.height * .05),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.textTertiary.withOpacity(.1),
                      border: Border.all(
                        color: AppColors.textTertiary.withOpacity(.4),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Primer día de trabajo'),
                        Vgap(10.0),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: state.startDate ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365 * 5),
                              ),
                              cancelText: 'Cancelar',
                              confirmText: 'Aceptar',
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      surface: Colors.white,
                                      primary: AppColors.textPrimary,
                                      onPrimary: Colors.white,
                                      onSurface: AppColors.textPrimary,
                                    ),
                                    datePickerTheme: DatePickerThemeData(
                                      backgroundColor: Colors.white,
                                      cancelButtonStyle: TextButton.styleFrom(
                                        foregroundColor:
                                            AppColors.textSecondary,
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      confirmButtonStyle: TextButton.styleFrom(
                                        backgroundColor: AppColors.textPrimary,

                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (pickedDate != null) {
                              context.read<FirstStepCubit>().setStartDate(
                                pickedDate,
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined),
                                const SizedBox(width: 12),
                                Text(
                                  state.startDate == null
                                      ? 'DD/MM/YYYY'
                                      : formatDateInput(state.startDate!),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: state.startDate == null
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Vgap(size.height * .04),
                  Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.textTertiary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.textTertiary.withOpacity(.2),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patrón seleccionado:'),
                        Vgap(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  state.workDays.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: AppColors.workDay),
                                ),
                                Text(
                                  'Trabajo',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppColors.workDay),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: size.height * .02,
                                    left: size.width * .04,
                                    right: size.width * .04,
                                  ),
                                  child: Text(
                                    'x',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  state.restDays.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: AppColors.restDay),
                                ),
                                Text(
                                  'Descanso',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppColors.restDay),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
