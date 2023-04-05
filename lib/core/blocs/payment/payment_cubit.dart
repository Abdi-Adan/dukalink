import 'package:dukalink_app/core/blocs/payment/payment_state.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';

import 'package:dukalink_app/core/data/repository/payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/login/login_response.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository paymentRepository;
  final SharedHelper sharedHelper;

  PaymentCubit({
    required this.paymentRepository,
    required this.sharedHelper,
  }) : super(const PaymentState.init());

  void getTableId() async {
    emit(const PaymentState.loading());
    String? tableId = await sharedHelper.getString(table_id);
    if (tableId != null) {
      emit(PaymentState.tableNo(tableId));
    } else {
      emit(const PaymentState.tableNo(null));
    }
  }

  Future saveTableId(String tableId) async {
    await sharedHelper.saveString(table_id, tableId);
  }

  void initiPayment({
    required String amount,
    required String orderId,
    required String paymentPhoneNo,
    required String restaurantCode,
    required String tableId,
    required String paymentOption,
    required String paymentMode,
    required String orderType,
    required String deviceId,
    // required String id,
    required List<String>? ids,
  }) async {
    try {
      emit(const PaymentState.loading());
      User? user = await sharedHelper.getUsersData();
      var phoneForPayment = paymentPhoneNo;
      final eitherResponse = await paymentRepository.initPayment(
          amount: amount,
          orderId: orderId,
          paymentPhoneNo: "${phoneForPayment}",
          restaurantCode: restaurantCode,
          tableId: tableId,
          paymentOption: paymentOption,
          paymentMode: paymentMode,
          orderType: orderType,
          deviceId: deviceId,
          ids: ids);

      emit(
        eitherResponse.fold(
          (l) {
            return PaymentState.error(l.message ??
                l.detail ??
                'Unable to fetch make payment at the moment. Try later');
          },
          (r) {
            return PaymentState.success(
              r,
            );
          },
        ),
      );
    } catch (e) {
      emit(PaymentState.error(e.toString()));
    }
  }
}
