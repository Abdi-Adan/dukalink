import 'package:dukalink_app/core/data/model/notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.init() = InitNotificationState;
  const factory NotificationState.loading() = LoadingNotificationState;
  const factory NotificationState.error(String message) =
      ErrorNotificationState;
  const factory NotificationState.success(List<Notification>? notifications) =
      LoadedNotificationState;
  // const factory RestaurantState.hasRestaurant(bool hasCustomRestaurant) =
  //     HasRestaurantState;restaurantData
}
