import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekHeaderWidget extends StatelessWidget {
  const WeekHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();

    final weekDays = List.generate(7, (index) {
      final date = DateTime(2024, 1, 7 + index);
      return DateFormat.E(locale).format(date);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekDays
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(
                  day.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
