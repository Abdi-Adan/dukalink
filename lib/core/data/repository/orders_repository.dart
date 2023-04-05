import 'dart:convert';

import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/api_error_res.dart';
import 'package:dukalink_app/core/data/model/login/login_response.dart';
// import 'package:dukalink_app/core/data/model/order_item.dart';
import 'package:dukalink_app/core/network/api_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../feature/commonWidget/login_auth_dialog.dart';
import '../../network/endpoints.dart';
// import '../model/new_orders_model.dart';
// import '../model/new_orders_model.dart';
import '../model/editCartItem_model.dart';
import '../model/new_orders_model.dart';
import '../model/orderTrackingModel.dart';
import '../model/order_item.dart';
import '../model/orders_model.dart';
import '../model/request/cart_request.dart';
import '../model/userOrdersModel.dart';

abstract class OrdersRepository {
  Future<Either<ApiErrorRes, OrderItem>> addToCart({
    required double amount,
    required String foodCode,
    required String quantity,
    required String restaurantId,
    required String orderId,
    required String deviceId,
    List<CartVariant>? variants,
    List<String>? addOns,
    List<int>? sides,
  });
  Future<Either<ApiErrorRes, UserOrdersModel>> getAllUserOrders();
  Future<Either<ApiErrorRes, List<NewOrders>>>
      getUserUnfulfilledOrdersInRestaurant(String restaurantCode);
  Future<Either<ApiErrorRes, OrderTrackingModel>>
      getUserFulfilledOrdersInRestaurant(String restaurantCode);
  // Future<Either<ApiErrorRes, Orders>> getUserFulfilledOrdersInRestaurant(
  //     String restaurantCode);
  Future<Either<ApiErrorRes, String>> deleteCartItem(
      {required String restaurantCode,
      required String foodCode,
      required String orderID});
  Future<Either<ApiErrorRes, String>> editItemQuantity(
      {required String restaurantCode,
      required String foodCode,
      required int quantity,
      required String orderID});
}

class OrdersRepositoryImpl extends OrdersRepository {
  final ApiProvider apiProvider;
  final SharedHelper sharedHelper;

  OrdersRepositoryImpl({
    required this.apiProvider,
    required this.sharedHelper,
  });

