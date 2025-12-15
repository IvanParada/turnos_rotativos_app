// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'App de Turnos';

  @override
  String get welcome => 'Welcome';

  @override
  String get subtitle_step_1 => 'Manage your rotating shifts in a simple and professional way.';

  @override
  String get select_pattern_shift_predefined => 'Select a predefined shift pattern';

  @override
  String get select_pattern_shift_custom => 'Enter shift pattern manually';

  @override
  String get shift => 'Shift';

  @override
  String get work => 'Work';

  @override
  String get rest => 'Rest';

  @override
  String get next => 'Next';

  @override
  String get title_step_2 => 'When does your cycle start?';

  @override
  String get subtitle_step_2 => 'Select the first day of your next work shift.';

  @override
  String get first_day_text => 'First work day';

  @override
  String get pattern_selected => 'Selected pattern';

  @override
  String get back => 'Back';

  @override
  String get select_date => 'Select date';

  @override
  String get cancel => 'Cancel';

  @override
  String get agree => 'Accept';

  @override
  String get title_step_3 => 'All set!';

  @override
  String get subtitle_step_3 => 'Review your configuration before starting.';

  @override
  String get pattern_shift => 'Shift pattern';

  @override
  String get init_date => 'Start date';

  @override
  String get good_morning => 'Good morning';

  @override
  String get good_afternoon => 'Good afternoon';

  @override
  String get good_night => 'Good evening';

  @override
  String get next_work => 'Next work';

  @override
  String get next_rest => 'Next rest';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get days => 'days';

  @override
  String get this_month => 'This month';

  @override
  String get worked => 'Worked';

  @override
  String get rested => 'Rested';

  @override
  String get total => 'Total';

  @override
  String get balance_text => 'Work / rest balance';

  @override
  String get your_pattern => 'Your pattern';

  @override
  String get days_work => 'Work days';

  @override
  String get days_rest => 'Rest days';

  @override
  String cycle_days(Object days) {
    return 'Cycle of $days days';
  }

  @override
  String get home => 'Home';

  @override
  String get calendar => 'Calendar';

  @override
  String get settings => 'Settings';

  @override
  String get update_pattern_text => 'Update shift pattern';

  @override
  String get update_first_work_day => 'Update first work day';

  @override
  String get new_date_text => 'Select new date';

  @override
  String get save_text => 'Save changes';

  @override
  String get updated_success_title_dialog => 'Updated successfully!';

  @override
  String get updated_success_subtitle_dialog => 'You can update your data whenever necessary.';

  @override
  String get today_work => 'Today you rest';

  @override
  String get today_rest => 'Today you work';

  @override
  String get today => 'Today';

  @override
  String days_count(Object count) {
    return '$count days';
  }

  @override
  String get pattern => 'Pattern';
}
