import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/application/singletons/initial_app_route.dart';
import 'package:dukalink/domain/routes/routes.dart';
import 'package:dukalink/domain/value_objects/app_enums.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

InitialRouteStore appInitialRoute = InitialRouteStore();

/// Gets initial route based on the userState status
Future<String> getInitialRoute({
  required AppState state,
}) async {
  final AuthStatus tokenStatus = await getAuthStatus(
    currentStore: state,
  );

  switch (tokenStatus) {
    case AuthStatus.init:
      return landingPageRoute;
    case AuthStatus.requiresLogin:
      return phoneInputPageRoute;
    case AuthStatus.okay:
      return homePageRoute;
    default:
      return landingPageRoute;
  }
}

Future<AuthStatus> getAuthStatus({
  required AppState currentStore,
}) async {
  final bool signedIn = currentStore.userState?.isSignedIn ?? false;
  final bool isUIDPresent = (currentStore.userState?.uid != null);

  if (signedIn == true && isUIDPresent) {
    return AuthStatus.okay;
  } else {
    return AuthStatus.requiresLogin;
  }
}

void insertText(String myText, TextEditingController controller) {
  final text = controller.text;
  final textSelection = controller.selection;
  final newText = text.replaceRange(
    textSelection.start,
    textSelection.end,
    myText,
  );
  final myTextLength = myText.length;
  controller.text = newText;
  controller.selection = textSelection.copyWith(
    baseOffset: textSelection.start + myTextLength,
    extentOffset: textSelection.start + myTextLength,
  );
}

void backspace(TextEditingController controller) {
  final text = controller.text;
  final textSelection = controller.selection;
  final selectionLength = textSelection.end - textSelection.start;

  // There is a selection.
  if (selectionLength > 0) {
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      '',
    );
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start,
      extentOffset: textSelection.start,
    );
    return;
  }

  // The cursor is at the beginning.
  if (textSelection.start == 0) {
    return;
  }

  // Delete the previous character
  final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
  final offset = isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
  final newStart = textSelection.start - offset;
  final newEnd = textSelection.start;
  final newText = text.replaceRange(
    newStart,
    newEnd,
    '',
  );
  controller.text = newText;
  controller.selection = textSelection.copyWith(
    baseOffset: newStart,
    extentOffset: newStart,
  );
}

bool isUtf16Surrogate(int value) {
  return value & 0xF800 == 0xD800;
}

Future<void> scanQR(BuildContext ctx) async {
  String barcodeScanRes;
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    if (barcodeScanRes.isNotEmpty &&
        barcodeScanRes != '' &&
        !barcodeScanRes.contains('-1')) {
      // var url = Uri.parse(barcodeScanRes);
      // String branchId = url.queryParameters['branch']!;
      // String tableNumber = url.queryParameters['table_number']!;
      // var tableId = url.queryParameters['table_id'];

      // ignore: use_build_context_synchronously
      launchSnackbar(
        context: ctx,
        message: 'QR Code scanned successfuly, taking you to the restaurant',
        type: SnackbarType.success,
        dismissText: 'OKAY',
      );

      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //     ctx,
      //     MaterialPageRoute(
      //         builder: (context) => RestaurantDetailScreen(
      //               restaurantCode: branchId,
      //               tableNumber: tableNumber,
      //             )));
    }
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }
}
