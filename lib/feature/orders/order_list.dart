// ignore_for_file: prefer_is_empty
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dukalink_app/core/blocs/cartCubit/cart_cubit.dart';
import 'package:dukalink_app/core/blocs/cartCubit/cart_state.dart';
import 'package:dukalink_app/core/blocs/order/order_cubit.dart';
import 'package:dukalink_app/core/blocs/order/order_state.dart';
import 'package:dukalink_app/core/blocs/payment/payment_state.dart';
import 'package:dukalink_app/core/data/model/login/login_response.dart';
import 'package:dukalink_app/core/data/model/new_orders_model.dart';
import 'package:dukalink_app/core/data/model/order_item.dart';
import 'package:dukalink_app/feature/commonWidget/login_auth_dialog.dart';
import 'package:dukalink_app/feature/orders/checkout_process_screen.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/size_config.dart';
import 'package:dukalink_app/shared/utils/constants.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/blocs/payment/payment_cubit.dart';
import '../../core/data/local/shared_preference_helper.dart';
import '../../core/di/injector.dart';
import '../qrScanner/scan_at_any_widget.dart';
import '../restaurant/retstaurant_detail.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:dukalink_app/shared/utils/constants.dart';

class OrderListScreen extends StatefulWidget {
  static const routeName = 'OrderListScreen';

  OrderListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  int count = 0;
  String? restaurant_code;
  var overraltotalPrice = 0.0;
  var overraltotalPricePlusAddons;
  List<String>? orderIDs = [];
  bool itemDelete = false;
  List<NewOrders> newList = [];

