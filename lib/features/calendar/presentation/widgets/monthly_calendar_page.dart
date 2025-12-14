import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/utils/shift_helper.dart';
import 'package:turnos_rotativos/features/calendar/presentation/widgets/day_item_widget.dart';
import 'package:turnos_rotativos/features/calendar/presentation/widgets/week_header_widget.dart';

class MonthlyCalendarPage extends StatelessWidget {
  final DateTime referenceMonth;
  final DateTime startDate;
  final int workDays;
  final int restDays;

  const MonthlyCalendarPage({
    super.key,
    required this.referenceMonth,
    required this.startDate,
    required this.workDays,
    required this.restDays,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(
      referenceMonth.year,
      referenceMonth.month,
    );

    final firstDayOfMonth = DateTime(
      referenceMonth.year,
      referenceMonth.month,
      1,
    );

    final firstWeekday = firstDayOfMonth.weekday % 7;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.05)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WeekHeaderWidget(),
          GridView.builder(
            padding: EdgeInsets.only(top: size.height * .02),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: daysInMonth + firstWeekday,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 1,
            ),
            itemBuilder: (_, index) {
              if (index < firstWeekday) {
                return const SizedBox();
              }

              final day = index - firstWeekday + 1;
              final date = DateTime(
                referenceMonth.year,
                referenceMonth.month,
                day,
              );

              final type = getShiftDayType(
                startDate: startDate,
                workDays: workDays,
                restDays: restDays,
                targetDate: date,
              );

              final isToday = DateUtils.isSameDay(date, DateTime.now());

              return DayItem(day: day, type: type, isToday: isToday);
            },
          ),
        ],
      ),
    );
  }
}
