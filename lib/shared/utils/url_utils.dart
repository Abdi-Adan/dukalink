// ignore: avoid_web_libraries_in_flutter
// import 'dart:js' as js;
import 'package:dukalink_app/core/blocs/payment/payment_cubit.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/feature/restaurant/retstaurant_detail.dart';
import 'package:flutter/material.dart';

class UrlUtils {
  static Future saveUri() async {
    // var uri = Uri.tryParse(js.context['location']['href']);
    // debugPrint('uri: $uri');

    // inject<SharedHelper>().saveString(open_url_key, uri.toString());
  }

  static Future getUrlParams(BuildContext context) async {
    Uri? uri;
    String? uriString = (await inject<SharedHelper>().getString(open_url_key));
    if (uriString != null) {
      uri = Uri.parse(uriString);
    }
    debugPrint('uri: $uri');

    if (uri != null) {
      String? resCode = uri.queryParameters['branch']!;
      String? tableNumber = uri.queryParameters['table_number']!;
      String? tableId = uri.queryParameters['table_id']!;

      if (resCode != null && tableId != null && tableNumber != null) {
        await inject<PaymentCubit>().saveTableId(tableId);
        var qrData = {"restaurant_code": resCode, "table_id": tableId};

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantDetailScreen(
                      restaurantCode: resCode,
                      tableNumber: tableNumber,
                    )));
      }
    }
  }
}
