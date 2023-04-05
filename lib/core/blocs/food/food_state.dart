import 'package:dukalink_app/core/data/model/newFavoriteFoodModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../data/model/newFavoriteFoodModel.dart';

part 'food_state.freezed.dart';

@freezed
class FoodState with _$FoodState {
  const factory FoodState.init() = InitFoodState;
  const factory FoodState.loading() = LoadingFoodState;
  const factory FoodState.error(String message) = ErrorFoodState;
  const factory FoodState.success(List<FavoriteFood>? foodList) =
      LoadedFoodState;
  const factory FoodState.search(List<FavoriteFood>? searchResult) =
      LoadedSearchFoodState;
  // const factory RestaurantState.hasRestaurant(bool hasCustomRestaurant) =
  //     HasRestaurantState;restaurantData
}
