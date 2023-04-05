import 'package:dukalink_app/core/blocs/favoritesCubit/favorite_state.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/restaurant_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/dishes_model.dart';
import '../../data/model/favoriteRestaurantModel.dart';
import '../../data/model/newFavoriteFoodModel.dart';
import '../../data/repository/restaurant_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final RestaurantRepository restaurantRepository;
  final SharedHelper sharedHelper;

  FavoriteCubit({
    required this.restaurantRepository,
    required this.sharedHelper,
  }) : super(const FavoriteState.init());

  void checkUserFavoritesFood(FavoriteFood food) async {
    emit(const FavoriteState.loading());
    final user = await sharedHelper.getUsersData();
    final favorite =
        await sharedHelper.getFavoriteFoodData(food.foodCode.toString());
    final userId = user?.id;
    if (userId != null || userId != "" && favorite != null) {
      if (userId == "${favorite?.favoriteUserId}" &&
          '${food.foodCode}' == "${favorite?.foodCode}") {
        emit(const FavoriteState.checkFavorite(true));
      } else {
        emit(const FavoriteState.checkFavorite(false));
      }
    } else {
      emit(const FavoriteState.checkFavorite(false));
    }
  }

  void checkUserFavoritesRestaurant(RestaurantData restaurant) async {
    emit(const FavoriteState.loading());
    final user = await sharedHelper.getUsersData();
    final favorite = await sharedHelper
        .getFavoriteRestaurantData(restaurant.restaurantCode.toString());
    final userId = user?.id;
    if (userId != null || userId != "" && favorite != null) {
      if (userId == "${favorite?.favoriteUserId}" &&
          '${restaurant.restaurantCode}' ==
              "${favorite?.restaurant.restaurantCode}") {
        emit(const FavoriteState.checkFavorite(true));
      } else {
        emit(const FavoriteState.checkFavorite(false));
      }
    } else {
      emit(const FavoriteState.checkFavorite(false));
    }
  }

  void addFavoriteFood({required String foodCode}) async {
    try {
      emit(const FavoriteState.loading());

      final eitherResponse =
          await restaurantRepository.addFavoriteFood(foodCode: foodCode);

      emit(
        eitherResponse.fold(
          (l) {
            return FavoriteState.error(l.message ??
                l.detail ??
                'Unable to get favorite food. Try later');
          },
          (r) {
            return FavoriteState.checkFavorite(
              r,
            );
          },
        ),
      );
    } catch (e) {
      emit(FavoriteState.error(e.toString()));
    }
  }

  void getFavoriteFood() async {
    try {
      emit(const FavoriteState.loading());

      final eitherResponse = await restaurantRepository.favoriteFood();

      emit(
        eitherResponse.fold(
          (l) {
            return FavoriteState.error(l.message ??
                l.detail ??
                'Unable to get favorite food. We are currently working on that. Sorry');
          },
          (r) {
            return FavoriteState.foodSuccess(
              r,
            );
          },
        ),
      );
    } catch (e) {
      emit(FavoriteState.error(e.toString()));
    }
  }

  void addFavoriteRestaurant({required String restaurantCode}) async {
    try {
      emit(const FavoriteState.loading());

      final eitherResponse = await restaurantRepository.addFavoriteRestaurant(
          restaurantCode: restaurantCode);

      emit(
        eitherResponse.fold(
          (l) {
            return FavoriteState.error(l.message ??
                l.detail ??
                'Unable to get favorite food. Try later');
          },
          (r) {
            return FavoriteState.checkFavorite(
              r,
            );
          },
        ),
      );
    } catch (e) {
      emit(FavoriteState.error(e.toString()));
    }
  }

  void getFavoriteRestaurant() async {
    try {
      emit(const FavoriteState.loading());

      final eitherResponse = await restaurantRepository.favoriteRestaurants();

      emit(
        eitherResponse.fold(
          (l) {
            return FavoriteState.error(l.message ??
                l.detail ??
                'Unable to get favorite restaurant. Try later');
          },
          (r) {
            return FavoriteState.restaurantSuccess(r);
          },
        ),
      );
    } catch (e) {
      emit(FavoriteState.error(e.toString()));
    }
  }
}
