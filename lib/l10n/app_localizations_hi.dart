// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'शिफ्ट ऐप';

  @override
  String get welcome => 'स्वागत है';

  @override
  String get subtitle_step_1 => 'अपने रोटेटिंग शिफ्ट्स को सरल और पेशेवर तरीके से प्रबंधित करें।';

  @override
  String get select_pattern_shift_predefined => 'पूर्वनिर्धारित शिफ्ट पैटर्न चुनें';

  @override
  String get select_pattern_shift_custom => 'शिफ्ट पैटर्न मैन्युअल रूप से दर्ज करें';

  @override
  String get shift => 'शिफ्ट';

  @override
  String get work => 'काम';

  @override
  String get rest => 'विश्राम';

  @override
  String get next => 'आगे';

  @override
  String get title_step_2 => 'आपका चक्र कब शुरू होता है?';

  @override
  String get subtitle_step_2 => 'अपने अगले कार्य शिफ्ट का पहला दिन चुनें।';

  @override
  String get first_day_text => 'पहला कार्य दिवस';

  @override
  String get pattern_selected => 'चयनित पैटर्न';

  @override
  String get back => 'पीछे';

  @override
  String get select_date => 'तारीख चुनें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get agree => 'स्वीकार करें';

  @override
  String get title_step_3 => 'सब तैयार!';

  @override
  String get subtitle_step_3 => 'शुरू करने से पहले अपनी सेटिंग्स जांचें।';

  @override
  String get pattern_shift => 'शिफ्ट पैटर्न';

  @override
  String get init_date => 'आरंभ तिथि';

  @override
  String get good_morning => 'सुप्रभात';

  @override
  String get good_afternoon => 'नमस्कार';

  @override
  String get good_night => 'शुभ संध्या';

  @override
  String get next_work => 'अगला कार्य';

  @override
  String get next_rest => 'अगला विश्राम';

  @override
  String get tomorrow => 'कल';

  @override
  String get days => 'दिन';

  @override
  String get this_month => 'इस माह';

  @override
  String get worked => 'कार्य दिवस';

  @override
  String get rested => 'विश्राम दिवस';

  @override
  String get total => 'कुल';

  @override
  String get balance_text => 'कार्य / विश्राम संतुलन';

  @override
  String get your_pattern => 'आपका पैटर्न';

  @override
  String get days_work => 'कार्य दिवस';

  @override
  String get days_rest => 'विश्राम दिवस';

  @override
  String cycle_days(Object days) {
    return '$days दिनों का चक्र';
  }

  @override
  String get home => 'होम';

  @override
  String get calendar => 'कैलेंडर';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get update_pattern_text => 'शिफ्ट पैटर्न अपडेट करें';

  @override
  String get update_first_work_day => 'पहला कार्य दिवस अपडेट करें';

  @override
  String get new_date_text => 'नई तारीख चुनें';

  @override
  String get save_text => 'परिवर्तन सहेजें';

  @override
  String get updated_success_title_dialog => 'सफलतापूर्वक अपडेट किया गया!';

  @override
  String get updated_success_subtitle_dialog => 'आप आवश्यक होने पर अपने डेटा को अपडेट कर सकते हैं।';

  @override
  String get today_work => 'आज आप विश्राम करते हैं';

  @override
  String get today_rest => 'आज आप काम करते हैं';

  @override
  String get today => 'आज';

  @override
  String days_count(Object count) {
    return '$count दिन';
  }

  @override
  String get pattern => 'पैटर्न';
}
