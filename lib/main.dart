import 'package:dukalink_app/core/blocs/language_support_cubit/language_support_cubit.dart';
import 'package:dukalink_app/core/blocs/restaurant/restaurant_cubit.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/core/services/analytics_services.dart';
import 'package:dukalink_app/core/services/fresh_chat_service.dart';
import 'package:dukalink_app/core/services/navigation_service.dart';
import 'package:dukalink_app/core/services/push_notifation_service.dart';
import 'package:dukalink_app/feature/splash/splash_screen.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/theme.dart';
import 'package:dukalink_app/shared/utils/bloc_observer.dart';
import 'package:dukalink_app/shared/utils/routes.dart';
import 'package:dukalink_app/shared/utils/url_utils.dart';
import 'package:dukalink_app/shared/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/blocs/cubit/res_cubit_cubit.dart';
import 'core/blocs/favoritesCubit/favorite_cubit.dart';
import 'core/blocs/food/food_cubit.dart';
import 'core/blocs/orderTrackCubit/orderTrack_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //  await Firebase.initializeApp();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp(
        // name: 'dukalink',
        // options: DefaultFirebaseOptions.currentPlatform,
        );
  }
  await _initEnv();
  await setUpLocator();

  await _initFreshChat();
  _initAnalytics();
  _setUpAndroidColors();
  // await UrlUtils.saveUri();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://3a0527dff7e34077982b0e50583a2a0b@o4503989594357760.ingest.sentry.io/4503989647114240';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => _initBlocObserver(),
  );

  // runApp(EasyLocalization(
  //     path: 'assets/translations',
  //     supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
  //     fallbackLocale: const Locale('en', 'US'),
  //     child: MyApp()));
}

Future _initEnv() async {
  // get the flavor
  var flavor = await getAppFlavor();
  Fimber.i('Running on -----$flavor');
  if (flavor == 'staging') {
    Fimber.i('Running on staging');
    await dotenv.load(fileName: 'assets/env/staging/.env');
  } else if (flavor == 'production') {
    await dotenv.load(fileName: 'assets/env/production/.env');
  }
  await dotenv.load(fileName: 'assets/env/staging/.env');
  await dotenv.load(fileName: 'assets/env/production/.env');
}

void _setUpAndroidColors() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Palette.dukalinkPrimary1,
    systemNavigationBarColor: Palette.dukalinkPrimary1,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

Future _initFcm() async {
  await inject.get<PushNotificationService>().init();
}

Future _initFreshChat() async {
  try {
    await inject<FreshChatService>().initFreshChat();
  } catch (e) {
    debugPrint('chat service not init');
  }
}

void _initAnalytics() {
  try {
    AnalyticsServices.initAnalytics();
  } catch (e) {
    debugPrint('Analytics service not init');
  }
}

