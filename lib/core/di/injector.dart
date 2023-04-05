import 'package:dukalink_app/core/blocs/login/login_cubit.dart';
import 'package:dukalink_app/core/blocs/notification/notification_cubit.dart';
import 'package:dukalink_app/core/blocs/order/order_cubit.dart';
import 'package:dukalink_app/core/blocs/payment/payment_cubit.dart';
import 'package:dukalink_app/core/blocs/restaurant/restaurant_cubit.dart';
import 'package:dukalink_app/core/data/repository/login_repository.dart';
import 'package:dukalink_app/core/data/repository/notification_repository.dart';
import 'package:dukalink_app/core/data/repository/orders_repository.dart';
import 'package:dukalink_app/core/data/repository/payment_repository.dart';
import 'package:dukalink_app/core/data/repository/restaurant_repository.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dukalink_app/core/blocs/language_support_cubit/language_support_cubit.dart';
import 'package:dukalink_app/core/blocs/splash_page_cubit/splash_page_cubit.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/repository/signup_repository.dart';
import 'package:dukalink_app/core/network/api_provider.dart';
import 'package:dukalink_app/core/network/dio_client.dart';
import 'package:dukalink_app/core/network/interceptors/auth_interceptor.dart';
import 'package:dukalink_app/core/services/analytics_services.dart';
import 'package:dukalink_app/core/services/fresh_chat_service.dart';
import 'package:dukalink_app/core/services/navigation_service.dart';
import 'package:dukalink_app/core/services/push_notifation_service.dart';
import 'package:dukalink_app/core/services/remote_config_service.dart';
import 'package:dukalink_app/shared/utils/image_picker_utils.dart';

import '../../shared/utils/view_utils.dart';
import '../blocs/cartCubit/cart_cubit.dart';
import '../blocs/cubit/res_cubit_cubit.dart';
import '../blocs/favoritesCubit/favorite_cubit.dart';
import '../blocs/food/food_cubit.dart';
import '../blocs/orderTrackCubit/orderTrack_cubit.dart';
import '../blocs/orderhistory/orderHistory_cubit.dart';
import '../blocs/sign_up/signup_cubit.dart';

GetIt inject = GetIt.instance;

Future<void> setUpLocator() async {
  inject.registerLazySingleton<ImageUtils>(() => ImageUtilsImpl());

  // repositories
  inject.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl(
        apiProvider: inject(),
        sharedHelper: inject(),
      ));
  inject.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        apiProvider: inject(),
        sharedHelper: inject(),
      ));
  inject.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      apiProvider: inject(),
      sharedHelper: inject(),
    ),
  );
  inject.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(
      apiProvider: inject(),
      sharedHelper: inject(),
    ),
  );
  inject.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(
      apiProvider: inject(),
      sharedHelper: inject(),
    ),
  );
  inject.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(
      apiProvider: inject(),
      sharedHelper: inject(),
    ),
  );
  inject.registerLazySingleton<DynamicLinksService>(
    () => DynamicLinksServiceImpl(
      firebaseDynamicLinksInstance: FirebaseDynamicLinks.instance,
    ),
  );
  // local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerSingleton<SharedHelper>(
      SharedHelperImpl(sharedPreferences: inject()));

  // servicesA
  inject.registerSingleton(NavigationService());
  inject.registerSingleton(FreshChatService());
  inject.registerSingleton(PushNotificationService());
  inject.registerSingleton(AnalyticsServices());
  inject.registerSingletonAsync(() async {
    var token = dotenv.env['MIXPANEL_PROJECT_TOKEN']!;
    var mixpanel = await Mixpanel.init(token, optOutTrackingDefault: false);
    return mixpanel;
  });
  final remoteConfig = await RemoteConfigService.getInstance();
  inject.registerLazySingleton<RemoteConfigService>(() => remoteConfig);

  // api
  inject.registerLazySingleton(() => AuthInterceptor(inject()));
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton<ApiProvider>(() => ApiProvider(dio: inject()));
  inject.registerLazySingleton<DioClient>(
      () => DioClient(inject(), inject(), inject()));

  // blocs
  inject.registerFactory<LanguageSupportCubit>(
      () => LanguageSupportCubit(inject()));
  inject.registerFactory<SplashPageCubit>(() => SplashPageCubit(inject()));
  inject.registerFactory<LoginCubit>(
      () => LoginCubit(loginRepository: inject(), sharedHelper: inject()));
  inject.registerFactory<SignUpCubit>(
      () => SignUpCubit(signupRepository: inject(), sharedHelper: inject()));
  inject.registerFactory<RestaurantCubit>(
      () => RestaurantCubit(restaurantRepository: inject()));
  inject.registerFactory<FoodCubit>(
      () => FoodCubit(restaurantRepository: inject()));

  inject.registerFactory<OrderCubit>(
      () => OrderCubit(ordersRepository: inject()));
  inject.registerFactory<OrderHistoryCubit>(
      () => OrderHistoryCubit(ordersRepository: inject()));
  inject.registerFactory<OrderTrackCubit>(
      () => OrderTrackCubit(ordersRepository: inject()));
  inject.registerFactory<CartCubit>(() => CartCubit(
        ordersRepository: inject(),
        sharedHelper: inject(),
      ));
  inject.registerFactory<PaymentCubit>(
      () => PaymentCubit(paymentRepository: inject(), sharedHelper: inject()));
  inject.registerFactory<FavoriteCubit>(() =>
      FavoriteCubit(restaurantRepository: inject(), sharedHelper: inject()));
  inject.registerFactory<NotificationCubit>(
      () => NotificationCubit(notificationRepository: inject()));
  inject.registerFactory<ResBloc>(() => ResBloc());
}
