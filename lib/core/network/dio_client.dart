import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/network/endpoints.dart';
import 'package:dukalink_app/core/network/interceptors/auth_interceptor.dart';
import 'package:dukalink_app/core/network/interceptors/error_interceptor.dart';
import 'package:dukalink_app/core/services/navigation_service.dart';

class DioClient {
  final AuthInterceptor authInterceptor;
  final SharedHelper sharedHelper;
  final NavigationService navigationService;

  DioClient(
    this.authInterceptor,
    this.sharedHelper,
    this.navigationService,
  );
  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: Url.baseUrl!,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);

    dio.interceptors
      ..add(authInterceptor)
      ..add(
        ErrorInterceptor(
          sharedHelper,
          dio,
          navigationService,
        ),
      );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }
}