void _initBlocObserver() {
  BlocOverrides.runZoned(
    () {
      runApp(EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
          fallbackLocale: const Locale('en', 'US'),
          useFallbackTranslations: true,
          child: MyApp()));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

void _initFimber() {
  Fimber.plantTree(DebugTree(useColors: true));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _initFimber();
    _initFcm();

    // var url = window.location.href;
    // debugPrint('init: url: $url');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider<LanguageSupportCubit>(create: (ctx) {
            return inject.get<LanguageSupportCubit>();
          }),
          BlocProvider<RestaurantCubit>(create: (ctx) {
            return inject.get<RestaurantCubit>();
          }),
          BlocProvider<FoodCubit>(create: (ctx) {
            return inject.get<FoodCubit>();
          }),
          BlocProvider<FavoriteCubit>(create: (ctx) {
            return inject.get<FavoriteCubit>();
          }),
          BlocProvider<OrderTrackCubit>(create: (ctx) {
            return inject.get<OrderTrackCubit>();
          }),
          BlocProvider<ResBloc>(create: (ctx) {
            return inject.get<ResBloc>();
          }),
        ],
        child: BlocProvider(
          create: (ctx) => inject.get<LanguageSupportCubit>()..getLocale(),
          child: BlocBuilder<LanguageSupportCubit, LanguageSupportState>(
              builder: (ctx, state) {
            return MaterialApp(
                builder: (context, widget) {
                  return ResponsiveWrapper.builder(
                      ClampingScrollWrapper.builder(context, widget!),
                      maxWidth: 800,
                      minWidth: 450,
                      defaultScale: true,
                      breakpoints: [
                        const ResponsiveBreakpoint.resize(450, name: MOBILE),
                        const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                        const ResponsiveBreakpoint.autoScale(1000,
                            name: TABLET),
                        const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                        const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                      ]);
                  // return ResponsiveWrapper.builder(
                  //   BouncingScrollWrapper.builder(context, widget!),
                  //   maxWidth: 800,
                  //   minWidth: 480,
                  //   // defaultScale: true,
                  //   breakpoints: [
                  //     const ResponsiveBreakpoint.resize(490, name: MOBILE),
                  //     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  //     const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                  //   ],
                  //   background: Container(
                  //     color: const Color(0xFFF5F5F5),
                  //   ),
                  //   mediaQueryData:
                  //       MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  // );
                  // return MediaQuery(
                  //     data:
                  //         MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  //     child: widget!);
                },
                title: 'dukalink',
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                initialRoute: SplashPage.routeName,
                theme: theme(),
                // ThemeData(
                //     brightness: Brightness.light,
                //     primarySwatch: Colors.blue,
                //     primaryColor: Palette.dukalinkPrimary1,
                //     focusColor: Palette.gray90,
                //     hintColor: Palette.gray90,
                //     textTheme: GoogleFonts.mulishTextTheme(
                //       Theme.of(context).textTheme,
                //     )),
                locale: state is LanguageSupportLoaded
                    ? (state.hasCustomLanguage
                        ? Locale(state.language, '')
                        : null)
                    : null,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                routes: routes);
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //close restore id stream
    inject<FreshChatService>().close();

    super.dispose();
  }
}



// import 'package:dukalink_app/core/blocs/language_support_cubit/language_support_cubit.dart';
// import 'package:dukalink_app/core/blocs/restaurant/restaurant_cubit.dart';
// import 'package:dukalink_app/core/di/injector.dart';
// import 'package:dukalink_app/core/services/analytics_services.dart';
// import 'package:dukalink_app/core/services/fresh_chat_service.dart';
// import 'package:dukalink_app/core/services/push_notifation_service.dart';
// import 'package:dukalink_app/shared/configs/colors.dart';
// import 'package:dukalink_app/shared/configs/theme.dart';
// import 'package:dukalink_app/shared/utils/bloc_observer.dart';
// import 'package:dukalink_app/shared/utils/modular_routes.dart';
// import 'package:dukalink_app/shared/utils/utils.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:fimber/fimber.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import 'core/blocs/cubit/res_cubit_cubit.dart';
// import 'core/blocs/favoritesCubit/favorite_cubit.dart';
// import 'core/blocs/food/food_cubit.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   } else {
//     await Firebase.initializeApp(
//       name: 'dukalink',
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
//   // await Firebase.initializeApp();
//   await _initEnv();
//   await setUpLocator();

//   await _initFreshChat();
//   _initAnalytics();
//   _setUpAndroidColors();

//   await SentryFlutter.init(
//     (options) {
//       options.dsn =
//           'https://3a0527dff7e34077982b0e50583a2a0b@o4503989594357760.ingest.sentry.io/4503989647114240';
//       // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
//       // We recommend adjusting this value in production.
//       options.tracesSampleRate = 1.0;
//     },
//     appRunner: () => _initBlocObserver(),
//   );

//   // runApp(EasyLocalization(
//   //     path: 'assets/translations',
//   //     supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
//   //     fallbackLocale: const Locale('en', 'US'),
//   //     child: MyApp()));
// }

// Future _initEnv() async {
//   // get the flavor
//   var flavor = await getAppFlavor();
//   Fimber.i('Running on -----$flavor');
//   if (flavor == 'staging') {
//     Fimber.i('Running on staging');
//     await dotenv.load(fileName: 'assets/env/staging/.env');
//   } else if (flavor == 'production') {
//     await dotenv.load(fileName: 'assets/env/production/.env');
//   }
// }

// void _setUpAndroidColors() {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarBrightness: Brightness.light,
//     statusBarIconBrightness: Brightness.dark,
//     statusBarColor: Palette.dukalinkPrimary1,
//     systemNavigationBarColor: Palette.dukalinkPrimary1,
//     systemNavigationBarIconBrightness: Brightness.dark,
//   ));
// }

// Future _initFcm() async {
//   await inject.get<PushNotificationService>().init();
// }

// Future _initFreshChat() async {
//   try {
//     await inject<FreshChatService>().initFreshChat();
//   } catch (e) {
//     debugPrint('chat service not init');
//   }
// }

// void _initAnalytics() {
//   try {
//     AnalyticsServices.initAnalytics();
//   } catch (e) {
//     debugPrint('Analytics service not init');
//   }
// }

// void _initBlocObserver() {
//   BlocOverrides.runZoned(
//     () {
//       runApp(ModularApp(
//           module: AppModule(),
//           child: EasyLocalization(
//               path: 'assets/translations',
//               supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
//               fallbackLocale: const Locale('en', 'US'),
//               useFallbackTranslations: true,
//               child: MyApp())));
//     },
//     blocObserver: SimpleBlocObserver(),
//   );
// }

// void _initFimber() {
//   Fimber.plantTree(DebugTree(useColors: true));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     _initFimber();
//     _initFcm();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       builder: (_, __) => MultiBlocProvider(
//         providers: [
//           BlocProvider<LanguageSupportCubit>(create: (ctx) {
//             return inject.get<LanguageSupportCubit>();
//           }),
//           BlocProvider<RestaurantCubit>(create: (ctx) {
//             return inject.get<RestaurantCubit>();
//           }),
//           BlocProvider<FoodCubit>(create: (ctx) {
//             return inject.get<FoodCubit>();
//           }),
//           BlocProvider<FavoriteCubit>(create: (ctx) {
//             return inject.get<FavoriteCubit>();
//           }),
//           BlocProvider<ResBloc>(create: (ctx) {
//             return inject.get<ResBloc>();
//           }),
//         ],
//         child: BlocProvider(
//           create: (ctx) => inject.get<LanguageSupportCubit>()..getLocale(),
//           child: BlocBuilder<LanguageSupportCubit, LanguageSupportState>(
//               builder: (ctx, state) {
//             return MaterialApp.router(
//               builder: (context, widget) {
//                 return ResponsiveWrapper.builder(
//                     ClampingScrollWrapper.builder(context, widget!),
//                     maxWidth: 800,
//                     minWidth: 450,
//                     defaultScale: true,
//                     breakpoints: [
//                       const ResponsiveBreakpoint.resize(450, name: MOBILE),
//                       const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//                       const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
//                       const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
//                       const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
//                     ]);
//               },
//               title: 'dukalink',
//               // navigatorKey: navigatorKey,
//               debugShowCheckedModeBanner: false,
//               // initialRoute: SplashPage.routeName,
//               routeInformationParser: Modular.routeInformationParser,
//               routerDelegate: Modular.routerDelegate,
//               theme: theme(),
//               locale: state is LanguageSupportLoaded
//                   ? (state.hasCustomLanguage
//                       ? Locale(state.language, '')
//                       : null)
//                   : null,
//               localizationsDelegates: context.localizationDelegates,
//               supportedLocales: context.supportedLocales,
//               // routes: routes,
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     //close restore id stream
//     inject<FreshChatService>().close();

//     super.dispose();
//   }
// }
