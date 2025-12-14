import 'package:flutter/material.dart';

class WeekHeaderWidget extends StatelessWidget {
  final days = const ['D', 'L', 'M', 'X', 'J', 'V', 'S'];

  const WeekHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days
          .map(
            (d) => Expanded(
              child: Center(
                child: Text(
                  d,
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
