part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    
  });

  final Status status;

  @override
  List<Object?> get props => [
        status,
      ];

  HomeState copyWith({
    Status? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}