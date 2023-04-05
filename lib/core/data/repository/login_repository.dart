import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/api_error_res.dart';
import 'package:dukalink_app/core/data/model/login/email_pss_login_req.dart';
import 'package:dukalink_app/core/data/model/login/login_response.dart';
import 'package:dukalink_app/core/network/api_provider.dart';

import '../../network/endpoints.dart';

abstract class LoginRepository {
  Future<LoginResponse?> loginUser(EmailPssLoginReq params);
}

class LoginRepositoryImpl extends LoginRepository {
  final ApiProvider apiProvider;
  final SharedHelper sharedHelper;

  LoginRepositoryImpl({
    required this.apiProvider,
    required this.sharedHelper,
  });

  @override
  Future<LoginResponse?> loginUser(EmailPssLoginReq params) async {
    try {
      final res = await apiProvider.post(params.toJson(), EndPoints.login.url);
      if (res["status"]) {
        LoginResponse loginRes = LoginResponse.fromJson(res);
        await sharedHelper.saveAccessToken('${loginRes.accessToken}');
        await sharedHelper.saveUser(loginRes.user!);
        return loginRes;
      } else {
        final errors = ApiErrorRes.fromJson(res);
        throw errors.message ?? 'Unable to login at the moment. Try later';
      }
    } catch (e) {
      rethrow;
    }
  }
}
