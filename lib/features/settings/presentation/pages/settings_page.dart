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
import 'package:turnos_rotativos/l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.read<HomeCubit>();
    final workController = TextEditingController();
    final restController = TextEditingController();

    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (prev, curr) {
        return (!prev.isEditing && curr.isEditing) ||
            (prev.editingWorkDays != curr.editingWorkDays) ||
            (prev.editingRestDays != curr.editingRestDays);
      },
      listener: (context, state) {
        if (state.isEditing) {
          final workStr = state.editingWorkDays?.toString() ?? '';
          final restStr = state.editingRestDays?.toString() ?? '';

          if (workController.text != workStr) workController.text = workStr;
          if (restController.text != restStr) restController.text = restStr;
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.editingShiftType == null && state.hasShift) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cubit.startEditing();
            });
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              foregroundColor: AppColors.textPrimary,
              surfaceTintColor: Colors.white,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: kBottomNavigationBarHeight + 16,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05,
                  vertical: size.height * .01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.update_pattern_text,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    // FLUJO 1: PATRÓN PREDEFINIDO
                    RadioListTile<ShiftType>(
                      value: ShiftType.predefined,
                      groupValue: state.editingShiftType,
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      activeColor: AppColors.textPrimary,
                      title: Text(
                        AppLocalizations.of(
                          context,
                        )!.select_pattern_shift_predefined,
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
                        AppLocalizations.of(
                          context,
                        )!.select_pattern_shift_custom,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      onChanged: (v) => cubit.updateEditingShiftType(v!),
                    ),
                    ShiftInputEditWidget(
                      key: ValueKey('input_${state.editingShiftType}'),
                      isPredefined: state.isPredefinedEditing,
                      workController: workController,
                      restController: restController,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * .03,
                      ),
                      child: const Divider(),
                    ),
                    Text(
                      AppLocalizations.of(context)!.update_first_work_day,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    InputEditDate(cubit: cubit, state: state),

                    const SizedBox(height: 32),

                    SaveButtonWidget(
                      icon: AppAssets.save,
                      title: AppLocalizations.of(context)!.save_text,
                      isDisabled: !state.canSave,
                      onTap: () async {
                        await cubit.confirmEditing();
                        if (context.mounted) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            confirmBtnColor: AppColors.textPrimary,
                            confirmBtnText: AppLocalizations.of(context)!.agree,
                            title: AppLocalizations.of(
                              context,
                            )!.updated_success_title_dialog,
                            text: AppLocalizations.of(
                              context,
                            )!.updated_success_subtitle_dialog,
                            textColor: AppColors.textSecondary,
                            borderRadius: 15,
                            animType: QuickAlertAnimType.slideInUp,
                          );
                        }
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
