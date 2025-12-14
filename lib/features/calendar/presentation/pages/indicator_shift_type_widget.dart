import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';

class IndicatorShiftTypeWidget extends StatelessWidget {
  const IndicatorShiftTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.textTertiary.withOpacity(.2),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              Text('Trabajo'),
            ],
          ),

          Row(
            spacing: 10,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              Text('Descanso'),
            ],
          ),
        ],
      ),
    );
  }
}
