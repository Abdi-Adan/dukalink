import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/api_error_res.dart';
import 'package:dukalink_app/core/data/model/notification_model.dart';
import 'package:dukalink_app/core/network/api_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';

import '../../network/endpoints.dart';

abstract class NotificationRepository {
  Future<Either<ApiErrorRes, List<Notification>>> getNotification();
}

class NotificationRepositoryImpl extends NotificationRepository {
  final ApiProvider apiProvider;
  final SharedHelper sharedHelper;

  NotificationRepositoryImpl({
    required this.apiProvider,
    required this.sharedHelper,
  });

  @override
  Future<Either<ApiErrorRes, List<Notification>>> getNotification() async {
    try {
      final user = await sharedHelper.getUsersData();
      final res = await apiProvider.get(
        '${EndPoints.initPayment.url}/${user?.id}',
      );

      if (res["status"] != null && res["status"]) {
        return Right(res['message']);
      } else {
        return Left(ApiErrorRes.fromJson(res));
        // throw errors.message ?? 'Unable to add item to cart. Try later';
      }
    } catch (e) {
      Fimber.e('EROROROR==> $e');
      rethrow;
    }
  }
}
