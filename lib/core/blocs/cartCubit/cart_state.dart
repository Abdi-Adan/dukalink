import 'package:dukalink_app/core/data/model/order_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/orders_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.init() = InitCartState;
  const factory CartState.loading() = LoadingCartState;
  const factory CartState.generateOrderId(String message) = OrderIdCartState;
  const factory CartState.error(String message) = ErrorCartState;
  const factory CartState.success(OrderItem? orderItem, String? message) =
      LoadedCartState;
}
