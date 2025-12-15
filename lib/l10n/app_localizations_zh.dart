// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '轮班应用';

  @override
  String get welcome => '欢迎';

  @override
  String get subtitle_step_1 => '以简单而专业的方式管理您的轮班。';

  @override
  String get select_pattern_shift_predefined => '选择预设的轮班模式';

  @override
  String get select_pattern_shift_custom => '手动输入轮班模式';

  @override
  String get shift => '班次';

  @override
  String get work => '工作';

  @override
  String get rest => '休息';

  @override
  String get next => '下一步';

  @override
  String get title_step_2 => '您的周期何时开始？';

  @override
  String get subtitle_step_2 => '选择您下一个工作班次的第一天。';

  @override
  String get first_day_text => '第一个工作日';

  @override
  String get pattern_selected => '已选择的模式';

  @override
  String get back => '返回';

  @override
  String get select_date => '选择日期';

  @override
  String get cancel => '取消';

  @override
  String get agree => '确认';

  @override
  String get title_step_3 => '一切就绪！';

  @override
  String get subtitle_step_3 => '开始前请检查您的设置。';

  @override
  String get pattern_shift => '轮班模式';

  @override
  String get init_date => '开始日期';

  @override
  String get good_morning => '早上好';

  @override
  String get good_afternoon => '下午好';

  @override
  String get good_night => '晚上好';

  @override
  String get next_work => '下一个工作日';

  @override
  String get next_rest => '下一个休息日';

  @override
  String get tomorrow => '明天';

  @override
  String get days => '天';

  @override
  String get this_month => '本月';

  @override
  String get worked => '已工作';

  @override
  String get rested => '已休息';

  @override
  String get total => '总计';

  @override
  String get balance_text => '工作 / 休息平衡';

  @override
  String get your_pattern => '您的模式';

  @override
  String get days_work => '工作日';

  @override
  String get days_rest => '休息日';

  @override
  String cycle_days(Object days) {
    return '$days 天的周期';
  }

  @override
  String get home => '首页';

  @override
  String get calendar => '日历';

  @override
  String get settings => '设置';

  @override
  String get update_pattern_text => '更新轮班模式';

  @override
  String get update_first_work_day => '更新第一个工作日';

  @override
  String get new_date_text => '选择新日期';

  @override
  String get save_text => '保存更改';

  @override
  String get updated_success_title_dialog => '更新成功！';

  @override
  String get updated_success_subtitle_dialog => '您可以在需要时更新您的数据。';

  @override
  String get today_work => '今天休息';

  @override
  String get today_rest => '今天工作';

  @override
  String get today => '今天';

  @override
  String days_count(Object count) {
    return '$count 天';
  }

  @override
  String get pattern => '模式';
}
