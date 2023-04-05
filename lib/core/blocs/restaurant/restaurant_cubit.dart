import 'package:dukalink_app/core/blocs/restaurant/restaurant_state.dart';
import 'package:dukalink_app/core/data/model/api_error_res.dart';
import 'package:dukalink_app/core/data/model/restaurant_model.dart';
import 'package:dukalink_app/core/data/repository/restaurant_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/dishes_model.dart';
import '../../data/model/menu_model.dart';
import '../../data/model/restaurant_detail.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final RestaurantRepository restaurantRepository;

  RestaurantCubit({required this.restaurantRepository})
      : super(const RestaurantState.init());

  // TODO for Restaurant search Uncomment

  // void restaurantSearch(String query,
  //     {required List<Restaurant> restaurantSearchObject}) async {
  //   emit(const RestaurantState.loading());
  //   List<Restaurant> searchResults = [];
  //   for (int i = 0; i < restaurantSearchObject.length; i++) {
  //     if (restaurantSearchObject[i].branchName != null) {
  //       if (restaurantSearchObject[i]
  //           .branchName
  //           .toLowerCase()
  //           .contains(query.toLowerCase().trim())) {
  //         searchResults.add(restaurantSearchObject[i]);
  //       }
  //     }
  //   }
  //   Fimber.d("QUERY check $query");
  //   if (query != '') {
  //     emit(RestaurantState.search(searchResults));
  //   } else {
  //     allRestaurant();
  //   }
  // }

  // TODO for menu search Uncomment

  // void menuSearch(String query,
  //     {required RestaurantDetail menuSearchObject,
  //     required restaurantCode}) async {
  //   emit(const RestaurantState.loading());
  //   List<MenuCategory> menuSearchResults = [];
  //   List<Food> foodSearchResults = [];
  //   List<MenuCategory> menuObjects = menuSearchObject.data?.menu ?? [];
  //   List<Food> foodObjects = menuSearchObject.data?.food ?? [];
  //   for (int i = 0; i < menuObjects.length; i++) {
  //     if (menuObjects[i].sectionName != null) {
  //       if (menuObjects[i]
  //           .sectionName
  //           .toLowerCase()
  //           .contains(query.toLowerCase().trim())) {
  //         menuSearchResults.add(menuObjects[i]);
  //       }
  //     }
  //   }
  //   for (int i = 0; i < foodObjects.length; i++) {
  //     if (foodObjects[i].menuCategory?.sectionName != null) {
  //       if (foodObjects[i]
  //           .menuCategory!
  //           .sectionName!
  //           .toLowerCase()
  //           .contains(query.toLowerCase().trim())) {
  //         foodSearchResults.add(foodObjects[i]);
  //       }
  //     }
  //   }

  //   Fimber.d("QUERY check $query");
  //   if (query != '') {
  //     emit(RestaurantState.menuSearch(menuSearchResults, menuSearchObject));
  //   } else {
  //     restaurantDetail(restaurantCode);
  //   }
  // }

  void topRestaurant() async {
    try {
      emit(const RestaurantState.loading());

      final Either<ApiErrorRes, RestaurantModel> eitherResponse =
          await restaurantRepository.topRestaurants();

      emit(
        eitherResponse.fold(
          (l) {
            return RestaurantState.error(l.message ??
                l.detail ??
                'Unable to fetch top restaurants at the moment. Try later');
          },
          (r) {
            return RestaurantState.success(r.data, null);
          },
        ),
      );
    } catch (e) {
      emit(RestaurantState.error(e.toString()));
    }
  }

  void allRestaurant() async {
    try {
      emit(const RestaurantState.loading());

      final Either<ApiErrorRes, RestaurantModel> eitherResponse =
          await restaurantRepository.allRestaurants();

      emit(
        eitherResponse.fold(
          (l) {
            return RestaurantState.error(l.message ??
                l.detail ??
                'Unable to fetch restaurants at the moment. Try later');
          },
          (r) {
            return RestaurantState.success(r.data, null);
          },
        ),
      );
    } catch (e) {
      emit(RestaurantState.error(e.toString()));
    }
  }

  void restaurantDetail(String restaurantCode) async {
    try {
      emit(const RestaurantState.loading());

      final eitherResponse =
          await restaurantRepository.restaurantDetail(restaurantCode);

      emit(
        eitherResponse.fold(
          (l) {
            return RestaurantState.error(l.message ??
                l.detail ??
                'Unable to details at the moment. Try later');
          },
          (r) {
            return RestaurantState.success(null, r);
          },
        ),
      );
    } catch (e) {
      emit(RestaurantState.error(e.toString()));
    }
  }
}
