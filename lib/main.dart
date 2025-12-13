import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:turnos_rotativos/app/view/app.dart';
import 'package:turnos_rotativos/core/controllers/bloc_providers/bloc_observer.dart';
import 'package:turnos_rotativos/core/storage/onboarding_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('es', null);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await OnboardingStorage.init();

  Bloc.observer = const AppBlocObserver();
  runApp(const App());
}
