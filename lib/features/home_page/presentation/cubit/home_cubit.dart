import 'package:bloc/bloc.dart';
import 'package:flutter_base/core/enums/status_enum.dart';
import 'package:flutter_base/features/home_page/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepository})
      : super(const HomeState());

  HomeRepository homeRepository;

}