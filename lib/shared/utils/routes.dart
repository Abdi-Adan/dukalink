import 'package:dukalink_app/feature/authentication/login.dart';
import 'package:dukalink_app/feature/authentication/reset_password.dart';
import 'package:dukalink_app/feature/dishes/all_dishes.dart';
import 'package:dukalink_app/feature/dishes/dish_reviews.dart';
import 'package:dukalink_app/feature/dishes/dish_screen.dart';
import 'package:dukalink_app/feature/home/home_screen.dart';
import 'package:dukalink_app/feature/home/notification_screen.dart';
import 'package:dukalink_app/feature/orders/order_list.dart';
import 'package:dukalink_app/feature/orders/receipt_screen.dart';
import 'package:dukalink_app/feature/qrScanner/scan_home.dart';
import 'package:dukalink_app/feature/restaurant/all_restaurant.dart';
import 'package:dukalink_app/feature/restaurant/retstaurant_detail.dart';
import 'package:dukalink_app/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/di/injector.dart';

import '../../feature/authentication/widgets/register_screen.dart';
import '../../feature/profile/edit_profile.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => myRoute(SplashPage()),
  LoginScreen.routeName: (context) => myRoute(const LoginScreen()),
  SignUpScreen.routeName: (context) => myRoute(const SignUpScreen()),
  ResetPasswordScreen.routeName: (context) =>
      myRoute(const ResetPasswordScreen()),
  HomeScreen.routeName: (context) => myRoute(const HomeScreen()),
  ScannerHome.routeName: (context) => myRoute(const ScannerHome()),
  AllRestaurantScreen.routeName: (context) =>
      myRoute(const AllRestaurantScreen()),
  RestaurantDetailScreen.routeName: (context) =>
      myRoute(const RestaurantDetailScreen()),
  DishScreen.routeName: (context) => myRoute(const DishScreen()),
  DishReviews.routeName: (context) => myRoute(DishReviews()),
  // Todo: uncomment when the screen is ready
  OrderListScreen.routeName: (context) => myRoute(OrderListScreen()),
  // PaymentHomeScreen.routeName: (context) => myRoute(const PaymentHomeScreen()),
  AllDishScreen.routeName: (context) => myRoute(const AllDishScreen()),
  ReceiptScreen.routeName: (context) => myRoute(const ReceiptScreen()),
  EditProfilePage.routeName: (context) => myRoute(EditProfilePage()),
  NotificationScreen.routeName: (context) =>
      myRoute(const NotificationScreen()),
  // QrcodeScannerScreen.routeName: (context) =>
  //     myRoute(const QrcodeScannerScreen()),
};

//set icon colors to black and status bar colors to white for Android.
Widget myRoute(var widget) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    child: widget,
  );
}

// LOGOUT service
class GlobalNavigationService {
  Future<dynamic> logOutUser(String route) async {
    await inject<SharedHelper>().clearStorage();

    return navigationKey.currentState!
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static void goback() {
    return navigationKey.currentState!.pop();
  }
}
