part of 'first_step_cubit.dart';

class FirstStepState {
  final ShiftType shiftType;
  final int? selectedPredefinedIndex;
  final int? workDays;
  final int? restDays;
  final DateTime? startDate;

  const FirstStepState({
    required this.shiftType,
    this.selectedPredefinedIndex,
    this.workDays,
    this.restDays,
    this.startDate,
  });

  bool get isPredefined => shiftType == ShiftType.predefined;

  String get selectedPattern {
    if (workDays != null && restDays != null) {
      return '${workDays}x$restDays';
    }
    return '-';
  }

  bool get isFirstStepValid {
    if (isPredefined) {
      return selectedPredefinedIndex != null;
    }
    return workDays != null && restDays != null;
  }

  bool get isSecondStepValid => startDate != null;

  bool get isValid => isFirstStepValid && isSecondStepValid;

  FirstStepState copyWith({
    ShiftType? shiftType,
    int? selectedPredefinedIndex,
    int? workDays,
    int? restDays,
    DateTime? startDate,
  }) {
    return FirstStepState(
      shiftType: shiftType ?? this.shiftType,
      selectedPredefinedIndex:
          selectedPredefinedIndex ?? this.selectedPredefinedIndex,
      workDays: workDays ?? this.workDays,
      restDays: restDays ?? this.restDays,
      startDate: startDate ?? this.startDate,
    );
  }
}
