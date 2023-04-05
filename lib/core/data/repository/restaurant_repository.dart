import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/api_error_res.dart';
// import 'package:dukalink_app/core/data/model/dishes_model.dart';
// import 'package:dukalink_app/core/data/model/new_restaurant_detail.dart';
// import 'package:dukalink_app/core/data/model/restaurant_detail.dart';
import 'package:dukalink_app/core/data/model/restaurant_model.dart';
import 'package:dukalink_app/core/network/api_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:debug_logger/debug_logger.dart';

import '../../network/endpoints.dart';
import '../model/dishes_model.dart';
// import '../model/favoriteFoodModel.dart';
import '../model/favoriteRestaurantModel.dart';
// import '../model/newFavoriteFoodModel.dart';
// import '../model/newFavoriteFoodModel.dart';
import '../model/newFavoriteFoodModel.dart';
import '../model/new_restaurant_detail.dart';

abstract class RestaurantRepository {
  Future<Either<ApiErrorRes, RestaurantModel>> topRestaurants();
  Future<Either<ApiErrorRes, RestaurantModel>> allRestaurants();
  // Future<Either<ApiErrorRes, NewFavoriteFoodModel>> topDishes();
  // Future<Either<ApiErrorRes, NewFavoriteFoodModel>> dishPerMenu(
  //     {required String menuCode, required String restaurantCode});
  Future<Either<ApiErrorRes, List<FavoriteFood>>> topDishes();
  Future<Either<ApiErrorRes, DishesModel>> dishPerMenu(
      {required String menuCode, required String restaurantCode});
  Future<Either<ApiErrorRes, DishesModel>> dishPerRestaurant(
      String restaurantCode);
  // Future<Either<ApiErrorRes, NewFavoriteFoodModel>> dishPerRestaurant(
  //     String restaurantCode);
  Future<Either<ApiErrorRes, NewRestaurantDetail>> restaurantDetail(
      String restaurantCode);
  Future<Either<ApiErrorRes, FavoriteRestaurantModel>> favoriteRestaurants();
  Future<Either<ApiErrorRes, List<FavoriteFood>>> favoriteFood();
  Future<Either<ApiErrorRes, bool>> addFavoriteFood({required String foodCode});
  Future<Either<ApiErrorRes, bool>> addFavoriteRestaurant(
      {required String restaurantCode});
}

class RestaurantRepositoryImpl extends RestaurantRepository {
  final ApiProvider apiProvider;
  final SharedHelper sharedHelper;

  RestaurantRepositoryImpl({
    required this.apiProvider,
    required this.sharedHelper,
  });

