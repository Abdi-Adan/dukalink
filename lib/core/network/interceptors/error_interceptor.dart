// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/errors.dart';
import 'package:dukalink_app/core/services/navigation_service.dart';

class ErrorInterceptor extends Interceptor {
  final SharedHelper sharedHelper;
  final Dio dio;
  final NavigationService navigationService;

  ErrorInterceptor(this.sharedHelper, this.dio, this.navigationService);
  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    var rAccToken = await sharedHelper.isAccessTokenRefreshed();
    if (rAccToken) {
      await sharedHelper.clearKey(refreshed_access_token);
    }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(
      DioError err, ErrorInterceptorHandler errorInterceptorHandler) async {
    Fimber.e('Error : $err');
    switch (err.type) {
      case DioErrorType.cancel:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
        err.error = 'errorConnectingToServer'.tr();
        break;
      case DioErrorType.other:
        err.error = 'errorProcessingYourRequest'.tr();
        break;
      case DioErrorType.response:
        if (err.response?.data != null) {
          if (err.response?.data is String) {
            err.error = '${err.response?.statusCode}: ${err.response?.data}';
          } else {
            try {
              // errors object is available
              ErrorsModel errorObj = ErrorsModel.fromJson(err.response?.data);

              if (errorObj.errors != null) {
                err.error = '${errorObj.errors?.first.message}'.tr();
              } else {
                //top level message key
                err.error = err.response?.data['message'];
              }
            } catch (e) {
              Fimber.e('Error : $e');
            }
          }

          if (err.response?.statusCode == 404 && err.response!.data is String) {
            err.error = '${err.response?.statusCode} ${"pageNotFound".tr()}';
          }
          if (err.response?.statusCode == 500) {
            err.error = 'internalSeverError'.tr();
          }
          if (err.response?.statusCode == 403 ||
              err.response?.statusCode == 401) {
            // return await _requestNewToken(err);
            err.error = 'anauthorised'.tr();
          }
          if ((err.response?.statusCode ?? 501) >= 501) {
            err.error = 'badGetWayError'.tr();
          }
        } else {
          err.error = 'errorProcessingYourRequest'.tr();
        }
        break;
    }
    return super.onError(err, errorInterceptorHandler);
  }

  // Request new token
  // ignore: missing_return
  // Future<Response?> _requestNewToken(DioError error) async {
  //   /* handles multiple requests */

  //   var rAccToken = await sharedHelper.isAccessTokenRefreshed();
  //   if (rAccToken) {
  //     var options = error.requestOptions;
  //     var accessToken = await sharedHelper.getAccessToken();
  //     options.headers['authorization'] = accessToken;

  //     return await dio.request(options.path, options: options.data);
  //   }

  //   _toggleLocks(true);

  //   /* fetch new token using the refresh token */
  //   final refreshToken = await sharedHelper.getRefreshToken();
  //   Fimber.i('Requesting new token with: $refreshToken');

  //   try {
  //     //TODO manual test
  //     var refreshTokenResponse = await dio.post(EndPoints.refreshToken.url,
  //         data: {'refresh_token': refreshToken});
  //     if (refreshTokenResponse.statusCode == 200) {
  //       /* save token  */
  //       var accessToken =
  //           (refreshTokenResponse.data as String).replaceAll('\n', '').trim();

  //       await sharedHelper.saveAccessToken(accessToken);

  //       /* set it to header */
  //       var options = error.requestOptions;
  //       options.headers['authorization'] = accessToken;

  //       /* proceed with request */
  //       _toggleLocks(false);

  //       return await dio.request(options.path, options: options.data);
  //     } else {
  //       await _logOut(error);
  //     }
  //   } on DioError catch (e) {
  //     Fimber.e('Error requesting new token ->$e');
  //     await _logOut(error);
  //   }
  // }

  Future<void> _logOut(error) async {
    _toggleLocks(false);
    // await navigationService.logOutUser();
  }

  void _toggleLocks(bool shouldLock) {
    if (shouldLock) {
      dio.lock();
      dio.interceptors.errorLock.lock();
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();
    } else {
      dio.unlock();
      dio.interceptors.errorLock.unlock();
      dio.interceptors.requestLock.unlock();
      dio.interceptors.responseLock.unlock();
    }
  }
}
