import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics;

  AnalyticsService(this._analytics);

  Future<void> logEvent(String name, {Map<String, Object>? params}) async {
    await _analytics.logEvent(name: name, parameters: params);
  }

  Future<void> logScreen(String screenName) async {
    await _analytics.logScreenView(screenName: screenName);
  }

  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}
