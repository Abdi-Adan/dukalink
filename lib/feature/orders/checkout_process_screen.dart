// ignore_for_file: prefer_is_empty, use_build_context_synchronously

import 'package:dukalink_app/core/blocs/payment/payment_cubit.dart';
import 'package:dukalink_app/core/blocs/payment/payment_state.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/feature/commonWidget/login_auth_dialog.dart';
import 'package:dukalink_app/feature/home/home_screen.dart';
import 'package:dukalink_app/feature/orders/receipt_screen.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/size_config.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../responsive.dart';
import '../restaurant/new_order_progress.dart';
import '../restaurant/order_progress_bottomsheet.dart';
import '../restaurant/retstaurant_detail.dart';

// ignore: constant_identifier_names
enum LocatinDeclaration { in_restaurant, out_restaurant }

List<String> timeSlotes = [
  'Select the time',
  '5 Minutes',
  '15 Minutes',
  '30 Minutes',
  '01 Hour',
  '02 Hour',
];

enum paymentMethodsEnum { Mpesa, Cash, MasterCard, Nill }

// ...

paymentMethodsEnum? payMethod = paymentMethodsEnum.Nill;

Future<String?> chooseModeOfOrder(BuildContext context) async {
  Size size = MediaQuery.of(context).size;
  bool isWeb = Responsive.isTablet(context);

  return showDialog<String?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      bool dineInPressed = false;
      bool takeAwayPressed = false;
      String popValue = '';
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette
                                    .dukalinkBlack2, //                   <--- border color
                              ),
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: EdgeInsets.all(4.0.sm),
                            child: Icon(
                              Icons.close_outlined,
                              size: 10.sm,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[100]!,
                              width: 4, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(1.0.sm),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Palette.dukalinkBlack5,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                Assets.reserver,
                                // height: 50.h,
                                // width: 50.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              'How do you want to eat your food',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Palette.dukalinkBlack1),
                            ),
                          ),
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              'You can either sit in the restaurant or take the food with you.The choice is yours.',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.dukalinkBlack2),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            takeAwayPressed = false;
                            dineInPressed = true;
                            popValue = 'Dinnin';
                          });
                        },
                        child: SvgPicture.asset(
                          !dineInPressed ? Assets.dinIn : Assets.dinInColored,
                          width: isWeb ? size.width * 0.15 : size.width * 0.3,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            takeAwayPressed = true;
                            dineInPressed = false;
                            popValue = 'Takeaway';
                          });
                        },
                        child: SvgPicture.asset(
                          !takeAwayPressed
                              ? Assets.takeAway
                              : Assets.takeAwayColored,
                          width: isWeb ? size.width * 0.15 : size.width * 0.3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextButton(
                    text: 'Proceed',
                    displayLoading: false,
                    onTap: () {
                      if (popValue != '') {
                        Navigator.pop(context, popValue);
                      } else {
                        launchSnackbar(
                          context: context,
                          message: 'Please make a selection to proceed.',
                          okCallback: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                          type: SnackbarType.error,
                          dismissText: 'OK',
                        );
                      }
                    },
                    fontSize: 16.sp,
                    color: Palette.dukalinkBlack,
                    width: SizeConfig.screenWidth * 0.9,
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}

Future<String?> clientCurrentLocationDeclaration(BuildContext context) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      LocatinDeclaration declaration = LocatinDeclaration.in_restaurant;
      String popValue = LocatinDeclaration.in_restaurant.name;
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette
                                  .dukalinkBlack2, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 4, //                   <--- border color
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(1.0.sm),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Palette.dukalinkBlack5,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Assets.reserver,
                              // height: 50.h,
                              // width: 50.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            'We are not sure about your existance',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Palette.dukalinkBlack1),
                          ),
                        ),
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            'You can either sit in the restaurant or take the food with you.The choice is yours.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Palette.dukalinkBlack2),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                ListTile(
                  title: Text(
                    'I am in the restaurant',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: popValue == LocatinDeclaration.in_restaurant.name
                            ? Palette.dukalinkPrimaryColor
                            : Palette.dukalinkBlack2),
                  ),
                  leading: Radio<LocatinDeclaration>(
                    activeColor: Palette.dukalinkPrimaryColor,
                    value: LocatinDeclaration.in_restaurant,
                    groupValue: declaration,
                    onChanged: (LocatinDeclaration? value) {
                      setState(() {
                        declaration = value!;
                        popValue = value.name;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'I am on my way to restaurant',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color:
                            popValue == LocatinDeclaration.out_restaurant.name
                                ? Palette.dukalinkPrimaryColor
                                : Palette.dukalinkBlack2),
                  ),
                  leading: Radio<LocatinDeclaration>(
                    activeColor: Palette.dukalinkPrimaryColor,
                    value: LocatinDeclaration.out_restaurant,
                    groupValue: declaration,
                    onChanged: (LocatinDeclaration? value) {
                      setState(() {
                        declaration = value!;
                        popValue = value.name;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                CustomTextButton(
                  text: 'Proceed',
                  displayLoading: false,
                  onTap: () {
                    if (popValue != '') {
                      Navigator.pop(context, popValue);
                    } else {
                      launchSnackbar(
                        context: context,
                        message: 'Please make a selection to proceed.',
                        okCallback: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        type: SnackbarType.error,
                        dismissText: 'OK',
                      );
                    }
                  },
                  fontSize: 16.sp,
                  color: Palette.dukalinkBlack,
                  width: SizeConfig.screenWidth * 0.9,
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

Future<String?> setArrivalTime(BuildContext context) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      String popValue = '';
      String selectedValue = 'Select the time';
      DateTime dateTime = DateTime.now();
      bool isCustom = false;

      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette.dukalinkBlack2, //<--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 4, //                   <--- border color
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(1.0.sm),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Palette.dukalinkBlack5,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Assets.reserver,
                              // height: 50.h,
                              // width: 50.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            'When do you want us to start preparing your food?',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Palette.dukalinkBlack1),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Palette.dukalinkBlack5,
                              contentPadding: EdgeInsets.all(6.sm),
                              labelStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.dukalinkBlack2),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 12.0.sp),
                              // hintText: 'Please select expense',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            isEmpty: selectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedValue,
                                iconSize: 18,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                    popValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: <String>[
                                  'Select the time',
                                  '5 Minutes',
                                  '15 Minutes',
                                  '30 Minutes',
                                  '01 Hour',
                                  '02 Hour',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Palette.dukalinkBlack2),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomTextButton(
                      textcolor: Palette.dukalinkBlack1,
                      text: 'Custom',
                      displayLoading: false,
                      onTap: () {
                        if (isCustom) {
                          setState(() {
                            isCustom = false;
                            popValue = '';
                          });
                        } else {
                          setState(() {
                            popValue = '';
                            isCustom = true;
                          });
                        }
                      },
                      fontSize: 16.sp,
                      color: Palette.dukalinkPrimary4,
                      width: SizeConfig.screenWidth * 0.25,
                    ),
                  ],
                ),
                isCustom
                    ? SizedBox(
                        height: 20.h,
                      )
                    : const SizedBox.shrink(),
                isCustom
                    ? Container(
                        decoration: BoxDecoration(
                          color: Palette.dukalinkBlack5,
                          // border: Border.all()
                          borderRadius: BorderRadius.circular(10.sm),
                        ),
                        child: TimePickerSpinner(
                          is24HourMode: true,
                          normalTextStyle: const TextStyle(
                            fontSize: 20,
                            color: Palette.dukalinkBlack4,
                            fontWeight: FontWeight.w500,
                          ),
                          highlightedTextStyle: const TextStyle(
                            fontSize: 36,
                            color: Palette.dukalinkBlack1,
                            fontWeight: FontWeight.w700,
                          ),
                          spacing: 70,
                          itemHeight: 50,
                          isForce2Digits: true,
                          onTimeChange: (time) {
                            setState(() {
                              dateTime = time;
                              popValue = time.toIso8601String();
                            });
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 20.h,
                ),
                popValue != ''
                    ? SizedBox(
                        width: 190.w,
                        child: Text.rich(
                          TextSpan(
                              text: 'Your Food will be ready by: ',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.dukalinkBlack2),
                              children: [
                                TextSpan(
                                  text: '6:30pm',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Palette.dukalinkBlack2),
                                )
                              ]),
                        ),
                        // Text(
                        //   'Your Food will be ready by: 6:30pm',
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 3,
                        //   style: TextStyle(
                        //       fontSize: 12.sp,
                        //       fontWeight: FontWeight.w500,
                        //       color: Palette.dukalinkBlack2),
                        // ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextButton(
                  text: 'Done',
                  displayLoading: false,
                  onTap: () {
                    if (popValue != '') {
                      Navigator.pop(context, popValue);
                    } else {
                      launchSnackbar(
                        context: context,
                        message: 'Please make a selection to proceed.',
                        okCallback: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        type: SnackbarType.error,
                        dismissText: 'OK',
                      );
                    }
                  },
                  fontSize: 16.sp,
                  color: Palette.dukalinkBlack,
                  width: SizeConfig.screenWidth * 0.9,
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

Future<String?> payemntSelection(BuildContext context,
    {bool? isTakeaway, String? orderId}) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette
                                  .dukalinkBlack2, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 4, //                   <--- border color
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(1.0.sm),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Palette.dukalinkBlack5,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Assets.pay_card,
                              // height: 50.h,
                              // width: 50.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            'Your meal is being prepared!.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Palette.dukalinkBlack1),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            isTakeaway != null
                                ? '''On arrival at the restaurant, please scan a QR code on the table and press the bell icon and type in your order ID number ($orderId) in the chat box and your food will be brought to that table. Alternatively, reference this order ID number to a waiter. '''
                                : 'You can either sit in the restaurant or take your food with you.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Palette.dukalinkBlack2),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextButton(
                  text: 'Pay now',
                  displayLoading: false,
                  onTap: () {
                    Navigator.pop(context, 'pay_now');
                  },
                  fontSize: 16.sp,
                  color: Palette.dukalinkBlack,
                  width: SizeConfig.screenWidth * 0.9,
                ),
                SizedBox(
                  height: 10.h,
                ),
                // TODO removed paylater
                // CustomTextButton(
                //   text: 'Pay after meal',
                //   displayLoading: false,
                //   textcolor: Palette.dukalinkBlack,
                //   onTap: () {
                //     Navigator.pop(context, 'pay_later');
                //   },
                //   fontSize: 16.sp,
                //   color: Palette.dukalinkBlack4,
                //   width: SizeConfig.screenWidth * 0.9,
                // ),
              ],
            ),
          ),
        );
      });
    },
  );
}

