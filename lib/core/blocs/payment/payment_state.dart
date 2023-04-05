import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.init() = InitPaymentState;
  const factory PaymentState.loading() = LoadingPaymentState;
  const factory PaymentState.error(String message) = ErrorPaymentState;
  const factory PaymentState.tableNo(String? tableId) = TableNoPaymentState;
  const factory PaymentState.success(String message) = LoadedPaymentState;
  // const factory RestaurantState.hasRestaurant(bool hasCustomRestaurant) =
  //     HasRestaurantState;restaurantData
}
