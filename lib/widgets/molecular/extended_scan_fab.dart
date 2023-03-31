import 'package:flutter/material.dart';

class ExtendedFAB extends StatelessWidget {
  const ExtendedFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
      label: const Text('Scan QR Code'),
      onPressed: () {},
      backgroundColor: const Color(0xff10277C),
      elevation: 5,
    );
  }
}
