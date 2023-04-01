import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/application/singletons/initial_app_route.dart';
import 'package:dukalink/domain/routes/routes.dart';
import 'package:dukalink/domain/value_objects/app_enums.dart';
import 'package:flutter/material.dart';

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
  final bool hasDoneTour = currentStore.userState?.hasDoneTour ?? false;
  final bool signedIn = currentStore.userState?.isSignedIn ?? false;
  final bool isUIDPresent = (currentStore.userState?.uid != null);

  if (hasDoneTour == true) {
    if (signedIn == true && isUIDPresent) {
      return AuthStatus.okay;
    } else {
      return AuthStatus.requiresLogin;
    }
  } else {
    return AuthStatus.init;
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
