import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/enums/shift_enum.dart';

class DayItem extends StatelessWidget {
  final int day;
  final ShiftDayType type;
  final bool isToday;

  const DayItem({super.key, 
    required this.day,
    required this.type,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        type == ShiftDayType.work ? Colors.orange : Colors.green;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: isToday
            ? Border.all(color: Colors.black, width: 2)
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        '$day',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
