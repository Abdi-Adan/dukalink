// decode access token to get owner details
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../core/di/injector.dart';
import '../configs/constants.dart';

Future<String?> getAppFlavor() async {
  try {
    return await const MethodChannel('com.dukalink.app')
        .invokeMethod<String>('getFlavor');
  } catch (e) {
    return Constants.production;
  }
}

// CountryCode fromCountryName(String name) {
//   final Map<String, String> jsonCode = codes.firstWhere(
//     (code) => code['name']?.toLowerCase() == name.toLowerCase(),
//   );
//   return CountryCode.fromJson(jsonCode);
// }

List<String> getFavCountries() {
  return ['+254', 'KE'];
}

String getLanguageCode(BuildContext context) {
  var languageCode = context.locale.languageCode;

  /// This must not be null. It may be 'und', representing 'undefined'.
  if (languageCode == 'und') {
    languageCode = 'en';
  }

  return languageCode;
}

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

Future<void> checkNetwork(BuildContext context) async {
  bool isOnline = await hasNetwork();

  if (!isOnline) {
    ToastUtils.showErrorToast('netConnectionError'.tr());
  }
}

void saveOrderId(orderId) async {
  String? deviceId = await PlatformDeviceId.getDeviceId;
  FirebaseFirestore.instance.collection("userOrders").doc('$deviceId').set({
    'order_id': orderId,
    'device_id': deviceId,
    'order_status': 'Ordered',
    'isComplete': false,
    'createdAt': DateTime.now()
  }, SetOptions(merge: true));
}

Future<String> generateOrderId(String restaurantId) async {
  // Generate an order based on current timestamp
  DateTime now = DateTime.now();
  var month = DateFormat("MMMM").format(now);
  var day = DateFormat("EEEE").format(now);

  String orderId = ('${month.substring(0, 3)}$day${now.millisecondsSinceEpoch}')
      .toUpperCase()
      .trim();
  // saveOrderId(orderId);
// Save the order id for tracking the order
  var sharedHelper = inject<SharedHelper>();
  await sharedHelper.saveString(restaurantId, orderId);

  return orderId;
}
