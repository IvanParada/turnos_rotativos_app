import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';

class ExportCalendarWidget extends StatelessWidget {
  const ExportCalendarWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('EXPORTAR A GOOGLE CALENDAR');
      },
      child: Container(
        width: size.width * 0.8,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.download, color: Colors.white),
            Hgap(15.0),
            Text(
              'Exportar a Google Calendar',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
