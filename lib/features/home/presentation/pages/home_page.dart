import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/home/presentation/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Turnos Rotativos'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: size.width * .8,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.accent,
              ),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (!state.hasShift) {
                    return const Text('No hay turnos configurados');
                  }

                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tu configuración de turnos',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Patrón: ${state.pattern}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Inicio: ${_formatDate(state.startDate!)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


String _formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/'
      '${date.year}';
}
