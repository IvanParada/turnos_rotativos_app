import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turnos_rotativos/core/storage/onboarding_storage.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:turnos_rotativos/navbar_main.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  
  redirect: (context, state) {
    final completed = OnboardingStorage.completed;
    final isOnboarding = state.matchedLocation == '/onboarding';

    if (!completed && !isOnboarding) {
      return '/onboarding';
    }

    if (completed && isOnboarding) {
      return '/';
    }

    return null;
  },

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MainNavPage();
      },
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