  User? currentUser;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      restaurant_code = args['restaurant_code'] as String;
      overraltotalPricePlusAddons = args['totalPlusExtras'];
    }
    // if (args != null) {

    // }
    getUser();

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  getUser() async {
    // final SharedHelper sharedHelper;
    User? user = await inject<SharedHelper>().getUsersData();
    debugPrint("${user!.firstName}");
    // User? user = await sharedHelper.getUsersData();
    setState(() {
      currentUser = user;
    });
  }

  void totalCartAmount() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        iconTheme: const IconThemeData(color: Palette.dukalinkBlack),
        elevation: 0,
        title: Text(
          'Order',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Palette.dukalinkBlack),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
              text: 'Add more items',
              displayLoading: false,
              onTap: () async {
                Navigator.pushReplacementNamed(
                    context, RestaurantDetailScreen.routeName,
                    arguments: {'restaurant_code': restaurant_code});
              },
              fontSize: 16.sp,
              color: Palette.dukalinkPrimaryColor,
              width: SizeConfig.screenWidth * 0.4,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            inject<OrderCubit>()..getUserUnfulfilledOrdes(restaurant_code!),
        child:
            BlocConsumer<OrderCubit, OrderState>(listener: (ctx, state) async {
          state.maybeWhen(
              orElse: () {},
              error: (message) async {
                launchSnackbar(
                  context: context,
                  message: message,
                  okCallback: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  type: SnackbarType.error,
                  dismissText: 'OK',
                );
              },
              success: (orderlist, order) {
                // Todo uncomment this
                // Fimber.d('ORderItem ${order?.orderItem?[0].dateCreated}');

                setState(() {
                  // restaurant_code =
                  //     order?.orderItem?[0].food?.menuCategory?.restaurantCode;
                });
              });
        }, builder: (ctx, state) {
          return state.maybeWhen(
              orElse: () => const SizedBox(),
              error: (message) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(height: 50),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(height: 50),
                      Card(
                        elevation: 2,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Palette.dukalinkPrimary1,
                          backgroundImage: AssetImage('assets/icons/cart.png'),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text('Your cart is empty.',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      Text(
                          'Looks like you have not yet added any items to your cart order.',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
              loading: () {
                return const Center(
                  child: SpinKitThreeBounce(
                    color: Palette.dukalinkPrimary1,
                  ),
                );
              },
              success: (orderlist, order) {
                // List<OrderItem>? orderItemList = order?.orderItem;
                List<NewOrders>? orderItemList = orderlist;
                overraltotalPrice = 0.0;

                if (itemDelete == false) {
                  // List<NewOrders>?
                  newList = List.from(orderItemList ?? []);
                }
                if (orderItemList!.length == newList.length) {
                  newList = List.from(orderItemList ?? []);
                }

                for (var item in newList!) {
                  // setState(() {
                  overraltotalPrice += item.totalPrice!;

                  // });
                }
                debugPrint("Price after remove from cart ${overraltotalPrice}");
                return newList?.length == 0
                    ? Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(height: 50),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/icons/cart.png'))),
                            ),
                            const SizedBox(height: 30),
                            const Text('Your cart is empty.',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 15),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  'Looks like you have not yet added any items to your cart order.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                                key: UniqueKey(),
                                shrinkWrap: true,
                                itemCount: newList?.length,
                                itemBuilder: (context, index) {
                                  NewOrders? orderItem = newList![index];

                                  //  NewOrders? orderItem = orderItemList[index];
                                  // count = orderItem.quantity ?? 1;
                                  count = orderItem!.quantity!;

                                  return BlocProvider(
                                    create: (context) => inject<CartCubit>(),
                                    child: BlocConsumer<CartCubit, CartState>(
                                        listener: (ctx, state) async {
                                      state.maybeWhen(
                                          orElse: () {},
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
                                            if (message
                                                .toLowerCase()
                                                .contains('login')) {
                                              bool value =
                                                  await loginDialog(context);
                                              if (!mounted) return null;
                                              if (value) {
                                                ctx
                                                    .read<CartCubit>()
                                                    .removeItem(
                                                      restaurantCode:
                                                          // '${orderItem.food?.menuCategory?.restaurantCode}',
                                                          '${restaurant_code}',
                                                      foodCode:
                                                          '${orderItem.food?.foodCode}',
                                                      orderID:
                                                          '${orderItem.id}',
                                                    );
                                              }
                                            }
                                          },
                                          success: (orderlist, message) {
                                            launchSnackbar(
                                              context: context,
                                              message: message ?? '',
                                              okCallback: () {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                              },
                                              type: SnackbarType.success,
                                              dismissText: 'OK',
                                            );
                                          });
                                    }, builder: (ctx, state) {
                                      return Builder(builder: (context) {
                                        return DismissibleTile(
                                          key: Key(orderItem.id!),
                                          // direction:
                                          //     DismissDirection.endToStart,
                                          onDismissed: (direction) {
                                            ctx.read<CartCubit>().removeItem(
                                                  restaurantCode:
                                                      '${restaurant_code}',
                                                  foodCode:
                                                      '${orderItem.food?.foodCode}',
                                                  orderID: '${orderItem.id}',
                                                );
                                            setState(() {
                                              newList.remove(orderItem);
                                              itemDelete = true;
                                            });
                                            debugPrint("NEW LIST${newList}");
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Container(
                                              color: Colors.white,
                                              child: Row(children: [
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      '${orderItem.food?.foodImageJson?.first.url}',
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    height: 60.h,
                                                    width: 60.h,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                      border: Border.all(
                                                        color: Palette
                                                            .dukalinkPrimary2, // red as border color
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                    ),
                                                  ),
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                    'assets/images/loading.gif',
                                                    fit: BoxFit.cover,
                                                    width: 60,
                                                    height: 60,
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  fit: BoxFit.fill,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        '${orderItem.food?.foodName}',
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Palette
                                                                .dukalinkBlack)),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                        '${orderItem!.food!.variants!.isNotEmpty ? orderItem!.totalPrice : orderItem.food!.price}',
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Palette
                                                                .dukalinkBlack3)),
                                                  ],
                                                ),
                                                const Spacer(),
                                                // TODO uncomment this
                                                orderItem.food!.variants!
                                                        .isNotEmpty
                                                    ? SizedBox()
                                                    : QuantityCounter(
                                                        orderItem: orderItem,
                                                        restaurant_code:
                                                            restaurant_code,
                                                      ),
                                              ]),
                                            ),
                                          ),
                                        );
                                      });
                                    }),
                                  );
                                }),
                            const Divider(),
                            SizedBox(height: 10.h),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: ListTile(
                                title: Text('Subtotal',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Palette.dukalinkBlack1)),
                                trailing: Text('Kshs ${overraltotalPrice}',
                                    // trailing: Text('Kshs ${order?.getTotal}',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Palette.dukalinkBlack1)),
                              ),
                            ),
                            // TODO remove tax element
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 8.0, right: 8),
                            //   child: ListTile(
                            //     title: Text('VAT',
                            //         style: TextStyle(
                            //             fontSize: 16.sp,
                            //             fontWeight: FontWeight.w400,
                            //             color: Palette.dukalinkBlack1)),
                            //     // trailing: Text('Kshs ${order?.coupon ?? 20}'),
                            //     trailing: Text('Kshs N/A'),
                            //   ),
                            // ),
                            const Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: ListTile(
                                title: Text('(${orderlist?.length} items)',
                                    // '(${order?.quantity} items)',
                                    // "Total amount",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Palette.dukalinkBlack1)),
                                // trailing: Text('Kshs ${order?.getTotal}',
                                trailing: Text('Kshs ${overraltotalPrice}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Palette.dukalinkPrimary1,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            BlocProvider(
                              create: (context) => inject<PaymentCubit>(),
                              child: BlocConsumer<PaymentCubit, PaymentState>(
                                listener: (ctx, state) async {
                                  // orderIDs = [];
                                  // for (var i = 0;
                                  //     i < orderItemList!.length;
                                  //     i++) {
                                  //   orderIDs
                                  //       ?.add(orderItemList[i].id.toString());
                                  // }
                                  state.maybeWhen(
                                      orElse: () {},
                                      tableNo: (tableId) async {
                                        orderIDs = [];
                                        for (var i = 0;
                                            i < orderItemList!.length;
                                            i++) {
                                          orderIDs?.add(
                                              orderItemList[i].id.toString());
                                        }
                                        if (tableId != null) {
                                          // Todo uncomment this

                                          ctx.read<PaymentCubit>().initiPayment(
                                                amount: '${overraltotalPrice}',
                                                orderId:
                                                    '${orderItemList?[0].orderId}',
                                                paymentPhoneNo: "",
                                                restaurantCode:
                                                    '${restaurant_code}',
                                                // restaurantCode:
                                                //     '${order?.restaurant?.restaurantCode}',
                                                tableId: tableId,
                                                paymentOption: "Paylater",
                                                paymentMode: "Cash",
                                                orderType: "Dinnin",
                                                // "order_id": "MARWEDNESDAY1678277229836",

                                                // id: "${orderItemList?[0].id}",
                                                deviceId:
                                                    '${orderItemList?[0].deviceId}',
                                                ids: orderIDs,
                                              );
                                        } else {
                                          // We are requesting the user to scan the qr on the table
                                          await scanTableQrRequest(context);
                                          if (!mounted) return;
// Todo Uncomment here for qr data
                                          // Map qrData = await scanQR(context);

                                          String? tableId =
                                              await setSittingTable(context);
                                          if (tableId != null) {
                                            Fimber.d(
                                                "TABBBBLE ====> $tableId ");
                                            if (!mounted) return;
                                            ctx
                                                .read<PaymentCubit>()
                                                .getTableId();
                                          }
                                        }
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
                                        if (message
                                            .toLowerCase()
                                            .contains('login')) {
                                          bool value =
                                              await loginDialog(context);

                                          if (value) {
                                            if (!mounted) return;
                                            ctx
                                                .read<PaymentCubit>()
                                                .getTableId();
                                          }
                                        }
                                      },
                                      success: (message) {
                                        Navigator.pushNamed(context,
                                            RestaurantDetailScreen.routeName,
                                            arguments: {
                                              'restaurant_code':
                                                  // '${order?.restaurant?.restaurantCode}'
                                                  '${restaurant_code}'
                                            });
                                      },
                                      loading: () {
                                        return const SpinKitCircle(
                                          color: Palette.dukalinkPrimary1,
                                        );
                                      });
                                },
                                builder: (ctx, state) {
                                  var isScanMode = isQRScanned.value;
                                  return CustomTextButton(
                                    text: 'Place order',
                                    displayLoading:
                                        state is LoadingPaymentState,
                                    onTap: () async {
                                      // TODO add when table number is present the user signs in first

                                      if (tableID.value != '') {
                                        orderIDs = [];
                                        for (var i = 0;
                                            i < orderItemList!.length;
                                            i++) {
                                          orderIDs?.add(
                                              orderItemList[i].id.toString());
                                        }
                                        if (!mounted) return;
                                        String? modeOfOrderValue =
                                            await chooseModeOfOrder(context);
                                        Fimber.d(
                                            "ORDER MODE $modeOfOrderValue");
                                        if (!mounted) return;
                                        if (modeOfOrderValue != null) {
                                          String? arrivalTime = "";
                                          if (modeOfOrderValue
                                              .contains('Takeaway')) {
                                            if (!isScanMode) {
                                              arrivalTime =
                                                  await setArrivalTime(context);
                                            }
                                          }
                                          Fimber.d("CLIENT LOCATION ");
                                          if (!mounted) return;

                                          if (modeOfOrderValue
                                              .contains('take_away')) {
                                            if (!mounted) return;
                                            String? paymentType =
                                                await payemntSelection(context,
                                                    isTakeaway: true,
                                                    orderId:
                                                        '${orderItemList?[0].orderId}');
                                            Fimber.d("PAYMENT ");
                                            if (paymentType != null) {
                                              if (paymentType
                                                  .contains('pay_now')) {
                                                String paymentoption =
                                                    paymentType == 'pay_now'
                                                        ? 'Paynow'
                                                        : paymentType ==
                                                                'split_pay'
                                                            ? 'Splitpay'
                                                            : 'Paylater';
                                                Fimber.d("PAYMENT TYPE ");
                                                if (!mounted) return;

                                                // orderIDs = orderItemList.map(
                                                //     (e) => e.id.toString());

                                                // orderIDs
                                                //     .add(orderItemList[index].id);
                                                debugPrint(
                                                    "LIST OF ORDER IDs $orderIDs");
                                                await paymentMethods(
                                                  context,
                                                  amount:
                                                      '${overraltotalPrice}',
                                                  orderId:
                                                      '${orderItemList?[0].orderId}',
                                                  restaurantCode:
                                                      // '${order?.restaurant?.restaurantCode}',
                                                      '${restaurant_code}',
                                                  tableId: tableID.value,
                                                  paymentOption: paymentoption,
                                                  orderType: modeOfOrderValue,
                                                  ids: orderIDs,
                                                  deviceId:
                                                      '${orderItemList?[0].deviceId}',
                                                );
                                              } else {
                                                Fimber.d(
                                                    "PAYMENT $paymentType ");
                                                if (!mounted) return;
                                                ctx
                                                    .read<PaymentCubit>()
                                                    .getTableId();
                                              }
                                            }
                                          } else {
                                            // String? tableNo =
                                            //     await setSittingTable(context);
                                            // Fimber.d("TABLE ID ");
                                            // if (tableNo != null) {
                                            if (!mounted) return;
                                            String? paymentType =
                                                await payemntSelection(context);
                                            // Fimber.d("PAYMENT ");
                                            if (paymentType != null) {
                                              if (paymentType
                                                  .contains('pay_now')) {
                                                String paymentOption =
                                                    paymentType == 'pay_now'
                                                        ? 'Paynow'
                                                        : 'paymentOption' ==
                                                                'split_pay'
                                                            ? 'Splitpay'
                                                            : 'Paylater';
                                                if (!mounted) return;
                                                // TODO uncomment this
                                                await paymentMethods(
                                                  context,
                                                  amount:
                                                      '${overraltotalPrice}',
                                                  orderId:
                                                      '${orderItemList?[0].orderId}',
                                                  restaurantCode:
                                                      '${restaurant_code}',
                                                  tableId: tableID.value,
                                                  paymentOption: paymentOption,
                                                  orderType: modeOfOrderValue,
                                                  deviceId:
                                                      '${orderItemList?[0].deviceId}',
                                                  ids: orderIDs,
                                                );
                                              } else {
                                                Fimber.d(
                                                    "PAYMENT $paymentType ");
                                                if (!mounted) return;
                                                ctx
                                                    .read<PaymentCubit>()
                                                    .getTableId();
                                              }
                                            }
                                            // }
                                          }
                                        }
                                      } else {
                                        // User? user =
                                        //     await sharedHelper?.getUsersData();
                                        // debugPrint("MYUSER ${user?.id}");
                                        if (currentUser == null) {
                                          bool value =
                                              await loginDialog(context);
                                          if (value) {
                                            orderIDs = [];
                                            for (var i = 0;
                                                i < orderItemList!.length;
                                                i++) {
                                              orderIDs?.add(orderItemList[i]
                                                  .id
                                                  .toString());
                                            }
                                            if (!mounted) return;
                                            String? modeOfOrderValue =
                                                await chooseModeOfOrder(
                                                    context);
                                            Fimber.d(
                                                "ORDER MODE $modeOfOrderValue");
                                            if (!mounted) return;
                                            if (modeOfOrderValue != null) {
                                              String? arrivalTime = "";
                                              if (modeOfOrderValue
                                                  .contains('Takeaway')) {
                                                if (!isScanMode) {
                                                  arrivalTime =
                                                      await setArrivalTime(
                                                          context);
                                                }
                                              }
                                              Fimber.d("CLIENT LOCATION ");
                                              if (!mounted) return;

                                              if (modeOfOrderValue
                                                  .contains('take_away')) {
                                                if (!mounted) return;
                                                String? paymentType =
                                                    await payemntSelection(
                                                        context,
                                                        isTakeaway: true,
                                                        orderId:
                                                            '${orderItemList?[0].orderId}');
                                                Fimber.d("PAYMENT ");
                                                if (paymentType != null) {
                                                  if (paymentType
                                                      .contains('pay_now')) {
                                                    String paymentoption =
                                                        paymentType == 'pay_now'
                                                            ? 'Paynow'
                                                            : paymentType ==
                                                                    'split_pay'
                                                                ? 'Splitpay'
                                                                : 'Paylater';
                                                    Fimber.d("PAYMENT TYPE ");
                                                    if (!mounted) return;

                                                    // orderIDs = orderItemList.map(
                                                    //     (e) => e.id.toString());

                                                    // orderIDs
                                                    //     .add(orderItemList[index].id);
                                                    debugPrint(
                                                        "LIST OF ORDER IDs $orderIDs");
                                                    await paymentMethods(
                                                      context,
                                                      amount:
                                                          '${overraltotalPrice}',
                                                      orderId:
                                                          '${orderItemList?[0].orderId}',
                                                      restaurantCode:
                                                          // '${order?.restaurant?.restaurantCode}',
                                                          '${restaurant_code}',
                                                      tableId: '',
                                                      paymentOption:
                                                          paymentoption,
                                                      orderType:
                                                          modeOfOrderValue,
                                                      ids: orderIDs,
                                                      deviceId:
                                                          '${orderItemList?[0].deviceId}',
                                                    );
                                                  } else {
                                                    Fimber.d(
                                                        "PAYMENT $paymentType ");
                                                    if (!mounted) return;
                                                    ctx
                                                        .read<PaymentCubit>()
                                                        .getTableId();
                                                  }
                                                }
                                              } else {
                                                // String? tableNo =
                                                //     await setSittingTable(context);
                                                // Fimber.d("TABLE ID ");
                                                // if (tableNo != null) {
                                                if (!mounted) return;
                                                String? paymentType =
                                                    await payemntSelection(
                                                        context);
                                                // Fimber.d("PAYMENT ");
                                                if (paymentType != null) {
                                                  if (paymentType
                                                      .contains('pay_now')) {
                                                    String paymentOption =
                                                        paymentType == 'pay_now'
                                                            ? 'Paynow'
                                                            : 'paymentOption' ==
                                                                    'split_pay'
                                                                ? 'Splitpay'
                                                                : 'Paylater';
                                                    if (!mounted) return;
                                                    // TODO uncomment this
                                                    await paymentMethods(
                                                      context,
                                                      amount:
                                                          '${overraltotalPrice}',
                                                      orderId:
                                                          '${orderItemList?[0].orderId}',
                                                      restaurantCode:
                                                          '${restaurant_code}',
                                                      tableId: "",
                                                      paymentOption:
                                                          paymentOption,
                                                      orderType:
                                                          modeOfOrderValue,
                                                      deviceId:
                                                          '${orderItemList?[0].deviceId}',
                                                      ids: orderIDs,
                                                    );
                                                  } else {
                                                    Fimber.d(
                                                        "PAYMENT $paymentType ");
                                                    if (!mounted) return;
                                                    ctx
                                                        .read<PaymentCubit>()
                                                        .getTableId();
                                                  }
                                                }
                                                // }
                                              }
                                            }
                                          }
                                          // }
                                        } else {
                                          // if (value) {
                                          orderIDs = [];
                                          for (var i = 0;
                                              i < orderItemList!.length;
                                              i++) {
                                            orderIDs?.add(
                                                orderItemList[i].id.toString());
                                          }
                                          if (!mounted) return;
                                          String? modeOfOrderValue =
                                              await chooseModeOfOrder(context);
                                          Fimber.d(
                                              "ORDER MODE $modeOfOrderValue");
                                          if (!mounted) return;
                                          if (modeOfOrderValue != null) {
                                            String? arrivalTime = "";
                                            if (modeOfOrderValue
                                                .contains('Takeaway')) {
                                              if (!isScanMode) {
                                                arrivalTime =
                                                    await setArrivalTime(
                                                        context);
                                              }
                                            }
                                            Fimber.d("CLIENT LOCATION ");
                                            if (!mounted) return;

                                            if (modeOfOrderValue
                                                .contains('take_away')) {
                                              if (!mounted) return;
                                              String? paymentType =
                                                  await payemntSelection(
                                                      context,
                                                      isTakeaway: true,
                                                      orderId:
                                                          '${orderItemList?[0].orderId}');
                                              Fimber.d("PAYMENT ");
                                              if (paymentType != null) {
                                                if (paymentType
                                                    .contains('pay_now')) {
                                                  String paymentoption =
                                                      paymentType == 'pay_now'
                                                          ? 'Paynow'
                                                          : paymentType ==
                                                                  'split_pay'
                                                              ? 'Splitpay'
                                                              : 'Paylater';
                                                  Fimber.d("PAYMENT TYPE ");
                                                  if (!mounted) return;

                                                  // orderIDs = orderItemList.map(
                                                  //     (e) => e.id.toString());

                                                  // orderIDs
                                                  //     .add(orderItemList[index].id);
                                                  debugPrint(
                                                      "LIST OF ORDER IDs $orderIDs");
                                                  await paymentMethods(
                                                    context,
                                                    amount:
                                                        '${overraltotalPrice}',
                                                    orderId:
                                                        '${orderItemList?[0].orderId}',
                                                    restaurantCode:
                                                        // '${order?.restaurant?.restaurantCode}',
                                                        '${restaurant_code}',
                                                    tableId: '',
                                                    paymentOption:
                                                        paymentoption,
                                                    orderType: modeOfOrderValue,
                                                    ids: orderIDs,
                                                    deviceId:
                                                        '${orderItemList?[0].deviceId}',
                                                  );
                                                } else {
                                                  Fimber.d(
                                                      "PAYMENT $paymentType ");
                                                  if (!mounted) return;
                                                  ctx
                                                      .read<PaymentCubit>()
                                                      .getTableId();
                                                }
                                              }
                                            } else {
                                              // String? tableNo =
                                              //     await setSittingTable(context);
                                              // Fimber.d("TABLE ID ");
                                              // if (tableNo != null) {
                                              if (!mounted) return;
                                              String? paymentType =
                                                  await payemntSelection(
                                                      context);
                                              // Fimber.d("PAYMENT ");
                                              if (paymentType != null) {
                                                if (paymentType
                                                    .contains('pay_now')) {
                                                  String paymentOption =
                                                      paymentType == 'pay_now'
                                                          ? 'Paynow'
                                                          : 'paymentOption' ==
                                                                  'split_pay'
                                                              ? 'Splitpay'
                                                              : 'Paylater';
                                                  if (!mounted) return;
                                                  // TODO uncomment this
                                                  await paymentMethods(
                                                    context,
                                                    amount:
                                                        '${overraltotalPrice}',
                                                    orderId:
                                                        '${orderItemList?[0].orderId}',
                                                    restaurantCode:
                                                        '${restaurant_code}',
                                                    tableId: "",
                                                    paymentOption:
                                                        paymentOption,
                                                    orderType: modeOfOrderValue,
                                                    deviceId:
                                                        '${orderItemList?[0].deviceId}',
                                                    ids: orderIDs,
                                                  );
                                                } else {
                                                  Fimber.d(
                                                      "PAYMENT $paymentType ");
                                                  if (!mounted) return;
                                                  ctx
                                                      .read<PaymentCubit>()
                                                      .getTableId();
                                                }
                                              }
                                              // }
                                            }
                                            // }
                                          }
                                        }
                                      }
                                    },
                                    fontSize: 16.sp,
                                    color: Palette.dukalinkBlack,
                                    width: SizeConfig.screenWidth * 0.9,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
              });
        }),
      ),
    );
  }
}

