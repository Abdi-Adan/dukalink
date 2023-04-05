import 'package:dukalink_app/core/data/repository/restaurant_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/newFavoriteFoodModel.dart';
import 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final RestaurantRepository restaurantRepository;

  FoodCubit({required this.restaurantRepository})
      : super(const FoodState.init());

  void dishSearch(String query,
      {required List<FavoriteFood> dishSearchObject}) async {
    emit(const FoodState.loading());
    List<FavoriteFood> searchResults = [];
    for (int i = 0; i < dishSearchObject.length; i++) {
      if (dishSearchObject[i].foodName != null) {
        if (dishSearchObject[i]
            .foodName!
            .toLowerCase()
            .contains(query.toLowerCase().trim())) {
          searchResults.add(dishSearchObject[i]);
        }
      }
    }
    Fimber.d("QUERY check $query");
    if (query != '') {
      emit(FoodState.search(searchResults));
    } else {
      topDishes();
    }
  }

  void topDishes() async {
    Fimber.d('GEt food fired');
    try {
      emit(const FoodState.loading());

      final eitherResponse = await restaurantRepository.topDishes();

      emit(
        eitherResponse.fold(
          (l) {
            return FoodState.error(l.message ??
                l.detail ??
                'Unable to fetch top dishes at the moment. Try later');
          },
          (r) {
            return FoodState.success(r);
          },
        ),
      );
    } catch (e) {
      emit(FoodState.error(e.toString()));
    }
  }

  void dishPerMenu(
      {required String menuCode, required String restaurantCode}) async {
    try {
      emit(const FoodState.loading());

      final eitherResponse = await restaurantRepository.dishPerMenu(
          menuCode: menuCode, restaurantCode: restaurantCode);

      emit(
        eitherResponse.fold(
          (l) {
            return FoodState.error(l.message ??
                l.detail ??
                'Unable to fetch top dishes at the moment. Try later');
          },
          (r) {
            return FoodState.success(r.data);
          },
        ),
      );
    } catch (e) {
      emit(FoodState.error(e.toString()));
    }
  }

  void dishPerRestaurant({required String restaurantCode}) async {
    try {
      emit(const FoodState.loading());

      final eitherResponse =
          await restaurantRepository.dishPerRestaurant(restaurantCode);

      emit(
        eitherResponse.fold(
          (l) {
            return FoodState.error(l.message ??
                l.detail ??
                'Unable to fetch top dishes at the moment. Try later');
          },
          (r) {
            return FoodState.success(r.data);
          },
        ),
      );
    } catch (e) {
      emit(FoodState.error(e.toString()));
    }
  }
}
