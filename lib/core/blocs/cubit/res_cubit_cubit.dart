import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/api_error_res.dart';
import '../../data/model/favoriteRestaurantModel.dart';
import '../../data/model/restaurant_model.dart';
import '../../data/repository/restaurant_repository.dart';
import '../../di/injector.dart';

part 'res_cubit_event.dart';
part 'res_cubit_state.dart';

class ResBloc extends Bloc<ResEvent, ResState> {
  ResBloc() : super(ResInitial()) {
    on<Res>((event, emit) async {
      emit(ResLoading());

      try {
        final Either<ApiErrorRes, RestaurantModel> eitherResponse =
            await inject<RestaurantRepository>().topRestaurants();

        emit(
          eitherResponse.fold(
            (l) {
              return ResError(
                  error: l.message ??
                      l.detail ??
                      'Unable to fetch top restaurants at the moment. Try later');
            },
            (r) {
              return ResSuccess(r.data);
            },
          ),
        );
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
