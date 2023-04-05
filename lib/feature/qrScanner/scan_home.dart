// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/blocs/payment/payment_cubit.dart';
import '../../core/di/injector.dart';
import '../../shared/configs/assets.dart';
import '../../shared/configs/colors.dart';
import '../restaurant/retstaurant_detail.dart';

class ScannerHome extends StatefulWidget {
  static const routeName = 'ScannerHome';

  const ScannerHome({Key? key}) : super(key: key);

  @override
  State<ScannerHome> createState() => _ScannerHomeState();
}

class _ScannerHomeState extends State<ScannerHome> {
  late ScannerController _scannerController;
  bool? moveToHome;
  saveTableNo(Map qrData) async {
    await inject<PaymentCubit>().saveTableId(qrData['table_id']);
    if (moveToHome != null) {
      Fimber.e("scanning here $qrData");
      Navigator.pushReplacementNamed(context, RestaurantDetailScreen.routeName,
          arguments: qrData);
    } else {
      Fimber.e("BBBBB");
      Navigator.pop(context, qrData);
    }
  }

  @override
  void initState() {
    super.initState();

    _scannerController = ScannerController(scannerResult: (result) {
      Map qrData = json.decode(result);
      // result as Map;
      saveTableNo(qrData);
    }, scannerViewCreated: () {
      final TargetPlatform platform = Theme.of(context).platform;
      if (TargetPlatform.iOS == platform) {
        Future.delayed(const Duration(seconds: 2), () {
          _scannerController
            ..startCamera()
            ..startCameraPreview();
        });
      } else {
        _scannerController
          ..startCamera()
          ..startCameraPreview();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scannerController
      ..stopCameraPreview()
      ..stopCamera();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as bool?;
    if (args != null) {
      moveToHome = args;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        iconTheme: const IconThemeData(color: Palette.dukalinkBlack),
        elevation: 0,
        title: Container(
          // width: size.width * 0.35,
          padding: EdgeInsets.all(8.0.sm),
          child: SvgPicture.asset(
            Assets.logo,
            height: 50,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Kindly scan the QR on the table to proceed',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 7,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Palette.dukalinkBlack1),
            ),
          ),
          Expanded(
            flex: 4,
            child: PlatformAiBarcodeScannerWidget(
              platformScannerController: _scannerController,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
