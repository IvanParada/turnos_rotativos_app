// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'App de Turnos';

  @override
  String get welcome => 'Bienvenido';

  @override
  String get subtitle_step_1 => 'Gestiona tus turnos rotativos de forma simple y profesional.';

  @override
  String get select_pattern_shift_predefined => 'Selecciona tu patrón de turnos predefinido';

  @override
  String get select_pattern_shift_custom => 'Ingresa patrón de turnos manualmente';

  @override
  String get shift => 'Turno';

  @override
  String get work => 'Trabajo';

  @override
  String get rest => 'Descanso';

  @override
  String get next => 'Siguiente';

  @override
  String get title_step_2 => '¿Cuándo empieza tu ciclo?';

  @override
  String get subtitle_step_2 => 'Selecciona el primer día de tu próximo turno de trabajo.';

  @override
  String get first_day_text => 'Primer día de trabajo';

  @override
  String get pattern_selected => 'Patrón seleccionado';

  @override
  String get back => 'Atrás';

  @override
  String get select_date => 'Seleccionar fecha';

  @override
  String get cancel => 'Cancelar';

  @override
  String get agree => 'Aceptar';

  @override
  String get title_step_3 => '¡Todo Listo!';

  @override
  String get subtitle_step_3 => 'Revisa tu configuración antes de comenzar.';

  @override
  String get pattern_shift => 'Patrón de turnos';

  @override
  String get init_date => 'Fecha de inicio';

  @override
  String get good_morning => 'Buenos días';

  @override
  String get good_afternoon => 'Buenas tardes';

  @override
  String get good_night => 'Buenas noches';

  @override
  String get next_work => 'Próximo Trabajo';

  @override
  String get next_rest => 'Próximo Descanso';

  @override
  String get tomorrow => 'Mañana';

  @override
  String get days => 'días';

  @override
  String get this_month => 'Este mes';

  @override
  String get worked => 'Trabajados';

  @override
  String get rested => 'Descansados';

  @override
  String get total => 'Total';

  @override
  String get balance_text => 'Balance trabajo/descanso';

  @override
  String get your_pattern => 'Tu Patrón';

  @override
  String get days_work => 'Días Trabajo';

  @override
  String get days_rest => 'Dias Descanso';

  @override
  String cycle_days(Object days) {
    return 'Ciclo de $days días';
  }

  @override
  String get home => 'Inicio';

  @override
  String get calendar => 'Calendario';

  @override
  String get settings => 'Ajustes';

  @override
  String get update_pattern_text => 'Actualizar el patrón de turnos';

  @override
  String get update_first_work_day => 'Actualizar primer día de trabajo';

  @override
  String get new_date_text => 'Seleccionar nueva fecha';

  @override
  String get save_text => 'Guardar Cambios';

  @override
  String get updated_success_title_dialog => '¡Actualizado Exitosamente!';

  @override
  String get updated_success_subtitle_dialog => 'Podrás actualizar tus datos cuando sea necesario.';

  @override
  String get today_work => 'Hoy trabajas';

  @override
  String get today_rest => 'Hoy descansas';

  @override
  String get today => 'Hoy';

  @override
  String days_count(Object count) {
    return '$count días';
  }

  @override
  String get pattern => 'Turno';
}
