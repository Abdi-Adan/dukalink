import 'package:dukalink_app/core/services/navigation_service.dart';
import 'package:dukalink_app/shared/utils/constants.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:dukalink_app/shared/configs/size_config.dart';
import '../../core/blocs/payment/payment_cubit.dart';
import '../../core/di/injector.dart';
import '../../feature/restaurant/retstaurant_detail.dart';

void setUpScreenUtil(BuildContext context) {
  SizeConfig().init(context);
}

abstract class DynamicLinksService {
  Future<void> initDynamicLinks(context);
}

class DynamicLinksServiceImpl implements DynamicLinksService {
  final FirebaseDynamicLinks firebaseDynamicLinksInstance;

  DynamicLinksServiceImpl({
    required this.firebaseDynamicLinksInstance,
  });

  void _navigateToMenu(
      BuildContext context, String resCode, String tableNumber) async {
    launchSnackbar(
      context: navigatorKey.currentState!.context,
      message: 'QR Code scanned successfuly, taking you to the restaurant',
      okCallback: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      type: SnackbarType.success,
      dismissText: 'OKAY',
    );

    isQRScanned.add(true);

    await navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
        builder: (context) => RestaurantDetailScreen(
              restaurantCode: resCode,
              tableNumber: tableNumber,
            )));
  }

  @override
  Future<void> initDynamicLinks(context) async {
    final PendingDynamicLinkData? dynamicLink =
        await firebaseDynamicLinksInstance.getInitialLink();

    final pendingDeepLink = dynamicLink?.link;
    if (pendingDeepLink != null) {
      print(pendingDeepLink);
      String? resCode = pendingDeepLink.queryParameters['branch']!;
      String? tableNumber = pendingDeepLink.queryParameters['table_number']!;
      String? tableId = pendingDeepLink.queryParameters['table_id']!;

      if (resCode.isNotEmpty && tableNumber.isNotEmpty && tableId.isNotEmpty) {
        // await inject<PaymentCubit>().saveTableId(tableId);
        _navigateToMenu(context, resCode, tableNumber);
      }
    }
    firebaseDynamicLinksInstance.onLink.listen((dynamicLinkData) {
      final deepLink = dynamicLinkData.link;
      print(deepLink);
      String? resCode = deepLink.queryParameters['branch']!;
      String? tableNumber = deepLink.queryParameters['table_number']!;
      String? tableId = deepLink.queryParameters['table_id']!;

      if (resCode.isNotEmpty && tableNumber.isNotEmpty && tableId.isNotEmpty) {
        _navigateToMenu(context, resCode, tableNumber);
      }
    });
  }
}