Future<String?> paymentMethods(BuildContext context,
    {required String amount,
    required String orderId,
    required String restaurantCode,
    required String tableId,
    required String paymentOption,
    required String orderType,
    required List<String>? ids,
    required String deviceId}) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      TextEditingController cvvController = TextEditingController();
      TextEditingController mpesaNoController = TextEditingController();
      return StatefulBuilder(builder: (context, setState) {
        payCommand(
          ctx,
          tableId, {
          required String mpesaNo,
        }) {
          if (payMethod == paymentMethodsEnum.Cash) {
            String paymethod = 'Cash';
            inject<SharedHelper>().saveBool('new_order', true);
            ctx.read<PaymentCubit>().initiPayment(
                amount: amount,
                orderId: orderId,
                paymentPhoneNo: mpesaNo,
                restaurantCode: restaurantCode,
                tableId: tableId,
                paymentOption: paymentOption,
                paymentMode: paymethod,
                orderType: orderType,
                ids: ids,
                deviceId: deviceId);
          } else if (payMethod == paymentMethodsEnum.Mpesa) {
            String paymethod = 'Mpesa';

            ctx.read<PaymentCubit>().initiPayment(
                amount: amount,
                orderId: orderId,
                paymentPhoneNo: mpesaNo,
                restaurantCode: restaurantCode,
                tableId: tableId,
                paymentOption: paymentOption,
                paymentMode: paymethod,
                orderType: orderType,
                id: ids,
                deviceId: deviceId);
          } else {
            return launchSnackbar(
              context: context,
              message: 'Card payment coming soon.',
              okCallback: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              type: SnackbarType.info,
              dismissText: 'OK',
            );
          }
        }

        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette
                                  .dukalinkBlack2, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 4, //                   <--- border color
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(1.0.sm),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Palette.dukalinkBlack5,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Assets.pay_card,
                              // height: 50.h,
                              // width: 50.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      width: 190.w,
                      child: Text(
                        "Please select a payment method you'd like to proceed with",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Palette.dukalinkBlack1),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 190.w,
                      child: Text(
                        'Select payment method',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Palette.dukalinkBlack2),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        Row(children: [
                          Radio<paymentMethodsEnum>(
                            activeColor: Palette.dukalinkPrimary2,
                            value: paymentMethodsEnum.Mpesa,
                            groupValue: payMethod,
                            onChanged: (paymentMethodsEnum? value) {
                              setState(() {
                                payMethod = value;
                              });
                            },
                          ),
                          Text('Mpesa',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 7,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.dukalinkBlack2)),
                        ]),
                        Row(children: [
                          Radio<paymentMethodsEnum>(
                            value: paymentMethodsEnum.Cash,
                            activeColor: Palette.dukalinkPrimary2,
                            groupValue: payMethod,
                            onChanged: (paymentMethodsEnum? value) {
                              setState(() {
                                payMethod = value;
                              });
                            },
                          ),
                          Text('Cash',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 7,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.dukalinkBlack2)),
                        ]),
                        // Row(children: [
                        //   Radio<paymentMethodsEnum>(
                        //     value: paymentMethodsEnum.MasterCard,
                        //     activeColor: Palette.dukalinkPrimary2,
                        //     groupValue: payMethod,
                        //     onChanged: (paymentMethodsEnum? value) {
                        //       setState(() {
                        //         payMethod = value;
                        //       });
                        //     },
                        //   ),
                        //   SizedBox(
                        //     width: 50,
                        //     child: Text('MasterCard',
                        //         overflow: TextOverflow.ellipsis,
                        //         maxLines: 7,
                        //         style: TextStyle(
                        //             fontSize: 12.sp,
                        //             fontWeight: FontWeight.w500,
                        //             color: Palette.dukalinkBlack2)),
                        //   ),
                        // ]),
                      ]),
                    ),
                    SizedBox(height: 10.h),
                    if (payMethod == paymentMethodsEnum.Mpesa)
                      SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Phone number',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Palette.dukalinkBlack2)),
                            const SizedBox(height: 8),
                            TextField(
                              controller: mpesaNoController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(7.sm),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.dukalinkBlack2),
                                  hintText: "Enter phone number",
                                  fillColor: Palette.dukalinkBlack5),
                              //  onChanged: (){

                              //  },
                            ),
                          ],
                        ),
                      ),
                    // if (payMethod == paymentMethodsEnum.MasterCard)
                    //   Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       SizedBox(
                    //         height: 80,
                    //         width: MediaQuery.of(context).size.width * 0.7,
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: [
                    //             Text('Card number',
                    //                 overflow: TextOverflow.ellipsis,
                    //                 maxLines: 7,
                    //                 style: TextStyle(
                    //                     fontSize: 12.sp,
                    //                     fontWeight: FontWeight.w600,
                    //                     color: Palette.dukalinkBlack)),
                    //             const SizedBox(height: 8),
                    //             TextField(
                    //               controller: mpesaNoController,
                    //               decoration: InputDecoration(
                    //                   contentPadding: EdgeInsets.all(7.sm),
                    //                   border: const OutlineInputBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                       Radius.circular(8.0),
                    //                     ),
                    //                     borderSide: BorderSide.none,
                    //                   ),
                    //                   filled: true,
                    //                   hintStyle: TextStyle(
                    //                       fontSize: 12.sp,
                    //                       fontWeight: FontWeight.w500,
                    //                       color: Palette.dukalinkBlack2),
                    //                   hintText: "Enter card number",
                    //                   fillColor: Palette.dukalinkBlack5),
                    //               //  onChanged: (){

                    //               //  },
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 70,
                    //         child: Row(
                    //           children: [
                    //             Expanded(
                    //               flex: 7,
                    //               child: SizedBox(
                    //                 height: 80,
                    //                 width:
                    //                     MediaQuery.of(context).size.width * 0.7,
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: [
                    //                     Text('Expiry date',
                    //                         overflow: TextOverflow.ellipsis,
                    //                         maxLines: 7,
                    //                         style: TextStyle(
                    //                             fontSize: 12.sp,
                    //                             fontWeight: FontWeight.w600,
                    //                             color: Palette.dukalinkBlack)),
                    //                     const SizedBox(height: 8),
                    //                     TextField(
                    //                       controller: mpesaNoController,
                    //                       decoration: InputDecoration(
                    //                           contentPadding:
                    //                               EdgeInsets.all(7.sm),
                    //                           border: const OutlineInputBorder(
                    //                             borderRadius: BorderRadius.all(
                    //                               Radius.circular(8.0),
                    //                             ),
                    //                             borderSide: BorderSide.none,
                    //                           ),
                    //                           filled: true,
                    //                           hintStyle: TextStyle(
                    //                               fontSize: 12.sp,
                    //                               fontWeight: FontWeight.w500,
                    //                               color: Palette.dukalinkBlack2),
                    //                           hintText: "Enter Expiry dater",
                    //                           fillColor: Palette.dukalinkBlack5),
                    //                       //  onChanged: (){

                    //                       //  },
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             const SizedBox(width: 4),
                    //             Expanded(
                    //               flex: 3,
                    //               child: SizedBox(
                    //                 height: 80,
                    //                 width:
                    //                     MediaQuery.of(context).size.width * 0.7,
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: [
                    //                     Text('Cvv number',
                    //                         overflow: TextOverflow.ellipsis,
                    //                         maxLines: 7,
                    //                         style: TextStyle(
                    //                             fontSize: 12.sp,
                    //                             fontWeight: FontWeight.w600,
                    //                             color: Palette.dukalinkBlack)),
                    //                     const SizedBox(height: 8),
                    //                     TextField(
                    //                       controller: cvvController,

                    //                       decoration: InputDecoration(
                    //                           contentPadding:
                    //                               EdgeInsets.all(7.sm),
                    //                           border: const OutlineInputBorder(
                    //                             borderRadius: BorderRadius.all(
                    //                               Radius.circular(8.0),
                    //                             ),
                    //                             borderSide: BorderSide.none,
                    //                           ),
                    //                           filled: true,
                    //                           hintStyle: TextStyle(
                    //                               fontSize: 12.sp,
                    //                               fontWeight: FontWeight.w500,
                    //                               color: Palette.dukalinkBlack2),
                    //                           hintText: "Enter Cvv",
                    //                           fillColor: Palette.dukalinkBlack5),
                    //                       //  onChanged: (){

                    //                       //  },
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                BlocProvider(
                  create: (context) => inject<PaymentCubit>(),
                  child: BlocConsumer<PaymentCubit, PaymentState>(
                      listener: (ctx, state) async {
                    state.maybeWhen(
                        orElse: () {},
                        tableNo: (tableId) async {
                          // if (tableId != null) {
                          if (payMethod == paymentMethodsEnum.Cash) {
                            String paymethod = 'Cash';
                            inject<SharedHelper>().saveBool('new_order', true);
                            ctx.read<PaymentCubit>().initiPayment(
                                  amount: amount,
                                  orderId: orderId,
                                  paymentPhoneNo:
                                      mpesaNoController.text.isNotEmpty
                                          ? mpesaNoController.text.trim()
                                          : '',
                                  restaurantCode: restaurantCode,
                                  tableId: "",
                                  paymentOption: paymentOption,
                                  paymentMode: paymethod,
                                  orderType: orderType,
                                  deviceId: deviceId,
                                  ids: ids,
                                );
                          } else if (payMethod == paymentMethodsEnum.Mpesa) {
                            String paymethod = 'Mpesa';

                            ctx.read<PaymentCubit>().initiPayment(
                                  amount: amount,
                                  orderId: orderId,
                                  paymentPhoneNo: mpesaNoController.text.trim(),
                                  restaurantCode: restaurantCode,
                                  tableId: tableId!,
                                  paymentOption: paymentOption,
                                  paymentMode: paymethod,
                                  orderType: orderType,
                                  deviceId: deviceId,
                                  ids: ids,
                                );
                          } else {
                            return launchSnackbar(
                              context: context,
                              message: 'Card payment coming soon.',
                              okCallback: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                              type: SnackbarType.info,
                              dismissText: 'OK',
                            );
                          }
                          // } else {
                          //   // TODO write the login if from home- Pop context otherwise Show scan QR or enter table number manualy
                          //   // We are requesting the user to scan the qr on the table
                          //   // Navigator.pop(context);
                          //   // await scanTableQrRequest(context);
                          //   // // Map qrData = await scanQR(context);
                          //   // // String? tableId = await qrData['table_id'];

                          //   String? tableId = '';
                          //   // String? tableId = await setSittingTable(context);
                          //   if (tableId != null) {
                          //     Fimber.d("TABBBBLE ====> $tableId ");
                          //     ctx.read<PaymentCubit>().getTableId();
                          //   }
                          // }
                        },
                        error: (message) async {
                          launchSnackbar(
                            context: context,
                            message: message,
                            okCallback: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                            type: SnackbarType.error,
                            dismissText: 'OK',
                          );
                          if (message.toLowerCase().contains('login')) {
                            bool value = await loginDialog(context);

                            if (value) {
                              ctx.read<PaymentCubit>().getTableId();
                            }
                          }
                        },
                        success: (message) {
                          launchSnackbar(
                            context: context,
                            message: message,
                            okCallback: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                            type: SnackbarType.success,
                            dismissText: 'OK',
                          );
                          if (paymentOption.toLowerCase().contains('Cash')) {
                            Navigator.pushNamed(
                                context, RestaurantDetailScreen.routeName,
                                arguments: {'restaurant_code': restaurantCode});
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.routeName,
                              (route) => false,
                              arguments: {
                                'amount': amount,
                                'phone': mpesaNoController.text,
                                'restaurantCode': restaurantCode,
                              },
                            );
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => OrderProgressBottomSheet(
                            //         restaurantCode: '$id'))
                            //         );
// RestaurantDetailScreen
                            loadingPayment(context);
                            // successfulPayment(context);

                            // Navigator.pushNamed(
                            //     context, ReceiptScreen.routeName,
                            //     arguments: {
                            //       'amount': amount,
                            //       'phone': mpesaNoController.text,
                            //       'restaurantCode': restaurantCode
                            //     });
                            // Navigator.pushNamed(
                            //     context, HomeScreen.routeName,
                            //     arguments: {
                            //       'restaurant_code':
                            //           "07347d44-7fc7-43f4-a548-616a4178d7b0"
                            //     });
                          }
                        },
                        loading: () {
                          return const SpinKitCircle(
                            color: Palette.dukalinkPrimary1,
                          );
                        });
                  }, builder: (ctx, state) {
                    return CustomTextButton(
                      text: 'Proceed',
                      displayLoading: state is LoadingPaymentState,
                      onTap: () {
                        ctx.read<PaymentCubit>().getTableId();
                      },
                      fontSize: 16.sp,
                      color: Palette.dukalinkBlack,
                      width: SizeConfig.screenWidth * 0.9,
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

Future<String?> loadingPayment(
  BuildContext context,
) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette
                                  .dukalinkBlack2, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[100]!,
                          width: 4, //                   <--- border color
                        ),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.all(1.0.sm),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Palette.dukalinkBlack5,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            Assets.loading,
                            // height: 50.h,
                            // width: 50.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Just a second,',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Palette.dukalinkBlack2),
                ),
                Text(
                  'Your payment is being processed.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 7,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Palette.dukalinkBlack2),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Builder(builder: (context) {
                    return CustomTextButton(
                      text: 'OK',
                      displayLoading: false,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      fontSize: 16.sp,
                      color: Palette.dukalinkBlack,
                      width: SizeConfig.screenWidth * 0.9,
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

Future<String?> successfulPayment(
  BuildContext context,
) async {
  return showDialog<String?>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette
                                  .dukalinkBlack2, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[100]!,
                          width: 4, //                   <--- border color
                        ),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.all(1.0.sm),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Palette.dukalinkBlack5,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            Assets.tickCircle,
                            // height: 50.h,
                            // width: 50.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your  has been made successfully!',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Palette.dukalinkBlack2),
                  ),
                ])
              ],
            ),
          ),
        );
      });
}

