// ignore_for_file: constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:dukalink_app/core/data/model/favoriteFoodModel.dart';
import 'package:dukalink_app/core/data/model/favoriteRestaurantModel.dart';
import 'package:dukalink_app/core/data/model/login/login_response.dart';
import 'package:fimber/fimber.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dukalink_app/core/data/user/freshchat_token_response.dart';
import 'package:dukalink_app/core/di/injector.dart';

import '../model/newFavoriteFoodModel.dart';
import '../model/restaurant_model.dart';

const String refreshTokenKey = 'refreshToken';
const String accessTokenKey = 'accessTokenKey';
const String addedProductVariants = 'added_product_variants';
const String userDetailsDataKey = 'user_details_data_key';
const String businessDetailsDataKey = 'business_details_data_key';

const String businessIdDataKey = 'businessIdDataKey';
const refreshed_access_token = 'refreshed_access_tokens';
const String freshchat_token_responseKey = 'freshchat_token_responseKey';
const String langKey = 'lang_support_key';
const String endDeliveriesPromptKey = 'end_deliveries_key';
const String announcementPromptKey = 'announcement_prompt_key';
const String displayAddCardDialogKey = 'add_card_dialog';
const String displayPendingPaymentDialogKey = 'pending_payment_dialog';
const String displayAddCardAlertKey = 'add_card_alert_key';
const String promotionSessionIdKey = 'promotion_session_id_key';
const String order_id = 'order_id';
const String table_id = 'table_id';

const String open_url_key = 'open_url_key';

abstract class SharedHelper {
  Future<SharedPreferences> getInstance();
  Future<bool> saveString(String key, String value);
  Future<bool> saveBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<String?> getString(String key);
  Future<bool> clearStorage();
  Future saveTokens({String? accessToken, String? refreshToken});
  Future<bool> isAccessTokenRefreshed();
  Future clearKey(String key);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future saveAccessToken(String accessToken);
  Future saveUser(User userResponse);
  Future saveFavoriteFood({required String foodCode});
  Future saveFavoriteRestaurant(String favoriteRestaurant,
      {required String restaurantCode});
  Future<User?> getUsersData();
  Future<FavoriteFood?> getFavoriteFoodData(String foodCode);
  Future<RestaurantData?> getFavoriteRestaurantData(String restaurantCode);
}

class SharedHelperImpl extends SharedHelper {
  final SharedPreferences sharedPreferences;

  SharedHelperImpl({required this.sharedPreferences});

  @override
  Future<SharedPreferences> getInstance() async {
    await inject.allReady();
    return inject.get<SharedPreferences>();
  }

  @override
  Future<bool> saveString(String key, String value) async {
    return sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> saveBool(String key, bool value) async {
    return sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return sharedPreferences.getBool(key) ?? false;
  }

  @override
  Future<String?> getString(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> clearStorage() async {
    return await sharedPreferences.clear();
  }

  @override
  Future saveTokens({String? accessToken, String? refreshToken}) async {
    await sharedPreferences.setString(refreshTokenKey, refreshToken!);
    await sharedPreferences.setString(accessTokenKey, accessToken!);

    var acc = await getAccessToken();
    var ref = await getRefreshToken();
  }

  @override
  Future<bool> isAccessTokenRefreshed() async =>
      (sharedPreferences).getBool(refreshed_access_token) ?? false;

  @override
  Future clearKey(String key) async => (sharedPreferences).remove(key);

  @override
  Future<String?> getAccessToken() async {
    return sharedPreferences.getString(accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return sharedPreferences.getString(refreshTokenKey);
  }

  /* save access token */
  @override
  Future saveAccessToken(String accessToken) async {
    await (sharedPreferences).setBool(refreshed_access_token, true);
    await (sharedPreferences).setString(accessTokenKey, accessToken);
  }

  @override
  Future saveUser(User userResponse) async {
    await sharedPreferences.setString(
        userDetailsDataKey, jsonEncode(userResponse.toJson()));
  }

  @override
  Future saveFavoriteFood({required String foodCode}) async {
    await sharedPreferences.setString('Favouritefood', foodCode);
  }

  @override
  Future saveFavoriteRestaurant(String favoriteRestaurant,
      {required String restaurantCode}) async {
    await sharedPreferences.setString(favoriteRestaurant, restaurantCode);
  }

  @override
  Future<User?> getUsersData() async {
    if (sharedPreferences.containsKey(userDetailsDataKey)) {
      final data = jsonDecode(sharedPreferences.getString(userDetailsDataKey)!);
      return User.fromJson(data);
    } else {
      return null;
    }
  }

  @override
  Future<FavoriteFood?> getFavoriteFoodData(String foodCode) async {
    if (sharedPreferences.containsKey(foodCode)) {
      final data = jsonDecode(sharedPreferences.getString(foodCode)!);
      final v = FavoriteFood.fromJson(data);
      Fimber.e("Favorite FOOD DADADADAD===> ${v.favoriteUserId}");
      // Fimber.e("Favorite FOOD DADADADAD===> ${v.user?.id}");
      return FavoriteFood.fromJson(data);
    } else {
      return null;
    }
  }

  @override
  Future<RestaurantData?> getFavoriteRestaurantData(
      String restaurantCode) async {
    if (sharedPreferences.containsKey(restaurantCode)) {
      final data = jsonDecode(sharedPreferences.getString(restaurantCode)!);
      // var data =
      //     sharedPreferences.getString(restaurantCode)!;
      return RestaurantData.fromJson(data);
    } else {
      return null;
    }
  }

  Future saveFreshchatTokenResponse(
      FreshChatTokenResponse freshchatTokenResponse) async {
    await sharedPreferences.setString(
        freshchat_token_responseKey, jsonEncode(freshchatTokenResponse));
  }

  Future<FreshChatTokenResponse?> getFreshchatTokenResponse() async {
    if (sharedPreferences.containsKey(freshchat_token_responseKey)) {
      final data =
          jsonDecode(sharedPreferences.getString(freshchat_token_responseKey)!);
      return FreshChatTokenResponse.fromJson(data);
    } else {
      return null;
    }
  }
}
