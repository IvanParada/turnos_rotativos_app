import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turnos_rotativos/core/storage/onboarding_storage.dart';
import 'package:turnos_rotativos/features/home/presentation/pages/home_page.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:turnos_rotativos/navbar_main.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,

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
    GoRoute(path: '/', builder: (context, state) => MainNavPage()),

    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
