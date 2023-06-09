import 'package:dukalink/application/core/utils.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

class ExtendedFAB extends StatelessWidget {
  const ExtendedFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
      label: const Text(
        'Scan QR Code',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        await scanQR(context);
      },
      backgroundColor: DukalinkThemes.primaryColor,
      elevation: 5,
    );
  }
}
