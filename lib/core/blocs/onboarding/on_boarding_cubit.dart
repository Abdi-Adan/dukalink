import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
