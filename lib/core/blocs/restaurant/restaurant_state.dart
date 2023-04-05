// import 'package:dukalink_app/core/data/model/dishes_model.dart';
// import 'package:dukalink_app/core/data/model/restaurant_detail.dart';
import 'package:dukalink_app/core/data/model/restaurant_model.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/favoriteRestaurantModel.dart';
import '../../data/model/menu_model.dart';
import '../../data/model/new_restaurant_detail.dart';
// import '../../data/model/restaurant_model.dart';
// import '../../data/model/restaurant_model.dart';

part 'restaurant_state.freezed.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState.init() = InitRestaurantState;
  const factory RestaurantState.loading() = LoadingRestaurantState;
  const factory RestaurantState.error(String message) = ErrorRestaurantState;
  const factory RestaurantState.success(List<RestaurantData>? restaurant,
      NewRestaurantDetail? restaurantData) = LoadedRestaurantState;
  // const factory RestaurantState.search(List<Restaurant>? restaurant) =
  //     LoadedSearchRestaurantState;
  // const factory RestaurantState.menuSearch(
  //         List<Menu>? menuResults, NewRestaurantDetail restaurantData) =
  //     LoadedMenuSearchRestaurantState;
  // const factory RestaurantState.hasRestaurant(bool hasCustomRestaurant) =
  //     HasRestaurantState;restaurantData
}
