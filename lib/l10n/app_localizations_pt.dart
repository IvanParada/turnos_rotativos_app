// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'App de Turnos';

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get subtitle_step_1 => 'Gerencie seus turnos rotativos de forma simples e profissional.';

  @override
  String get select_pattern_shift_predefined => 'Selecione seu padrão de turnos predefinido';

  @override
  String get select_pattern_shift_custom => 'Insira o padrão de turnos manualmente';

  @override
  String get shift => 'Turno';

  @override
  String get work => 'Trabalho';

  @override
  String get rest => 'Descanso';

  @override
  String get next => 'Próximo';

  @override
  String get title_step_2 => 'Quando começa seu ciclo?';

  @override
  String get subtitle_step_2 => 'Selecione o primeiro dia do seu próximo turno de trabalho.';

  @override
  String get first_day_text => 'Primeiro dia de trabalho';

  @override
  String get pattern_selected => 'Padrão selecionado';

  @override
  String get back => 'Voltar';

  @override
  String get select_date => 'Selecionar data';

  @override
  String get cancel => 'Cancelar';

  @override
  String get agree => 'Aceitar';

  @override
  String get title_step_3 => 'Tudo pronto!';

  @override
  String get subtitle_step_3 => 'Revise sua configuração antes de começar.';

  @override
  String get pattern_shift => 'Padrão de turnos';

  @override
  String get init_date => 'Data de início';

  @override
  String get good_morning => 'Bom dia';

  @override
  String get good_afternoon => 'Boa tarde';

  @override
  String get good_night => 'Boa noite';

  @override
  String get next_work => 'Próximo trabalho';

  @override
  String get next_rest => 'Próximo descanso';

  @override
  String get tomorrow => 'Amanhã';

  @override
  String get days => 'dias';

  @override
  String get this_month => 'Este mês';

  @override
  String get worked => 'Trabalhados';

  @override
  String get rested => 'Descansados';

  @override
  String get total => 'Total';

  @override
  String get balance_text => 'Equilíbrio trabalho/descanso';

  @override
  String get your_pattern => 'Seu padrão';

  @override
  String get days_work => 'Dias de trabalho';

  @override
  String get days_rest => 'Dias de descanso';

  @override
  String cycle_days(Object days) {
    return 'Ciclo de $days dias';
  }

  @override
  String get home => 'Início';

  @override
  String get calendar => 'Calendário';

  @override
  String get settings => 'Configurações';

  @override
  String get update_pattern_text => 'Atualizar padrão de turnos';

  @override
  String get update_first_work_day => 'Atualizar primeiro dia de trabalho';

  @override
  String get new_date_text => 'Selecionar nova data';

  @override
  String get save_text => 'Salvar alterações';

  @override
  String get updated_success_title_dialog => 'Atualizado com sucesso!';

  @override
  String get updated_success_subtitle_dialog => 'Você pode atualizar seus dados quando necessário.';

  @override
  String get today_work => 'Hoje você trabalha';

  @override
  String get today_rest => 'Hoje você descansa';

  @override
  String get today => 'Hoje';

  @override
  String days_count(Object count) {
    return '$count dias';
  }

  @override
  String get pattern => 'Padrão';
}
