import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turnos_rotativos/core/enums/status_enum.dart';
import 'package:turnos_rotativos/features/home_page/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepository})
      : super(const HomeState());

  HomeRepository homeRepository;

}