import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/core/utils/utils_widgets.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });

  final Function()? onTap;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
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
            SvgPicture.asset(icon, color: Colors.white),
            Hgap(15.0),
            Text(
              title,
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
