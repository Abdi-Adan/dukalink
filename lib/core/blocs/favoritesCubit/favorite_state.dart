import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../data/model/favoriteFoodModel.dart';
import '../../data/model/favoriteRestaurantModel.dart';
import '../../data/model/newFavoriteFoodModel.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.init() = InitFavoriteState;
  const factory FavoriteState.loading() = LoadingFavoriteState;
  const factory FavoriteState.error(String message) = ErrorFavoriteState;
  const factory FavoriteState.checkFavorite(bool status) = CheckFavoriteState;
  const factory FavoriteState.restaurantSuccess(
          FavoriteRestaurantModel? favoriteRestaurant) =
      RestaurantLoadedFavoriteState;
  const factory FavoriteState.foodSuccess(List<FavoriteFood> favoriteFood) =
      FoodLoadedFavoriteState;
}
