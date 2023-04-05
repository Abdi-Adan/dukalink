import 'package:dukalink_app/core/blocs/order/order_state.dart';

import 'package:dukalink_app/core/data/repository/orders_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrdersRepository ordersRepository;

  OrderCubit({
    required this.ordersRepository,
  }) : super(const OrderState.init());

  // void getUserOrders() async {
  //   try {
  //     emit(const OrderState.loading());

  //     final eitherResponse = await ordersRepository.getAllUserOrders();

  //     emit(
  //       eitherResponse.fold(
  //         (l) {
  //           return OrderState.error(l.message ??
  //               l.detail ??
  //               'Unable to fetch all orders at the moment. Try later');
  //         },
  //         (r) {
  //           return OrderState.success(r.data, null);
  //         },
  //       ),
  //     );
  //   } catch (e) {
  //     emit(OrderState.error(e.toString()));
  //   }
  // }

  void getUserUnfulfilledOrdes(String restaurantCode) async {
    try {
      emit(const OrderState.loading());

      final eitherResponse = await ordersRepository
          .getUserUnfulfilledOrdersInRestaurant(restaurantCode);

      emit(
        eitherResponse.fold(
          (l) {
            return OrderState.error(l.message ??
                l.detail ??
                'Unable to fetch unfulfilled orders at the moment. Try later');
          },
          (r) {
            return OrderState.success(r, null);
          },
        ),
      );
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }

  // void getUserFulfilledOrdes(String restaurantCode) async {
  //   try {
  //     emit(const OrderState.loading());

  //     final eitherResponse = await ordersRepository
  //         .getUserFulfilledOrdersInRestaurant(restaurantCode);

  //     emit(
  //       eitherResponse.fold(
  //         (l) {
  //           return OrderState.error(l.message ??
  //               l.detail ??
  //               'Unable to fetch Fulfilled orders at the moment. Try later');
  //         },
  //         (r) {
  //           return OrderState.success(null, r);
  //         },
  //       ),
  //     );
  //   } catch (e) {
  //     emit(OrderState.error(e.toString()));
  //   }
  // }
}