  @override
  Future<Either<ApiErrorRes, OrderItem>> addToCart({
    required double amount,
    required String foodCode,
    required String quantity,
    required String restaurantId,
    required String orderId,
    required String deviceId,
    List<CartVariant>? variants,
    List<String>? addOns,
    List<int>? sides,
  }) async {
    try {
      // final user = await sharedHelper.getUsersData();
      var payload = variants!.isNotEmpty
          ? {
              'food_code': foodCode,
              'order_id': orderId,
              'add_ons': addOns,
              'sides_id': sides,
              // 'quantity': "5",
              "amount": amount,
              'quantity': quantity,
              'restaurant_code': restaurantId,
              'device_id': deviceId,
              'variants': variants.map((v) => v.toJson()).toList(),
            }
          : {
              'food_code': foodCode,
              'order_id': orderId,
              'add_ons': addOns,
              'sides_id': sides,
              // 'quantity': "5",
              "amount": amount,
              'quantity': quantity,
              'restaurant_code': restaurantId,
              'device_id': deviceId,
            };
      final res = await apiProvider.post(
        payload,
        EndPoints.addToCart.url,
      );

      if (res["status"] != null && res["status"]) {
        OrderItem restaursnt = OrderItem.fromJson(res);

        return Right(restaursnt);
      } else {
        return Left(ApiErrorRes.fromJson(res));
        // throw errors.message ?? 'Unable to add item to cart. Try later';
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, UserOrdersModel>> getAllUserOrders() async {
    try {
      User? user = await sharedHelper.getUsersData();
      debugPrint("MYUSER ${user?.id}");
      if (user != null) {
        // var userId = user?.id?? order_id;
        // var userId = "MARTHURSDAY1678353761958";
        debugPrint(
            'ALL USER ORDERS URL: ${EndPoints.getAllUserOrders.url}/${user?.id}');
        // TODO pass the order ID instead of the user ID
        final res = await apiProvider
            .get('${EndPoints.getAllUserOrders.url}/${user.id}');

        if (res["status"] != null && res["status"]) {
          // OrdersModel orderList = OrdersModel.fromJson(res);
          UserOrdersModel orderList = UserOrdersModel.fromJson(res);

          return Right(orderList);
        } else {
          return Left(ApiErrorRes.fromJson(res));
        }
      } else {
        String? deviceId = await PlatformDeviceId.getDeviceId;
        debugPrint(
            'ALL USER ORDERS URL: ${EndPoints.getAllUserOrders.url}/${deviceId}');
        // TODO pass the order ID instead of the user ID
        final res = await apiProvider
            .get('${EndPoints.getAllUserOrders.url}/${deviceId}');

        if (res["status"] != null && res["status"]) {
          // OrdersModel orderList = OrdersModel.fromJson(res);
          UserOrdersModel orderList = UserOrdersModel.fromJson(res);

          return Right(orderList);
        } else {
          return Left(ApiErrorRes.fromJson(res));
        }
      }
    } catch (e) {
      debugPrint("RESPONSEE $e");
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, List<NewOrders>>>
      getUserUnfulfilledOrdersInRestaurant(String restaurantCode) async {
    try {
      String? deviceId = await PlatformDeviceId.getDeviceId;
      // String? orderId = await FirebaseFirestore.instance
      //     .collection("userOrders")
      //     .doc("$deviceId")
      //     .get()
      //     .then((value) => value["order_id"]);
      String? orderId = await sharedHelper.getString(restaurantCode);
      final res = await apiProvider
          .get(EndPoints.getUserUnfulfilledOrdersInRes.url, queryParameters: {
        'restaurant_code': restaurantCode,
        'order_id': orderId
      });

      if (res["status"] != null && res["status"]) {
        var responseAgain = res['data'] as List;
        debugPrint("Here $responseAgain");
        List<NewOrders> orderList =
            responseAgain.map((i) => NewOrders.fromJson(i)).toList();

        // NewOrders order = NewOrders.fromJson(res['data']);

        return Right(orderList);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

// ?? WORKING HERE
  @override
  Future<Either<ApiErrorRes, OrderTrackingModel>>
      getUserFulfilledOrdersInRestaurant(String restaurantCode) async {
    try {
      // String? orderId = await sharedHelper.getString(restaurantCode);
      // User? user = await sharedHelper.getUsersData();
      String? deviceId = await PlatformDeviceId.getDeviceId;
      // String? orderId = await FirebaseFirestore.instance
      //     .collection("userOrders")
      //     .doc("$deviceId")
      //     .get()
      //     .then((value) => value["order_id"]);
      // TODO uncomment hard-coding
      // String? orderId = await sharedHelper.getString(restaurantCode);
      String? orderId = restaurantCode;
      debugPrint("MY ORDERID${orderId}}");
      // final res = await apiProvider
      //     .get(EndPoints.getUserFulfilledOrdersInRes.url, queryParameters: {
      //   'restaurant_code': restaurantCode,
      //   'order_id': "MARWEDNESDAY1678838975705"
      // });
      final res = await apiProvider
          .get("${EndPoints.getUserFulfilledOrdersInRes.url}/${orderId}");

      if (res["status"] != null && res["status"]) {
        OrderTrackingModel order = OrderTrackingModel.fromJson(res);

        return Right(order);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, String>> deleteCartItem(
      {required String restaurantCode,
      required String foodCode,
      required String orderID}) async {
    try {
      // String? orderId = await sharedHelper.getString(restaurantCode);
      String? deviceId = await PlatformDeviceId.getDeviceId;
      // String? orderId = await FirebaseFirestore.instance
      //     .collection("userOrders")
      //     .doc("$deviceId")
      //     .get()
      //     .then((value) => value["order_id"]);
      // String? orderId = await sharedHelper.getString(restaurantCode);
      final res = await apiProvider.delete(
        {
          // 'restaurant_code': restaurantCode,
          // 'user_id': orderId,
          // 'food_code': foodCode,
        },
        "${EndPoints.deleteCartItem.url}/$orderID",
        // "${EndPoints.deleteCartItem.url}/$foodCode",
      );

      if (res["status"] != null && res["status"]) {
        return Right(res["message"]);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }

  @override
  Future<Either<ApiErrorRes, String>> editItemQuantity(
      {required String restaurantCode,
      required String foodCode,
      required int quantity,
      required String orderID}) async {
    try {
      // String? orderId = await sharedHelper.getString(restaurantCode);
      String? deviceId = await PlatformDeviceId.getDeviceId;
      // String? orderId = await FirebaseFirestore.instance
      //     .collection("userOrders")
      //     .doc("$deviceId")
      //     .get()
      //     .then((value) => value["order_id"]);
      // String? orderId = await sharedHelper.getString(restaurantCode);
      final res = await apiProvider.post({
        'restaurant_code': restaurantCode,
        'quantity': quantity,
        'food_code': foodCode,
      }, '${EndPoints.editItemQuantity.url}/$orderID/');

      if (res["status"] != null) {
        // EditItemQuantity editedCartOrder = EditItemQuantity.fromJson(res);
        // var itemPrice = editedCartOrder.data?.first.amount;
        return Right(res["message"]);
      } else {
        return Left(ApiErrorRes.fromJson(res));
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }
}