  @override
  Future<Either<ApiErrorRes, RestaurantModel>> topRestaurants() async {
    try {
      final res = await apiProvider.get(EndPoints.getTopRestaurants.url);

      if (res["status"] != null || res["status"]) {
        RestaurantModel restaursnt = RestaurantModel.fromJson(res);

        return Right(restaursnt);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, RestaurantModel>> allRestaurants() async {
    try {
      final res = await apiProvider.get(EndPoints.getAllRestaurants.url);

      if (res["status"] != null || res["status"]) {
        debugPrint("ALL RESTAURANT $res");
        RestaurantModel restaursnt = RestaurantModel.fromJson(res);

        return Right(restaursnt);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, List<FavoriteFood>>> topDishes() async {
    try {
      final res = await apiProvider.get(EndPoints.getTopDishes.url);

      if (res["status"] != null || res["status"]) {
        // DishesModel dishes = DishesModel.fromJson(res);

        var responseAgain = res['data'] as List;
        debugPrint("Favorite food endpoint output: ${responseAgain}/");

        List<FavoriteFood> dishes =
            responseAgain.map((i) => FavoriteFood.fromJson(i)).toList();

        return Right(dishes);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, DishesModel>> dishPerMenu(
      {required String menuCode, required String restaurantCode}) async {
    try {
      final res =
          await apiProvider.get(EndPoints.getDishPerMenu.url, queryParameters: {
        'menu_code': menuCode,
        'restaurant_code': restaurantCode,
      });

      if (res["status"] != null || res["status"]) {
        DishesModel dishes = DishesModel.fromJson(res);

        return Right(dishes);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, DishesModel>> dishPerRestaurant(
      String restaurantCode) async {
    try {
      final res = await apiProvider
          .get('${EndPoints.getDishPerRestaurant.url}$restaurantCode/');

      if (res["status"] != null || res["status"]) {
        DishesModel details = DishesModel.fromJson(res);

        return Right(details);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, NewRestaurantDetail>> restaurantDetail(
      String restaurantCode) async {
    try {
      debugPrint("Restaurant Code----> $restaurantCode");
      debugPrint(
          "Restaurant url----> ${EndPoints.restaurantDetail.url}/$restaurantCode/");

      final res = await apiProvider
          .get('${EndPoints.restaurantDetail.url}/$restaurantCode/');

      if (res["status"] != null || res["status"]) {
        debugPrint("Restaurant Detail: ${res}");

        NewRestaurantDetail details = NewRestaurantDetail.fromJson(res);
        //?? Changed from this
        // RestaurantDetail details = RestaurantDetail.fromJson(res);

        return Right(details);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchRawRestaurantDetails(
      String restaurantCode) async {
    final res = await apiProvider
        .get('${EndPoints.restaurantDetail.url}/$restaurantCode/');

    return res;
  }

  Future<Map<String, dynamic>> fetchAllFoodCategories(
      String restaurantCode) async {
    final res = await apiProvider
        .get('${EndPoints.getAllFoodCategories.url}/$restaurantCode/');
    return res;
  }

  Future<Map<String, dynamic>> fetchRawFoodPerCategory(
      String categoryCode) async {
    final foods = await apiProvider
        .get('${EndPoints.getFoodPerCategory.url}/$categoryCode/');

    return foods;
  }

  Future<dynamic> searchForRestaurant1(String searchTerm) async {
    final response = await apiProvider
        .get('${EndPoints.searchMenu.url}branch_name=$searchTerm');

    return response;
  }

  Future<dynamic> searchForRestaurant(String searchTerm) async {
    final response =
        await apiProvider.get('${EndPoints.generalSearchQuery.url}$searchTerm');

    return response;
  }

  Future<dynamic> searchForDishes(
      String searchTerm, String restaurantCode) async {
    final response = await apiProvider.get(
        '${EndPoints.searchMenu.url}branch_name=&food_name=$searchTerm&section_name=&branch_id=$restaurantCode');
    Future.delayed(const Duration(seconds: 3));

    return response;
  }

  @override
  Future<Either<ApiErrorRes, FavoriteRestaurantModel>>
      favoriteRestaurants() async {
    try {
      final user = await sharedHelper.getUsersData();
      debugPrint(
          "Favourite restaurant URL:${EndPoints.favoriteRestaurant.url}${user?.id}");
      final res = await apiProvider
          .get('${EndPoints.favoriteRestaurant.url}${user?.id}');

      if (res["status"] != null || res["status"]) {
        FavoriteRestaurantModel details = FavoriteRestaurantModel.fromJson(res);

        return Right(details);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, List<FavoriteFood>>> favoriteFood() async {
    try {
      final user = await sharedHelper.getUsersData();
      debugPrint(
          "Favorite food endpoint: ${EndPoints.favoriteFood.url}${user?.id}/");
      final res =
          await apiProvider.get('${EndPoints.favoriteFood.url}${user?.id}');

      if (res["status"] != null || res["status"]) {
        // TODO initial model
        // FavoriteFoodModel details = FavoriteFoodModel.fromJson(res);
        var responseAgain = res['data'] as List;
        debugPrint("Favorite food endpoint output: ${responseAgain}/");
        List<FavoriteFood> favoriteList =
            responseAgain.map((i) => FavoriteFood.fromJson(i)).toList();

        // NewFavoriteFoodModel details = NewFavoriteFoodModel.fromJson(res);

        return Right(favoriteList);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, bool>> addFavoriteFood(
      {required String foodCode}) async {
    try {
      final user = await sharedHelper.getUsersData();

      final res = await apiProvider.post(
        {"food_code": foodCode},
        '${EndPoints.addFavoriteFood.url}${user?.id}/',
      );

      if (res["status"] != null || res["status"]) {
        if (res['status'] != null &&
            res['status'] == true &&
            !res['message'].toString().contains('unfavorited')) {
          await sharedHelper.saveFavoriteFood(foodCode: foodCode);
          return const Right(true);
        } else {
          await sharedHelper.clearKey(foodCode);
          return const Right(false);
        }
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, bool>> addFavoriteRestaurant(
      {required String restaurantCode}) async {
    try {
      final user = await sharedHelper.getUsersData();
      final res = await apiProvider.post(
        {"branch_id": restaurantCode},
        '${EndPoints.addFavoriteRestaurant.url}${user?.id}/',
      );

      if (res["status"] != null) {
        if (res['status'] == true &&
            !res['message'].toString().contains('unfavorited')) {
          await sharedHelper.saveFavoriteRestaurant(
            'Favorite Restaurant Id',
            restaurantCode: restaurantCode,
          );
          return const Right(true);
        } else {
          await sharedHelper.clearKey(restaurantCode);
          return const Right(false);
        }
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }
}
