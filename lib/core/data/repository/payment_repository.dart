import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/api_error_res.dart';
import 'package:dukalink_app/core/data/model/checkout_request_model.dart';
import 'package:dukalink_app/core/network/api_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

import '../../network/endpoints.dart';
import '../model/mpesaResponseModel.dart';

abstract class PaymentRepository {
  Future<Either<ApiErrorRes, String>> initPayment({
    required String amount,
    required String orderId,
    required String paymentPhoneNo,
    required String restaurantCode,
    required String tableId,
    required String paymentOption,
    required String paymentMode,
    required String orderType,
    required String deviceId,
    // required String id,
    required List<String>? ids,
  });
}

class PaymentRepositoryImpl extends PaymentRepository {
  final ApiProvider apiProvider;
  final SharedHelper sharedHelper;

  PaymentRepositoryImpl({
    required this.apiProvider,
    required this.sharedHelper,
  });

  @override
  Future<Either<ApiErrorRes, String>> initPayment({
    required String amount,
    required String orderId,
    required String paymentPhoneNo,
    required String restaurantCode,
    required String tableId,
    required String paymentOption,
    required String paymentMode,
    required String orderType,
    required String deviceId,
    // required String id,
    required List<String>? ids,
  }) async {
    try {
      final user = await sharedHelper.getUsersData();
      var payload = {
        "restaurant_code": restaurantCode,
        "id": id,
        'order_id': orderId,
        "device_id": deviceId,
        "table_id": tableId,
        "payment_option": paymentOption,
        "payment_mode": paymentMode,
        "order_type": orderType,
        "amount": amount,
        "paying_phoneNo": paymentPhoneNo,
        "customer_email": user?.email ?? "dukalink@gmail.com",
        "user_id": user?.id,
        "customer_phone": user?.mobileNumber ?? paymentPhoneNo,
      };
      debugPrint("Payload ${payload}");

      // Map<String, dynamic> requestData = {
      //   "ids": ids!.map((item) => item.toString()).toList()
      // };
      List<Map<String, dynamic>> requestData = ids!.map((id) {
        return {
          "id": id.toString(),
        };
      }).toList();

      final res = await apiProvider.post(
        {
          "restaurant_code": restaurantCode,
          "table_id": tableId,
          "payment_option": paymentOption,
          "payment_mode": paymentMode,
          "order_type": orderType,
          "amount": amount,
          "paying_phone": paymentPhoneNo,
          "customer_email": user?.email ?? "dukalink@gmail.com",
          "user_id": user?.id,
          "customer_phone": user?.mobileNumber ?? paymentPhoneNo,
          // "id": id,
          "cart_items": requestData,
          // 'order_id': orderId,
          "device_id": deviceId,
        }
        // payload
        ,
        '${EndPoints.initPayment.url}${user?.id}/',
      );

      if (res["status"] != null && res["status"]) {
        // After a successfull checkout we clear the table number
        await sharedHelper.clearKey(table_id);
        // TODO making stkPush
        if (paymentMode.toLowerCase() == "mpesa") {
          final paymentRes = await apiProvider.post(
            {
              "amount": amount,
              // "restaurant_code": restaurantCode,
              "currency": "KES",
              "callback_url":
                  "https://api.staging.dukalink.io/api/v1/restaurant/mpesapayments/callback/",
              "channel": "MPESA",
              "msisdn": paymentPhoneNo ?? user?.mobileNumber,

              "email": user?.email ?? "dukalink@gmail.com",
              // "user_id": user?.id,
              "phone": paymentPhoneNo ?? user?.mobileNumber,
              // "id": id,
              // 'order_id': orderId,
              // "device_id": deviceId,
            }
            // payload
            ,
            '${EndPoints.stkPush.url}',
          );
          if (paymentRes["status"] != null && res["status"]) {
            MpesaResponseModel paymentDetails =
                MpesaResponseModel.fromJson(paymentRes);
            debugPrint("Mpesa payment details ${paymentDetails}");
          }
        }

        return Right(res['message']);
      } else {
        return Left(ApiErrorRes.fromJson(res));
        // throw errors.message ?? 'Unable to add item to cart. Try later';
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }
}
