import 'package:flutter/material.dart';
import 'package:flutter_base/features/home_page/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
  debugLogDiagnostics: true,
);
