import 'dart:convert';

import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/api_error_res.dart';
import 'package:dukalink_app/core/data/model/login/login_response.dart';
import 'package:dukalink_app/core/network/api_provider.dart';

import '../../network/endpoints.dart';
import '../model/sign_up/signup_check_request.dart';

abstract class SignUpRepository {
  Future<LoginResponse?> signupUser(SignUpCheckRequest params);

  Future<String?> editUser(Map<String, dynamic> params, String userId);

  Future<LoginResponse?> getNewUserProfile(String userId);
}

class SignUpRepositoryImpl extends SignUpRepository {
  final ApiProvider apiProvider;
  final SharedHelper sharedHelper;

  SignUpRepositoryImpl({
    required this.apiProvider,
    required this.sharedHelper,
  });

  @override
  Future<LoginResponse?> signupUser(SignUpCheckRequest params) async {
    try {
      final res =
          await apiProvider.post(params.toJson(), EndPoints.register.url);
      if (res["status"]) {
        LoginResponse loginRes = LoginResponse.fromJson(res);
        await sharedHelper.saveAccessToken('${loginRes.accessToken}');
        await sharedHelper.saveUser(loginRes.user!);
        return loginRes;
      } else {
        final errors = ApiErrorRes.fromJson(res);
        throw errors.message ?? '${res["error"]}';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> editUser(Map<String, dynamic> params, String userId) async {
    try {
      final res =
          await apiProvider.post(params, '${EndPoints.editUser.url}/$userId');
      if (res["status"] == true) {
        // await getNewUserProfile(userId);
        return res['message'];
      } else {
        final errors = ApiErrorRes.fromJson(res);
        throw errors.message ?? '${res["error"]}';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponse?> getNewUserProfile(String userId) async {
    try {
      final res = await apiProvider.get('${EndPoints.editUser.url}/$userId');
      if (res["status"] == true) {
        LoginResponse loginRes = LoginResponse.fromJson(res);
        await sharedHelper.saveUser(loginRes.user!);
        return loginRes;
      } else {
        final errors = ApiErrorRes.fromJson(res);
        throw errors.message ?? '${res["error"]}';
      }
    } catch (e) {
      rethrow;
    }
  }
}
