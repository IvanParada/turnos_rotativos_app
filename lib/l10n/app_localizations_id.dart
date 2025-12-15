// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Aplikasi Shift';

  @override
  String get welcome => 'Selamat datang';

  @override
  String get subtitle_step_1 => 'Kelola shift rotasi Anda dengan cara yang sederhana dan profesional.';

  @override
  String get select_pattern_shift_predefined => 'Pilih pola shift yang telah ditentukan';

  @override
  String get select_pattern_shift_custom => 'Masukkan pola shift secara manual';

  @override
  String get shift => 'Shift';

  @override
  String get work => 'Kerja';

  @override
  String get rest => 'Istirahat';

  @override
  String get next => 'Berikutnya';

  @override
  String get title_step_2 => 'Kapan siklus Anda dimulai?';

  @override
  String get subtitle_step_2 => 'Pilih hari pertama dari shift kerja Anda berikutnya.';

  @override
  String get first_day_text => 'Hari kerja pertama';

  @override
  String get pattern_selected => 'Pola yang dipilih';

  @override
  String get back => 'Kembali';

  @override
  String get select_date => 'Pilih tanggal';

  @override
  String get cancel => 'Batal';

  @override
  String get agree => 'Setuju';

  @override
  String get title_step_3 => 'Semua siap!';

  @override
  String get subtitle_step_3 => 'Tinjau konfigurasi Anda sebelum memulai.';

  @override
  String get pattern_shift => 'Pola shift';

  @override
  String get init_date => 'Tanggal mulai';

  @override
  String get good_morning => 'Selamat pagi';

  @override
  String get good_afternoon => 'Selamat siang';

  @override
  String get good_night => 'Selamat malam';

  @override
  String get next_work => 'Kerja berikutnya';

  @override
  String get next_rest => 'Istirahat berikutnya';

  @override
  String get tomorrow => 'Besok';

  @override
  String get days => 'hari';

  @override
  String get this_month => 'Bulan ini';

  @override
  String get worked => 'Hari kerja';

  @override
  String get rested => 'Hari istirahat';

  @override
  String get total => 'Total';

  @override
  String get balance_text => 'Keseimbangan kerja/istirahat';

  @override
  String get your_pattern => 'Pola Anda';

  @override
  String get days_work => 'Hari kerja';

  @override
  String get days_rest => 'Hari istirahat';

  @override
  String cycle_days(Object days) {
    return 'Siklus $days hari';
  }

  @override
  String get home => 'Beranda';

  @override
  String get calendar => 'Kalender';

  @override
  String get settings => 'Pengaturan';

  @override
  String get update_pattern_text => 'Perbarui pola shift';

  @override
  String get update_first_work_day => 'Perbarui hari kerja pertama';

  @override
  String get new_date_text => 'Pilih tanggal baru';

  @override
  String get save_text => 'Simpan perubahan';

  @override
  String get updated_success_title_dialog => 'Berhasil diperbarui!';

  @override
  String get updated_success_subtitle_dialog => 'Anda dapat memperbarui data kapan pun diperlukan.';

  @override
  String get today_work => 'Hari ini Anda beristirahat';

  @override
  String get today_rest => 'Hari ini Anda bekerja';

  @override
  String get today => 'Hari ini';

  @override
  String days_count(Object count) {
    return '$count hari';
  }

  @override
  String get pattern => 'Pola';
}
