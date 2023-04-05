import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../data/model/new_orders_model.dart';
// import '../../data/model/orders_model.dart';
import '../../data/model/userOrdersModel.dart';

part 'orderHistory_state.freezed.dart';

@freezed
class OrderHistoryState with _$OrderHistoryState {
  const factory OrderHistoryState.init() = InitOrderHistoryState;
  const factory OrderHistoryState.loading() = LoadingOrderHistoryState;
  const factory OrderHistoryState.error(String message) = ErrorOrderHistoryState;
  const factory OrderHistoryState.orderStatus(String status) = OrderHistoryStatusOrderState;
  const factory OrderHistoryState.success(List<UserOrders>? orderList, UserOrders? order) =
      LoadedOrderHistoryState;

  // const factory RestaurantState.hasRestaurant(bool hasCustomRestaurant) =
  //     HasRestaurantState;restaurantData
}