Future<String?> scanTableQrRequest(
  BuildContext context,
) async {
  return showDialog<String?>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette
                                  .dukalinkBlack2, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Column(children: [
                  const SizedBox(height: 5),
                  Text(
                    // 'We realized we missed your table number!',
                    'We realized we missed your table number!',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Palette.dukalinkBlack2),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Kindly scan the QR on the table to proceed',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 7,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Palette.dukalinkBlack1),
                  ),
                ])
              ],
            ),
          ),
        );
      });
}

Future<String?> setSittingTable(BuildContext context) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      TextEditingController popValue = TextEditingController();
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette
                                  .dukalinkBlack2, //                   <--- border color
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.sm),
                          child: Icon(
                            Icons.close_outlined,
                            size: 10.sm,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 4, //                   <--- border color
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(1.0.sm),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Palette.dukalinkBlack5,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Assets.reserver,
                              // height: 50.h,
                              // width: 50.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            'Can you mention the number on your table?\nWe din\'t get it right',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Palette.dukalinkBlack1),
                          ),
                        ),
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            'It will be easy for us to deliver you the best experience if you let us know where you are sitting',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Palette.dukalinkBlack2),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                TextField(
                  controller: popValue,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7.sm),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Palette.dukalinkBlack2),
                      hintText: "Enter the table number",
                      fillColor: Palette.dukalinkBlack5),
                  //  onChanged: (){

                  //  },
                ),
                SizedBox(
                  height: 6.h,
                ),
                CustomTextButton(
                  text: 'Proceed',
                  displayLoading: false,
                  onTap: () async {
                    if (popValue.text.isNotEmpty) {
                      await inject<PaymentCubit>().saveTableId(popValue.text);
                      Navigator.pop(context, popValue.text);
                    } else {
                      launchSnackbar(
                        context: context,
                        message: "Please make a selection to proceed.",
                        okCallback: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        type: SnackbarType.success,
                        dismissText: 'OK',
                      );
                    }
                  },
                  fontSize: 16.sp,
                  color: Palette.dukalinkBlack,
                  width: SizeConfig.screenWidth * 0.9,
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
