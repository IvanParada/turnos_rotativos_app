import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/widgets/shift_input_widget.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/widgets/shift_list_widget.dart';

class FirstStepPage extends StatelessWidget {
  const FirstStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: BlocBuilder<FirstStepCubit, FirstStepState>(
          builder: (context, state) {
            final bool isPredefined = state.isPredefined;
    
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Vgap(size.height * .01),
                  Text(
                    'Bienvenido!',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
    
                  Vgap(size.height * .01),
                  Text(
                    'Gestiona tus turnos rotativos de forma simple y profesional',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
    
                  Vgap(size.height * .02),
                  RadioListTile<ShiftType>(
                    value: ShiftType.predefined,
                    groupValue: state.shiftType,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    activeColor: AppColors.textPrimary,
                    title: Text(
                      'Selecciona tu patrón de turnos',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<FirstStepCubit>().selectShiftType(value!);
                    },
                  ),
                  ShiftList(isPredefined: isPredefined, state: state),
                  const Divider(),
                  RadioListTile<ShiftType>(
                    value: ShiftType.custom,
                    groupValue: state.shiftType,
                    activeColor: AppColors.textPrimary,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Otro turno',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<FirstStepCubit>().selectShiftType(value!);
                    },
                  ),
                  Vgap(size.height * .02),
                  ShiftInput(isPredefined: isPredefined),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
