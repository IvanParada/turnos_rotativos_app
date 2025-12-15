import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/features/settings/presentation/widgets/save_button_widget.dart';
import 'package:turnos_rotativos/features/settings/presentation/widgets/shift_input_edit_widget.dart';
import 'package:turnos_rotativos/features/settings/presentation/widgets/shift_list_edit_widget.dart';

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
              title: const Text('Ajustes'),
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

                    const SizedBox(height: 24),
                    const Text(
                      'Actualizar primer día de trabajo',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    GestureDetector(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: state.editingStartDate ?? DateTime.now(),
                          firstDate: DateTime.now().subtract(
                            const Duration(days: 365),
                          ),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365 * 5),
                          ),
                        );

                        if (picked != null) {
                          cubit.updateEditingStartDate(picked);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined),
                            const SizedBox(width: 12),
                            Text(
                              state.editingStartDate == null
                                  ? 'Seleccionar nueva fecha'
                                  : _formatDate(state.editingStartDate!),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    SaveButtonWidget(
                      icon: AppAssets.save,
                      title: 'Guardar Cambios',
                      onTap: () async {
                        await cubit.confirmEditing();
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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
