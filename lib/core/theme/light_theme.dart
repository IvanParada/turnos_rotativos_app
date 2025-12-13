import 'package:flutter/material.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Inter',
  primaryColor: AppColors.textPrimary,
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.white,
  datePickerTheme: DatePickerThemeData(
    backgroundColor: Colors.white,
    dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.textSecondary;
      }
      if (states.contains(WidgetState.focused)) {
        return AppColors.textSecondary;
      }
      return null;
    }),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.textSecondary,
    strokeWidth: 2,
  ),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36,
          color: AppColors.accentSoft,
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
        color: AppColors.textPrimary,
      ),
      displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 16.94 / 14,
          color: AppColors.textPrimary),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: 16.5 / 11,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 14.52 / 12,
          color: AppColors.textPrimary),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 19.54 / 16,
          color: AppColors.textPrimary),
      titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 21.78 / 18,
          color: AppColors.textPrimary),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.textSecondary,
      )),
);