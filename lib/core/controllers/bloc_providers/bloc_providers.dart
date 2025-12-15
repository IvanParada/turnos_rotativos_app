import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/storage/shift_storage.dart';
import 'package:turnos_rotativos/features/home/data/repository/home_repository.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/first_step_cubit.dart';
import 'package:turnos_rotativos/features/onboarding/presentation/cubit/onboarding/onboarding_cubit.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(homeRepository: context.read<HomeRepository>())
                ..loadShift()
                ..startEditing(),
        ),

        BlocProvider(
          create: (context) =>
              FirstStepCubit(context.read<ShiftStorage>())..restoreShift(),
        ),
        BlocProvider(create: (_) => OnboardingCubit()..checkIfCompleted()),
      ],
      child: child,
    );
  }
}
