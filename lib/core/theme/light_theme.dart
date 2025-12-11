import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Inter',
  primaryColor: AppColors.primary,
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColors.white,
    dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.secondary;
      }
      if (states.contains(WidgetState.focused)) {
        return AppColors.secondary;
      }
      return null;
    }),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.secondary,
    strokeWidth: 2,
  ),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36,
          color: AppColors.white,
          height: 43.57 / 36),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 40,
        height: 60 / 40,
        color: Color(0xff212529),
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 21 / 14,
        color: AppColors.black,
      ),
      displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 16.94 / 14,
          color: AppColors.mediumGray),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: 16.5 / 11,
        color: Color(0xff0D6EFD),
      ),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 14.52 / 12,
          color: AppColors.black),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 19.54 / 16,
          color: AppColors.white),
      titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 21.78 / 18,
          color: AppColors.black),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.textSecondary,
      )),
);