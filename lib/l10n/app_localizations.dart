import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('hi'),
    Locale('id'),
    Locale('pt'),
    Locale('zh')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'App de Turnos'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @subtitle_step_1.
  ///
  /// In en, this message translates to:
  /// **'Manage your rotating shifts in a simple and professional way.'**
  String get subtitle_step_1;

  /// No description provided for @select_pattern_shift_predefined.
  ///
  /// In en, this message translates to:
  /// **'Select a predefined shift pattern'**
  String get select_pattern_shift_predefined;

  /// No description provided for @select_pattern_shift_custom.
  ///
  /// In en, this message translates to:
  /// **'Enter shift pattern manually'**
  String get select_pattern_shift_custom;

  /// No description provided for @shift.
  ///
  /// In en, this message translates to:
  /// **'Shift'**
  String get shift;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @rest.
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get rest;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @title_step_2.
  ///
  /// In en, this message translates to:
  /// **'When does your cycle start?'**
  String get title_step_2;

  /// No description provided for @subtitle_step_2.
  ///
  /// In en, this message translates to:
  /// **'Select the first day of your next work shift.'**
  String get subtitle_step_2;

  /// No description provided for @first_day_text.
  ///
  /// In en, this message translates to:
  /// **'First work day'**
  String get first_day_text;

  /// No description provided for @pattern_selected.
  ///
  /// In en, this message translates to:
  /// **'Selected pattern'**
  String get pattern_selected;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @select_date.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get select_date;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @agree.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get agree;

  /// No description provided for @title_step_3.
  ///
  /// In en, this message translates to:
  /// **'All set!'**
  String get title_step_3;

  /// No description provided for @subtitle_step_3.
  ///
  /// In en, this message translates to:
  /// **'Review your configuration before starting.'**
  String get subtitle_step_3;

  /// No description provided for @pattern_shift.
  ///
  /// In en, this message translates to:
  /// **'Shift pattern'**
  String get pattern_shift;

  /// No description provided for @init_date.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get init_date;

  /// No description provided for @good_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get good_morning;

  /// No description provided for @good_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get good_afternoon;

  /// No description provided for @good_night.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get good_night;

  /// No description provided for @next_work.
  ///
  /// In en, this message translates to:
  /// **'Next work'**
  String get next_work;

  /// No description provided for @next_rest.
  ///
  /// In en, this message translates to:
  /// **'Next rest'**
  String get next_rest;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @this_month.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get this_month;

  /// No description provided for @worked.
  ///
  /// In en, this message translates to:
  /// **'Worked'**
  String get worked;

  /// No description provided for @rested.
  ///
  /// In en, this message translates to:
  /// **'Rested'**
  String get rested;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @balance_text.
  ///
  /// In en, this message translates to:
  /// **'Work / rest balance'**
  String get balance_text;

  /// No description provided for @your_pattern.
  ///
  /// In en, this message translates to:
  /// **'Your pattern'**
  String get your_pattern;

  /// No description provided for @days_work.
  ///
  /// In en, this message translates to:
  /// **'Work days'**
  String get days_work;

  /// No description provided for @days_rest.
  ///
  /// In en, this message translates to:
  /// **'Rest days'**
  String get days_rest;

  /// No description provided for @cycle_days.
  ///
  /// In en, this message translates to:
  /// **'Cycle of {days} days'**
  String cycle_days(Object days);

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @update_pattern_text.
  ///
  /// In en, this message translates to:
  /// **'Update shift pattern'**
  String get update_pattern_text;

  /// No description provided for @update_first_work_day.
  ///
  /// In en, this message translates to:
  /// **'Update first work day'**
  String get update_first_work_day;

  /// No description provided for @new_date_text.
  ///
  /// In en, this message translates to:
  /// **'Select new date'**
  String get new_date_text;

  /// No description provided for @save_text.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get save_text;

  /// No description provided for @updated_success_title_dialog.
  ///
  /// In en, this message translates to:
  /// **'Updated successfully!'**
  String get updated_success_title_dialog;

  /// No description provided for @updated_success_subtitle_dialog.
  ///
  /// In en, this message translates to:
  /// **'You can update your data whenever necessary.'**
  String get updated_success_subtitle_dialog;

  /// No description provided for @today_work.
  ///
  /// In en, this message translates to:
  /// **'Today you work'**
  String get today_work;

  /// No description provided for @today_rest.
  ///
  /// In en, this message translates to:
  /// **'Today you rest'**
  String get today_rest;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @days_count.
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String days_count(Object count);

  /// No description provided for @pattern.
  ///
  /// In en, this message translates to:
  /// **'Pattern'**
  String get pattern;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'hi', 'id', 'pt', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'hi': return AppLocalizationsHi();
    case 'id': return AppLocalizationsId();
    case 'pt': return AppLocalizationsPt();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
