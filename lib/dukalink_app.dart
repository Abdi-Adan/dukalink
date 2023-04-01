import 'package:dukalink/app_wrapper.dart';
import 'package:dukalink/application/core/utils.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/domain/routes/route_generator.dart';
import 'package:dukalink/domain/routes/routes.dart';
import 'package:dukalink/domain/value_objects/app_global_constants.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class DukalinkApp extends StatefulWidget {
  const DukalinkApp({super.key, required this.store});

  final Store<AppState> store;

  @override
  State<DukalinkApp> createState() => _DukalinkAppState();
}

class _DukalinkAppState extends State<DukalinkApp> with WidgetsBindingObserver {
  FirebaseApp dukalinkFirebaseApp = Firebase.app();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future<dynamic>.delayed(Duration.zero, () async {
        appInitialRoute.initialRoute.add(
          await getInitialRoute(state: widget.store.state),
        );
        FlutterNativeSplash.remove();
      });
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
        store: widget.store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<String>(
            stream: appInitialRoute.initialRoute.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return const Scaffold(
                  body: SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: DukalinkThemes.primaryColor,
                      ),
                    ),
                  ),
                );
              }

              return StoreProvider<AppState>(
                store: widget.store,
                child: StoreConnector<AppState, AppState>(
                    converter: (Store<AppState> store) => store.state,
                    builder: (BuildContext context, AppState state) {
                      return MaterialApp(
                        debugShowCheckedModeBanner: !kReleaseMode,
                        navigatorKey: globalAppNavigatorKey,
                        navigatorObservers: <NavigatorObserver>[
                          FirebaseAnalyticsObserver(analytics: _analytics),
                        ],
                        initialRoute:
                            appInitialRoute.initialRoute.valueOrNull ??
                                landingPageRoute,
                        onGenerateRoute: AppRouterGenerator.generateRoute,
                      );
                    }),
              );
            },
          ),
        ));
  }
}