class QuantityCounter extends StatefulWidget {
  final NewOrders orderItem;
  final restaurant_code;
  // final ValueChanged<bool> isSelected;
  const QuantityCounter(
      {Key? key, required this.orderItem, required this.restaurant_code})
      : super(key: key);

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  late int count;
  @override
  void initState() {
    count = widget.orderItem.quantity ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<CartCubit>(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CartCubit, CartState>(listener: (ctx, state) async {
            state.maybeWhen(
                orElse: () {},
                error: (message) async {
                  launchSnackbar(
                    context: context,
                    message: message,
                    okCallback: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    type: SnackbarType.error,
                    dismissText: 'OKAY',
                  );
                  if (message.toLowerCase().contains('login')) {
                    bool value = await loginDialog(context);
                    if (!mounted) return null;
                    if (value) {
                      // TODO work on this by mapping the correct Restaurant code
                      ctx.read<CartCubit>().editItemQuantity(
                          restaurantCode:
                              // '${widget.orderItem.food?.menuCategory?.restaurantCode}',
                              '${widget.restaurant_code}',
                          foodCode: '${widget.orderItem.food?.foodCode}',
                          quantity: count,
                          orderId: '${widget.orderItem.id}');
                    }
                  }
                },
                success: (orderlist, message) {
                  ctx.read<OrderCubit>().getUserUnfulfilledOrdes(
                      // '${widget.orderItem.food?.menuCategory?.restaurantCode}');
                      '${widget.restaurant_code}');
                  launchSnackbar(
                    context: context,
                    message: message ?? '',
                    okCallback: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    type: SnackbarType.success,
                    dismissText: 'OK',
                  );
                });
          }, builder: (ctx, state) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  if (count != 1) {
                    setState(() {
                      count -= 1;
                    });
                    ctx.read<CartCubit>().editItemQuantity(
                        restaurantCode:
                            // '${widget.orderItem.food?.menuCategory?.restaurantCode}',
                            '${widget.restaurant_code}',
                        foodCode: '${widget.orderItem.food?.foodCode}',
                        quantity: count,
                        orderId: '${widget.orderItem.id}');
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Palette.white),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.remove,
                      color: Palette.dukalinkBlack1,
                      size: 14,
                    ),
                  ),
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Text(
              '$count',
              style: TextStyle(
                color: Palette.dukalinkBlack1,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
          BlocConsumer<CartCubit, CartState>(listener: (ctx, state) async {
            state.maybeWhen(
                orElse: () {},
                error: (message) async {
                  launchSnackbar(
                    context: context,
                    message: message,
                    okCallback: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    type: SnackbarType.error,
                    dismissText: 'OK',
                  );
                  if (message.toLowerCase().contains('login')) {
                    bool value = await loginDialog(context);
                    if (!mounted) return null;
                    if (value) {
                      ctx.read<CartCubit>().editItemQuantity(
                          restaurantCode:
                              // '${widget.orderItem.food?.menuCategory?.restaurantCode}',
                              '${widget.restaurant_code}',
                          foodCode: '${widget.orderItem.food?.foodCode}',
                          quantity: count,
                          orderId: '${widget.orderItem.id}');
                    }
                  }
                },
                success: (orderlist, message) {
                  launchSnackbar(
                    context: context,
                    message: message ?? '',
                    okCallback: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    type: SnackbarType.success,
                    dismissText: 'OK',
                  );
                });
          }, builder: (ctx, state) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    count += 1;
                  });
                  ctx.read<CartCubit>().editItemQuantity(
                      restaurantCode:
                          // '${widget.orderItem.food?.menuCategory?.restaurantCode}',
                          '${widget.restaurant_code}',
                      foodCode: '${widget.orderItem.food?.foodCode}',
                      quantity: count,
                      orderId: '${widget.orderItem.id}');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Palette.white),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.add,
                      color: Palette.dukalinkBlack1,
                      size: 14,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
