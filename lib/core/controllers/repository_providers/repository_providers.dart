import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:turnos_rotativos/core/services/analytics_service.dart';
import 'package:turnos_rotativos/core/storage/shift_storage.dart';
import 'package:turnos_rotativos/features/home/data/datasource/home_datasource.dart';
import 'package:turnos_rotativos/features/home/data/repository/home_repository.dart';

class RepositoryProviders extends StatelessWidget {
  const RepositoryProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final providers = <SingleChildWidget>[
      RepositoryProvider<FirebaseAnalytics>(
        create: (_) => FirebaseAnalytics.instance,
      ),
      RepositoryProvider<AnalyticsService>(
        create: (context) => AnalyticsService(
          context.read<FirebaseAnalytics>(),
        ),
      ),
      RepositoryProvider<ShiftStorage>(
        create: (_) => ShiftStorage(),
      ),
      RepositoryProvider<HomeDatasource>(
        create: (context) => HomeDatasource(
          shiftStorage: context.read<ShiftStorage>(),
        ),
      ),
      RepositoryProvider<HomeRepository>(
        create: (context) => HomeRepository(
          homeDatasource: context.read<HomeDatasource>(),
        ),
      ),
    ];

    return MultiRepositoryProvider(
      providers: providers,
      child: child,
    );
  }
}
