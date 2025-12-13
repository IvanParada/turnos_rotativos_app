import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStorage {
  static const _key = 'onboarding_completed';
  static bool completed = false;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    completed = prefs.getBool(_key) ?? false;
  }

  static Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
    completed = true;
  }
}
