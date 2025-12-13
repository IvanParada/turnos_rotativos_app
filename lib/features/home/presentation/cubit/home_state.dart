part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Status? status;
  final int? workDays;
  final int? restDays;
  final DateTime? startDate;

  const HomeState({this.status, this.workDays, this.restDays, this.startDate});

  String get pattern =>
      workDays != null && restDays != null ? '${workDays}x$restDays' : '-';

  bool get hasShift =>
      workDays != null && restDays != null && startDate != null;

  @override
  List<Object?> get props => [status, workDays, restDays, startDate];
}
