part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Status? status;
  final int? workDays;
  final int? restDays;
  final DateTime? startDate;
  final ShiftDayType? todayType;
  final DateTime? nextWorkDay;
  final DateTime? nextRestDay;
  final int? monthlyWorkedDays;
  final int? monthlyRestDays;
  final int? monthlyTotalDays;
  final double? monthlyWorkPercentage;
  final DateTime? referenceMonth;

  final int? editingWorkDays;
  final int? editingRestDays;
  final DateTime? editingStartDate;
  final ShiftType? editingShiftType;
  final int? editingPredefinedIndex;

  final bool patternChanged;
  final bool firstWorkDayChanged;

  const HomeState({
    this.editingShiftType,
    this.editingPredefinedIndex,
    this.editingWorkDays,
    this.editingRestDays,
    this.editingStartDate,
    this.status,
    this.workDays,
    this.restDays,
    this.startDate,
    this.todayType,
    this.nextRestDay,
    this.nextWorkDay,
    this.monthlyRestDays,
    this.monthlyTotalDays,
    this.monthlyWorkPercentage,
    this.monthlyWorkedDays,
    this.referenceMonth,
    this.patternChanged = false,
    this.firstWorkDayChanged = false,
  });

  HomeState copyWith({
    Status? status,
    int? workDays,
    int? restDays,
    DateTime? startDate,
    ShiftDayType? todayType,
    DateTime? nextWorkDay,
    DateTime? nextRestDay,

    int? monthlyWorkedDays,
    int? monthlyRestDays,
    int? monthlyTotalDays,
    double? monthlyWorkPercentage,
    DateTime? referenceMonth,

    int? editingWorkDays,
    int? editingRestDays,
    DateTime? editingStartDate,
    ShiftType? editingShiftType,
    int? editingPredefinedIndex,
    bool? patternChanged,
    bool? firstWorkDayChanged,
  }) {
    return HomeState(
      status: status ?? this.status,
      workDays: workDays ?? this.workDays,
      restDays: restDays ?? this.restDays,
      startDate: startDate ?? this.startDate,
      todayType: todayType ?? this.todayType,
      nextWorkDay: nextWorkDay ?? this.nextWorkDay,
      nextRestDay: nextRestDay ?? this.nextRestDay,
      monthlyRestDays: monthlyRestDays ?? this.monthlyRestDays,
      monthlyTotalDays: monthlyTotalDays ?? this.monthlyTotalDays,
      monthlyWorkPercentage:
          monthlyWorkPercentage ?? this.monthlyWorkPercentage,
      monthlyWorkedDays: monthlyWorkedDays ?? this.monthlyWorkedDays,
      referenceMonth: referenceMonth ?? this.referenceMonth,
      editingRestDays: editingRestDays ?? this.editingRestDays,
      editingWorkDays: editingWorkDays ?? this.editingWorkDays,
      editingStartDate: editingStartDate ?? this.editingStartDate,
      editingPredefinedIndex:
          editingPredefinedIndex ?? this.editingPredefinedIndex,
      editingShiftType: editingShiftType ?? this.editingShiftType,
      patternChanged: patternChanged ?? this.patternChanged,
      firstWorkDayChanged: firstWorkDayChanged ?? this.firstWorkDayChanged,
    );
  }

  String get pattern =>
      workDays != null && restDays != null ? '${workDays}x$restDays' : '-';

  bool get hasShift =>
      workDays != null && restDays != null && startDate != null;

  bool get isEditing => editingShiftType != null;

  bool get isPredefinedEditing => editingShiftType == ShiftType.predefined;

  bool get isCustomEditing => editingShiftType == ShiftType.custom;

  bool get canSave => patternChanged || firstWorkDayChanged;

  @override
  List<Object?> get props => [
    status,
    workDays,
    restDays,
    startDate,
    todayType,
    nextRestDay,
    nextWorkDay,
    monthlyRestDays,
    monthlyTotalDays,
    monthlyWorkPercentage,
    monthlyWorkedDays,
    referenceMonth,
    editingRestDays,
    editingWorkDays,
    editingStartDate,
    editingPredefinedIndex,
    editingShiftType,
    patternChanged,
    firstWorkDayChanged,
  ];
}
