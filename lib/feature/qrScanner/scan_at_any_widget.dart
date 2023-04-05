import 'dart:convert';

import 'package:dukalink_app/feature/qrScanner/scan_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../core/blocs/payment/payment_cubit.dart';
import '../../core/di/injector.dart';

Future scanQR(context) async {
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    if (kIsWeb) {
      showDialog<bool>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return
                // AlertDialog(
                // content:
                const ScannerHome();
            // );
          });

      // Navigator.pushNamed(context, ScannerHome.routeName, arguments: false);
    } else {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (barcodeScanRes.isNotEmpty &&
          barcodeScanRes != '' &&
          !barcodeScanRes.contains('-1')) {
        Map qrData = json.decode(barcodeScanRes);
        await inject<PaymentCubit>().saveTableId(qrData['table_id']);
        Navigator.pop(context, qrData);
      }
    }
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }
}
