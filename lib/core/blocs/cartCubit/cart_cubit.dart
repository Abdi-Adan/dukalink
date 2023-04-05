import 'package:dukalink_app/core/blocs/cartCubit/cart_state.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';

import 'package:dukalink_app/core/data/repository/orders_repository.dart';
import 'package:dukalink_app/shared/utils/utils.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../data/model/dishes_model.dart';
import '../../data/model/newFavoriteFoodModel.dart';
import '../../data/model/request/cart_request.dart';

class CartCubit extends Cubit<CartState> {
  final OrdersRepository ordersRepository;
  final SharedHelper sharedHelper;

  CartCubit({required this.ordersRepository, required this.sharedHelper})
      : super(const CartState.init());

  void createOrGetOrderId(String restaurantId) async {
    emit(const CartState.loading());
    String? orderId = await sharedHelper.getString(restaurantId);
    // String? deviceId = await PlatformDeviceId.getDeviceId;

    if (orderId != null) {
      emit(CartState.generateOrderId(orderId));
    } else {
      String orderid = await generateOrderId(restaurantId);
      Fimber.d("Creating a new order id $orderid");
      emit(CartState.generateOrderId(orderid));
    }

    // var docExists = (await FirebaseFirestore.instance
    //         .collection("userOrders")
    //         .doc("$deviceId")
    //         .get())
    //     .exists;
    // if (docExists) {
    //   String? orderId = await FirebaseFirestore.instance
    //       .collection("userOrders")
    //       .doc("$deviceId")
    //       .get()
    //       .then((value) async {
    //     if (value['isCompleted'] != null && value['isCompleted']) {
    //       return value["order_id"];
    //     } else {
    //       String orderid = await generateOrderId(restaurantId);
    //       Fimber.d("Creating a new order id $orderid");
    //       emit(CartState.generateOrderId(orderid));
    //     }
    //     return null;
    //   });
    //   Fimber.d("GEtting an order id $orderId");

    //   emit(CartState.generateOrderId("$orderId"));
    // } else {
    //   String orderid = await generateOrderId(restaurantId);
    //   Fimber.d("Creating a new order id $orderid");
    //   emit(CartState.generateOrderId(orderid));
    // }
  }

  void createOrderId(String restaurantId) async {
    emit(const CartState.loading());

    String orderid = await generateOrderId(restaurantId);
    Fimber.d("Creating a new order id $orderid");
    emit(CartState.generateOrderId(orderid));
  }

  void addItemToCart(
      {required String foodCode,
      required String quantity,
      required String restaurantId,
      required String orderId,
      required double amount,
      List<FoodAddon>? addOns,
      List<Sides>? sides,
      List<CartVariant>? orderVariant}) async {
    try {
      emit(const CartState.loading());
      String? deviceId = await PlatformDeviceId.getDeviceId;
      // List<int> addOn = [];
      List<String>? addOn = [];
      List<int> side = [];
      for (int i = 0; i < addOns!.length; i++) {
        // addOn.add(addOns[i].addon?.foodCode);
        addOn.add(addOns[i].addon!.foodCode!);
      }

      for (int i = 0; i < sides!.length; i++) {
        side.add(sides[i].id!);
      }

      final eitherResponse = await ordersRepository.addToCart(
          foodCode: foodCode,
          quantity: quantity,
          restaurantId: restaurantId,
          orderId: orderId,
          addOns: addOn,
          sides: side,
          deviceId: "$deviceId",
          amount: amount,
          variants: orderVariant);

      emit(
        eitherResponse.fold(
          (l) {
            return CartState.error(l.message ??
                l.detail ??
                'Unable to add item to cart at the moment. Try later');
          },
          (r) {
            return CartState.success(
              r,
              null,
            );
          },
        ),
      );
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  void removeItem(
      {required String restaurantCode,
      required String foodCode,
      required String orderID}) async {
    try {
      emit(const CartState.loading());

      final eitherResponse = await ordersRepository.deleteCartItem(
          restaurantCode: restaurantCode, foodCode: foodCode, orderID: orderID);

      emit(
        eitherResponse.fold(
          (l) {
            return CartState.error(l.message ??
                l.detail ??
                'Unable to remove order item at the moment. Try later');
          },
          (r) {
            return CartState.success(null, r);
          },
        ),
      );
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  void editItemQuantity(
      {required String restaurantCode,
      required String foodCode,
      required int quantity,
      required String orderId}) async {
    try {
      emit(const CartState.loading());

      final eitherResponse = await ordersRepository.editItemQuantity(
          restaurantCode: restaurantCode,
          foodCode: foodCode,
          quantity: quantity,
          orderID: orderId);

      emit(
        eitherResponse.fold(
          (l) {
            return CartState.error(l.message ??
                l.detail ??
                'Unable to modify order quantity at the moment. Try later');
          },
          (r) {
            return CartState.success(null, r);
          },
        ),
      );
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }
}
