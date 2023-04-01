import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/domain/value_objects/app_global_constants.dart';
import 'package:dukalink/dukalink_app.dart';
import 'package:dukalink/infrastructure/local_repository/database_state_persistor.dart';
import 'package:dukalink/presentation/widgets/molecular/unrecoverable_error_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    NavigateAction.setNavigatorKey(globalAppNavigatorKey);

    final DukalinkStateDatabase stateDB =
        DukalinkStateDatabase(dataBaseName: dukalinkDBName);

    await stateDB.init();

    final AppState initialState = await stateDB.readState();

    if (initialState == AppState.initial()) {
      await stateDB.saveInitialState(initialState);
    }

    final Store<AppState> store = Store<AppState>(
      initialState: initialState,
      persistor: PersistorPrinterDecorator<AppState>(stateDB),
      defaultDistinct: true,
    );

    ErrorWidget.builder = (FlutterErrorDetails details) {
      if (!kReleaseMode) {
        return ErrorWidget(details.exception);
      } else {
        return const UnrecoverableErrorWidget();
      }
    };

    FlutterError.onError = (FlutterErrorDetails detail) {
      FirebaseCrashlytics.instance.recordFlutterError(detail);
    };

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp(
      DukalinkApp(
        store: store,
      ),
    );
  }, (Object exception, StackTrace stackTrace) {
    if (!kReleaseMode) {
      // print("$exception -=- $stackTrace");
    }
    FirebaseCrashlytics.instance.recordError(exception, stackTrace);
  });
}
