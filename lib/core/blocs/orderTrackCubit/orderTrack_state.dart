import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../data/model/new_orders_model.dart';
// import '../../data/model/orders_model.dart';
import '../../data/model/orderTrackingModel.dart';
import '../../data/model/userOrdersModel.dart';

part 'orderTrack_state.freezed.dart';

@freezed
class OrderTrackState with _$OrderTrackState {
  const factory OrderTrackState.init() = InitOrderTrackState;
  const factory OrderTrackState.loading() = LoadingOrderTrackState;
  const factory OrderTrackState.error(String message) = ErrorOrderTrackState;
  const factory OrderTrackState.orderStatus(String status) = OrderTrackStatusOrderState;
  const factory OrderTrackState.success(OrderTrackingModel? orderValue) =
      LoadedOrderTrackState;

  // const factory RestaurantState.hasRestaurant(bool hasCustomRestaurant) =
  //     HasRestaurantState;restaurantData
}
