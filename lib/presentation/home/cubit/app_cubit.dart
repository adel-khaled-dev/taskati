import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taskati/presentation/home/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(Appstart());

  void add() {
    emit(AppUpdit());
  }

  void restart() {
    emit(Appstart());
  }
}
