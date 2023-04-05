import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/new_orders_model.dart';
import '../../data/model/orders_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.init() = InitOrderState;
  const factory OrderState.loading() = LoadingOrderState;
  const factory OrderState.error(String message) = ErrorOrderState;
  const factory OrderState.orderStatus(String status) = OrderStatusOrderState;
  const factory OrderState.success(List<NewOrders>? orderList, NewOrders? order) =
      LoadedOrderState;
  // const factory RestaurantState.hasRestaurant(bool hasCustomRestaurant) =
  //     HasRestaurantState;restaurantData
}
