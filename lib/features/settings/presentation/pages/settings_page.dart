import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/features/settings/presentation/widgets/input_edit_date.dart';
import 'package:turnos_rotativos/features/settings/presentation/widgets/save_button_widget.dart';
import 'package:turnos_rotativos/features/settings/presentation/widgets/shift_input_edit_widget.dart';
import 'package:turnos_rotativos/features/settings/presentation/widgets/shift_list_edit_widget.dart';
import 'package:quickalert/quickalert.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workController = TextEditingController();
    final restController = TextEditingController();
    final size = MediaQuery.of(context).size;

    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (prev, curr) => !prev.isEditing && curr.isEditing,
      listener: (context, state) {
        workController.text = state.editingWorkDays?.toString() ?? '';
        restController.text = state.editingRestDays?.toString() ?? '';
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();

          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    'Ajustes',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              foregroundColor: AppColors.textPrimary,
              surfaceTintColor: Colors.white,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight + 16),

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05,
                  vertical: size.height * .01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Actualizar el patrón de turnos',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    RadioListTile<ShiftType>(
                      value: ShiftType.predefined,
                      groupValue: state.editingShiftType,
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      activeColor: AppColors.textPrimary,
                      title: Text(
                        'Selecciona tu patrón de turnos predefinido',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      onChanged: (v) => cubit.updateEditingShiftType(v!),
                    ),
                    ShiftListEditWidget(
                      isEnabled: state.isPredefinedEditing,
                      selectedIndex: state.editingPredefinedIndex,
                      onSelect: (index) {
                        cubit.selectPredefinedShift(index);
                      },
                    ),

                    const Divider(),

                    RadioListTile<ShiftType>(
                      value: ShiftType.custom,
                      groupValue: state.editingShiftType,
                      activeColor: AppColors.textPrimary,
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Ingresar patrón de turnos manualmente',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      onChanged: (v) => cubit.updateEditingShiftType(v!),
                    ),
                    ShiftInputEditWidget(
                      isPredefined: state.isPredefinedEditing,
                      workController: workController,
                      restController: restController,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * .03,
                      ),
                      child: Divider(),
                    ),
                    const Text(
                      'Actualizar primer día de trabajo',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    InputEditDate(cubit: cubit, state: state),

                    const SizedBox(height: 32),

                    SaveButtonWidget(
                      icon: AppAssets.save,
                      title: 'Guardar Cambios',
                      onTap: () async {
                        await cubit.confirmEditing();
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          confirmBtnColor: AppColors.textPrimary,
                          confirmBtnText: 'Aceptar',
                          title: '¡Actualizado Exitosamente!',
                          text:
                              'Podrás actualizar tus datos cuando seas necesario.',
                          textColor: AppColors.textSecondary,
                          borderRadius: 15,
                          animType: QuickAlertAnimType.slideInUp,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
