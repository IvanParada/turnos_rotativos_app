import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turnos_rotativos/features/home_page/presentation/pages/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
  debugLogDiagnostics: true,
);
