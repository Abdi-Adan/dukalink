import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EndPoints {
  login,
  register,
  refreshToken,
  signUpCheck,
  editUser,
  phoneVerification,
  verifyOtp,
  signUp,
  logout,
  getAllRestaurants,
  getTopRestaurants,
  getTopDishes,
  getDishPerMenu,
  getDishPerRestaurant,
  restaurantDetail,
  favoriteRestaurant,
  favoriteFood,
  addFavoriteFood,
  addFavoriteRestaurant,
  addToCart,
  getUserOrders,
  getAllUserOrders,
  getUserUnfulfilledOrdersInRes,
  getUserFulfilledOrdersInRes,
  deleteCartItem,
  editItemQuantity,
  initPayment,
  getNotification,
  stkPush,
  getAllFoodCategories,
  getFoodPerCategory,
  scanQR,
  searchMenu,
  generalSearchQuery,
}

extension Url on EndPoints {
  // static String? baseUrl = dotenv.env['API_BASE_URL'];

  static String? baseUrl = "https://api.staging.dagizo.io/api/v1/";
  // static String? baseUrl = "http://54.172.83.200:8880/api/v1/";
  static String? adonisBaseUrl = dotenv.env['ADONIS_BASE_URL'];

  static String? nodeBaseUrl = '$baseUrl/v1/';
  static String googleMapDirectionApi = 'https://maps.googleapis.com/';

  String get url {
    switch (this) {
      case EndPoints.login:
        return "${baseUrl}users/login/";
      case EndPoints.register:
        // return "${baseUrl}auth/register/";
        return "${baseUrl}users/signup/client/";
      case EndPoints.logout:
        return "${baseUrl}logout";
      case EndPoints.refreshToken:
        return '${baseUrl}token';
      case EndPoints.signUpCheck:
        return '${nodeBaseUrl}sign_up_check';
      case EndPoints.editUser:
        return '${baseUrl}users/user-profile-client-edit';
      case EndPoints.phoneVerification:
        return '${baseUrl}customers/request_verification';
      case EndPoints.verifyOtp:
        return '${baseUrl}customers/check_verification';
      case EndPoints.signUp:
        return '${nodeBaseUrl}sign_up_submit';
      case EndPoints.getAllRestaurants:
        return '${baseUrl}restaurant/all-branches/';
      case EndPoints.getTopRestaurants:
        return '${baseUrl}restaurant/branches-by-review/';
      case EndPoints.favoriteRestaurant:
        return '${baseUrl}restaurant/add-favorite-restaurant/';
      case EndPoints.favoriteFood:
        return '${baseUrl}restaurant/add-favorite-food/';
      case EndPoints.addFavoriteFood:
        return '${baseUrl}restaurant/add-favorite-food/';
      case EndPoints.addFavoriteRestaurant:
        return '${baseUrl}restaurant/add-favorite-restaurant/';
      case EndPoints.getTopDishes:
        return '${baseUrl}restaurant/top-dishes/';
      case EndPoints.getDishPerMenu:
        return '${baseUrl}restaurant/food-in-menu/';
      case EndPoints.getDishPerRestaurant:
        return '${baseUrl}restaurant/food/';
      case EndPoints.restaurantDetail:
        return '${baseUrl}restaurant/branch-detail';
      case EndPoints.getAllFoodCategories:
        return '${baseUrl}restaurant/all-food-items-categories';
      case EndPoints.getFoodPerCategory:
        return '${baseUrl}restaurant/filter-food-items-on-category';
      case EndPoints.addToCart:
        return '${baseUrl}orders/cart/';
      case EndPoints.getUserOrders:
        return '${baseUrl}orders/order-checkout';
      case EndPoints.getAllUserOrders:
        return '${baseUrl}orders/all-user-orders';
      case EndPoints.getUserUnfulfilledOrdersInRes:
        return '${baseUrl}orders/unfulfilled-user-orders-in-restaurant';
      case EndPoints.getUserFulfilledOrdersInRes:
        return '${baseUrl}orders/fulfilled-user-orders-in-restaurant';
      case EndPoints.deleteCartItem:
        return '${baseUrl}orders/delete-cart-item';
      case EndPoints.editItemQuantity:
        return '${baseUrl}orders/edit-item-quantity';
      case EndPoints.initPayment:
        return '${baseUrl}orders/order-checkout/';
      case EndPoints.getNotification:
        return '$baseUrl/notification/get/';
      case EndPoints.stkPush:
        return '${baseUrl}restaurant/mpesa-pushstk/';
      case EndPoints.scanQR:
        return '${baseUrl}restaurant/scan-in-restaurant-qrcode-url';
      case EndPoints.searchMenu:
        return '${baseUrl}restaurant/search_menu?';
      case EndPoints.generalSearchQuery:
        return '${baseUrl}restaurant/general_serch_query/?search_string=';

      default:
        throw Exception('Url not set');
    }
  }
}
