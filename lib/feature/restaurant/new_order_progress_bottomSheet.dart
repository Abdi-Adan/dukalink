import 'package:dukalink_app/feature/commonWidget/login_auth_dialog.dart';
// import 'package:dukalink_app/feature/restaurant/waiter/support_screen.dart';
import 'package:dukalink_app/feature/restaurant/widget/progress_food_itemBottomSheet.dart';
import 'package:dukalink_app/responsive.dart';
// import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/styles.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/blocs/orderTrackCubit/orderTrack_cubit.dart';
import '../../core/blocs/orderTrackCubit/orderTrack_state.dart';
import '../../core/blocs/orderhistory/orderHistory_cubit.dart';
import '../../core/blocs/orderhistory/orderHistory_state.dart';
import '../../core/data/model/userOrdersModel.dart';
import '../../core/di/injector.dart';
import 'dart:async';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../home/home_screen.dart';

class NewOrderProgressBottomSheet extends StatefulWidget {
  final String restaurantCode;
  const NewOrderProgressBottomSheet({Key? key, required this.restaurantCode})
      : super(key: key);

  @override
  State<NewOrderProgressBottomSheet> createState() =>
      _NewOrderProgressBottomSheetState();
}

class _NewOrderProgressBottomSheetState
    extends State<NewOrderProgressBottomSheet> {
  // late AnimationController _animationController;
  // late Animation<double> _animation;

  bool isOrderMade = true;
  bool isPreparing = false;
  bool isReadyToServe = false;
  bool seeAll = true;
  bool isExpanded = true;
// TODO uncomment this
  // List<OrderItem> pendingOrders = [];
  // List<OrderItem> previousOrders = [];
  // List<NewOrders>? pendingOrders = [];
  List<UserOrders> pendingOrders = [];
  List<UserOrders> previousOrders = [];
  var orderID;
//  "07347d44-7fc7-43f4-a548-616a4178d7b0";

  Timer? timer;
  var status;

  // void _toggleSheet() {
  //   if (_animationController.status == AnimationStatus.completed) {
  //     _animationController.reverse();
  //   } else {
  //     _animationController.forward();
  //   }
  // }

  void checkForOrderStatus(var status) async {
    // TODO uncomment this immediately

    // Fimber.d("NEW ORDER STATUS ==> $status");
    if (status.toString().toLowerCase() == 'pending') {
      // setState(() {
      isOrderMade = true;
      isPreparing = false;
      isReadyToServe = false;
      // });
    } else if (status.toString().toLowerCase() == 'confirmed') {
      // setState(() {
      isOrderMade = true;
      isPreparing = true;
      isReadyToServe = false;
      // });
    } else if (status.toString().toLowerCase() == 'preparing') {
      // setState(() {
      isOrderMade = true;
      isPreparing = true;
      isReadyToServe = false;
      // });
    } else if (status.toString().toLowerCase() == 'ready') {
      // setState(() {
      isOrderMade = true;
      isPreparing = true;
      isReadyToServe = true;
      // });
    } else if (status == 'Completed') {
      // Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();

    // startTimer();
    // getAllordersOngoing();
    // timer = Timer.periodic(
    //     const Duration(seconds: 5), (Timer t) => checkForOrderStatus()
    //     );
  }

  @override
  void dispose() {
    timer?.cancel();
    // _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height * 0.96;

    return Scaffold(
      primary: true,
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
            Text(
              'Order Progress',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Palette.dukalinkBlack1),
            ),
          ],
        ),
        // elevation: 5,
      ),
      body: BlocProvider(
          create: (context) => inject<OrderHistoryCubit>()..getUserOrders(),
          child: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
            listener: (ctx, state) async {
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

                    if (message.toLowerCase().contains('login')
                        // ||
                        //     message.toLowerCase().contains('error')
                        ) {
                      bool value = await loginDialog(context);
                      if (value) {
                        if (!mounted) return null;
                        ctx.read<OrderHistoryCubit>().getUserOrders();
                      }
                    }
                  },
                  success: (orderlist, orderItem) {
                    // AllUserOrders? orderlist=
                    // ToastUtils.showSuccessToast('All user orders fetched');
                    pendingOrders = [];
                    previousOrders = [];
                    if (orderlist != null) {
                      // TODO Uncomment this
                      for (int i = 0; i < orderlist.length; i++) {
                        if (orderlist[i].orderStatus.toString().toLowerCase() ==
                            "completed") {
                          previousOrders.add(orderlist[i]);
                        } else {
                          pendingOrders.add(orderlist[i]);
                        }
                      }
                      // pendingOrders.isNotEmpty ? orderOn = true : orderOn = false;
                    }
                  });
            },
            builder: (ctx, state) {
              return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  error: (message) {
                    return SizedBox(
                      height: 150.h,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),

                          Text(
                            "Sign in to see your order history",
                            style: const TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          // InkWell(
                          //   onTap: () async {
                          //     if (message.toLowerCase().contains('exist')) {
                          //       bool value = await loginDialog(context);
                          //       if (value) {
                          //         if (!mounted) return;
                          //         ctx.read<OrderHistoryCubit>().getUserOrders();
                          //       }
                          //     }
                          //   },
                          //   child:
                          SizedBox(
                              width: 120.w,
                              child: CustomTextButton(
                                  text: "Sign in",
                                  onTap: () async {
                                    if (message
                                        .toLowerCase()
                                        .contains('exist')) {
                                      bool value = await loginDialog(context);
                                      if (value) {
                                        if (!mounted) return;
                                        ctx
                                            .read<OrderHistoryCubit>()
                                            .getUserOrders();
                                      }
                                    }
                                  },
                                  displayLoading: state is OrderHistoryState)),
                          // ),
                        ],
                      )),
                    );
                  },
                  loading: () {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        // Text("Processing your order... "),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SpinKitThreeBounce(
                              color: Palette.dukalinkPrimary1,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  success: (orderlist, orderItem) {
                    return ListView.builder(
                        itemCount: pendingOrders.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = pendingOrders[index];

                          return Dismissible(
                              // key: UniqueKey(),
                              key: Key("${pendingOrders[index].id}"),
                              background: Container(
                                color: Palette.dukalinkPrimary1,
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                              secondaryBackground: Container(
                                color: Palette.dukalinkPrimary1,
                                alignment: Alignment.centerLeft,
                                child: Icon(Icons.edit, color: Colors.white),
                              ),
                              onDismissed: (direction) {
                                if (direction == DismissDirection.endToStart) {
                                  // Swipe from right to left (delete)
                                  setState(() {
                                    pendingOrders.removeAt(index);
                                  });
                                  if (index == pendingOrders.length &&
                                      direction ==
                                          DismissDirection.endToStart) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              Palette.dukalinkPrimary1,
                                          content: Text("Reached end of list")),
                                    );
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomeScreen.routeName, (route) => false);
                                  }
                                } else if (direction ==
                                    DismissDirection.startToEnd) {
                                  // Swipe from left to right (edit)
                                  // Navigate to detail screen or show details here
                                }
                              },
                              child: RefreshIndicator(
                                  color: Palette.dukalinkOrangeColor,
                                  onRefresh: () =>
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          HomeScreen.routeName,
                                          (route) => false),
                                  child: Container(
                                      height: seeAll ? screenHeight : 270.h,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0.sm),
                                          topRight: Radius.circular(20.0.sm),
                                        ),
                                      ),
                                      child: Card(
                                          elevation: 2,
                                          color: Colors.grey[50],
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 12.0.sm, right: 12.0.sm),
                                            child: ListView(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isExpanded = !isExpanded;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 15.h),
                                                      // Text(
                                                      //   "pull to refresh",
                                                      //   style: TextStyle(
                                                      //       // color: mainColor,
                                                      //       fontSize: 10.sp,
                                                      //       fontWeight:
                                                      //           FontWeight
                                                      //               .bold),
                                                      // ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  HomeScreen
                                                                      .routeName,
                                                                  (route) =>
                                                                      false);
                                                        },
                                                        child: SizedBox(
                                                            height: 18.h,
                                                            width: 18.w,
                                                            child: Icon(
                                                              Icons.refresh,
                                                              size: 15.sp,
                                                              // color: mainColor,
                                                            )),
                                                      ),
                                                      Center(
                                                        child: Container(
                                                          width: isWeb
                                                              ? 180
                                                              : 160.w,
                                                          height:
                                                              isWeb ? 35 : 30.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Palette
                                                                .dukalinkPrimary4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0.sm),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .watch_later_rounded,
                                                                size: isWeb
                                                                    ? 14
                                                                    : 13,
                                                                color: Palette
                                                                    .dukalinkBlack2,
                                                              ),
                                                              Text(
                                                                'Avg time: N/A',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      isWeb
                                                                          ? 14
                                                                          : 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Palette
                                                                      .dukalinkBlack1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 7.h),
                                                      BlocProvider(
                                                        create: (context) =>
                                                            inject.get<
                                                                OrderTrackCubit>()
                                                              ..getOrderStatus(
                                                                  pendingOrders[
                                                                          index]
                                                                      .id!),
                                                        child: BlocConsumer<
                                                            OrderTrackCubit,
                                                            OrderTrackState>(
                                                          // bloc: context.read<OrderCubit>()..getOrderStatus(restaurantCode),
                                                          listener:
                                                              (context, state) {
                                                            state.maybeWhen(
                                                                orElse: () {},
                                                                orderStatus:
                                                                    (status) {
                                                                  // ('Ongoing', 'Ongoing'),
                                                                  // ('Completed', 'Completed'),
                                                                  // ('Served', 'Served'),
                                                                  // ('Cancelled', 'Cancelled'),
                                                                });
                                                          },
                                                          builder:
                                                              (context, state) {
                                                            debugPrint(
                                                                " CURRENT ORDER ID ${pendingOrders[index].id}");
                                                            timer =
                                                                Timer.periodic(
                                                                    Duration(
                                                                        seconds:
                                                                            15),
                                                                    (timer) {
                                                              context.read<
                                                                  OrderHistoryCubit>()
                                                                ..getUserOrders();
                                                            });
                                                            // Timer.periodic(
                                                            //     Duration(
                                                            //         seconds:
                                                            //             5),
                                                            //     (Timer t) {
                                                            checkForOrderStatus(
                                                                pendingOrders[
                                                                        index]
                                                                    .orderStatus);
                                                            // });

                                                            return mavenStepper(
                                                              widget
                                                                  .restaurantCode,
                                                              isOrderMade:
                                                                  // pendingOrders[index].orderStatus.toString().toLowerCase() ==
                                                                  //         'pending' ||
                                                                  //     pendingOrders[index].orderStatus.toString().toLowerCase() ==
                                                                  //         'ready',
                                                                  isOrderMade,
                                                              isPreparing:
                                                                  // pendingOrders[index].orderStatus.toString().toLowerCase() ==
                                                                  //         'preparing' ||
                                                                  //     pendingOrders[index].orderStatus.toString().toLowerCase() ==
                                                                  //         'ready',

                                                                  isPreparing,
                                                              isReadyToServe:
                                                                  // pendingOrders[index]
                                                                  //         .orderStatus
                                                                  //         .toString()
                                                                  //         .toLowerCase() ==
                                                                  //     'ready'

                                                                  isReadyToServe,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      // Row(
                                                      //   children: [
                                                      //     SizedBox(
                                                      //       height: 50.h,
                                                      //       width: 80.w,
                                                      //       child: Stack(children: [
                                                      //         for (int i = 0;
                                                      //             i < pendingOrders!.length;
                                                      //             i++) ...[
                                                      //           Positioned(
                                                      //             left: i * 20,
                                                      //             child: Container(
                                                      //               height: 45.h,
                                                      //               width: 45.w,
                                                      //               decoration: BoxDecoration(
                                                      //                 shape: BoxShape.circle,
                                                      //                 image: DecorationImage(
                                                      //                   fit: BoxFit.cover,
                                                      //                   image: NetworkImage(
                                                      //                       '${pendingOrders![i].food?.foodImage}'),
                                                      //                 ),
                                                      //               ),
                                                      //             ),
                                                      //           ),
                                                      //         ]
                                                      //       ]),
                                                      //     ),
                                                      //     SizedBox(
                                                      //       width: 10.w,
                                                      //     ),
                                                      //     Text.rich(
                                                      //       TextSpan(
                                                      //           text:
                                                      //               '${pendingOrders![0].quantity} x ${pendingOrders![0].food?.foodName} ',
                                                      //           style: TextStyle(
                                                      //               fontSize: 14.sp,
                                                      //               fontWeight: FontWeight.w700,
                                                      //               color: Palette.dukalinkBlack2),
                                                      //           children: [
                                                      //             TextSpan(
                                                      //               text:
                                                      //                   '+${pendingOrders!.length} items',
                                                      //               style: TextStyle(
                                                      //                   fontSize: 14.sp,
                                                      //                   fontWeight: FontWeight.w500,
                                                      //                   color: Palette.dukalinkBlack3),
                                                      //             )
                                                      //           ]),
                                                      //     ),
                                                      //     const Spacer(),
                                                      //     !seeAll
                                                      //         ? InkWell(
                                                      //             onTap: () {
                                                      //               setState(() {
                                                      //                 seeAll = true;
                                                      //               });
                                                      //             },
                                                      //             child: Text('See all',
                                                      //                 textAlign: TextAlign.center,
                                                      //                 style: TextStyle(
                                                      //                     fontSize: 14.sp,
                                                      //                     fontWeight: FontWeight.w700,
                                                      //                     color:
                                                      //                         Palette.dukalinkBlack1)),
                                                      //           )
                                                      //         : InkWell(
                                                      //             onTap: () {
                                                      //               setState(() {
                                                      //                 seeAll = false;
                                                      //               });
                                                      //             },
                                                      //             child: Text('Hide',
                                                      //                 textAlign: TextAlign.center,
                                                      //                 style: TextStyle(
                                                      //                     fontSize: 16.sp,
                                                      //                     fontWeight: FontWeight.w700,
                                                      //                     color:
                                                      //                         Palette.dukalinkBlack1)),
                                                      //           ),
                                                      //   ],
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                if (seeAll)
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.sm),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0.sm),
                                                          child: Text(
                                                            // 'Order no.: ${pendingOrders ?.data?.orderNumber}',
                                                            'Order no.: ${pendingOrders[index].orderNumber}',
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                color: Palette
                                                                    .dukalinkBlack,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        // Wrap(
                                                        //     children: pendingOrders[
                                                        //             index]
                                                        //         .orderDetails!
                                                        //         .map(
                                                        //           (pendingOrder) =>
                                                        // TODO: SHOW FOOD ITEMS
                                                        ProgressFoodItemBottomSheet(
                                                            orderItem:
                                                                pendingOrders[
                                                                        index]
                                                                    .orderDetails),
                                                        // )
                                                        // .toList()),

                                                        SizedBox(height: 10.h),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8),
                                                          child: ListTile(
                                                            title: Text(
                                                                'Subtotal',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Palette
                                                                        .dukalinkBlack1)),
                                                            trailing: Text(
                                                                // 'Kshs ${pendingOrders?.data?.amount}',
                                                                'Kshs ${pendingOrders[index].amount}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Palette
                                                                        .dukalinkBlack1)),
                                                          ),
                                                        ),
                                                        // Padding(
                                                        //   padding: const EdgeInsets.only(
                                                        //       left: 8.0, right: 8),
                                                        //   child: ListTile(
                                                        //     title: Text('VAT',
                                                        //         style: TextStyle(
                                                        //             fontSize: 16.sp,
                                                        //             fontWeight: FontWeight.w400,
                                                        //             color: Palette.dukalinkBlack1)),
                                                        //     trailing: Text(
                                                        //         'Kshs ${orders?.food?.discount ?? 20}'),
                                                        //   ),
                                                        // ),
                                                        const Divider(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8),
                                                          child: ListTile(
                                                            title: Text(
                                                                // '(${pendingOrders?.data?.orderItem?.quantity} items)',
                                                                '(${pendingOrders[index].orderDetails?.length} items)',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Palette
                                                                        .dukalinkBlack1)),
                                                            // TODO modify to take the total price
                                                            trailing: Text(
                                                                // 'Kshs ${pendingOrders?.data?.amount}',
                                                                'Kshs ${pendingOrders[index].amount}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Palette
                                                                      .dukalinkPrimary1,
                                                                )),
                                                          ),
                                                        ),
                                                        // TODO Show who is serving you
                                                        // ListTile(
                                                        //   leading:
                                                        //       Container(
                                                        //     height: 45,
                                                        //     width: 45,
                                                        //     decoration:
                                                        //         BoxDecoration(
                                                        //       shape: BoxShape
                                                        //           .circle,
                                                        //       image:
                                                        //           DecorationImage(
                                                        //         fit: BoxFit
                                                        //             .cover,
                                                        //         image: NetworkImage(
                                                        //             sampleAvator),
                                                        //       ),
                                                        //     ),
                                                        //   ),
                                                        //   title: Text(
                                                        //     'Faith Njoki is serving you.',
                                                        //     style:
                                                        //         TextStyle(
                                                        //       fontSize:
                                                        //           16.sp,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .w600,
                                                        //       color: Palette
                                                        //           .dukalinkBlack3,
                                                        //     ),
                                                        //   ),
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                // TODO uncomment this
                                                // if (seeAll)

                                                //                   pendingOrders?.data?.paymentStatus != "PAID"
                                                //                       ? Row(
                                                //                           children: [
                                                //                             Expanded(
                                                //                               flex: 5,
                                                //                               child: CustomTextButton(
                                                //                                 text: 'Pay Now',
                                                //                                 displayLoading: false,
                                                //                                 onTap: () async {
                                                //                                   // Todo uncomment this
                                                //                                   await paymentMethods(
                                                //                                     context,
                                                //                                     amount:
                                                //                                         '${pendingOrders?.data?.amount}',
                                                //                                     orderId:
                                                //                                         '${pendingOrders?.data?.orderId}',
                                                //                                     restaurantCode:
                                                //                                         '${pendingOrders?.data?.restaurant?.restaurantCode}',
                                                //                                     // tableId: orders?.table ?? '',
                                                //                                     paymentOption:
                                                //                                         '${pendingOrders?.data?.paymentOption}',
                                                //                                     orderType:
                                                //                                         '${pendingOrders?.data?.orderType}',
                                                //                                     deviceId:
                                                //                                         '${pendingOrders?.data?.deviceId}',
                                                //                                     id: '${pendingOrders?.data?.id}',
                                                //                                   );
                                                //                                 },
                                                //                                 fontSize: 16.sp,
                                                //                                 color: Palette.dukalinkBlack,
                                                //                                 // width: SizeConfig.screenWidth * 0.4,
                                                //                               ),
                                                //                             ),
                                                //                             SizedBox(width: 10.w),
                                                //                             Expanded(
                                                //                               flex: 4,
                                                //                               child: SizedBox(
                                                //                                 // height: 80,
                                                //                                 width: MediaQuery.of(context)
                                                //                                         .size
                                                //                                         .width *
                                                //                                     0.5,
                                                //                                 child: CustomTextButton(
                                                //                                   text: 'Split bill',
                                                //                                   frontIcon: Assets.splitIcon,
                                                //                                   frontIconSize: 40,
                                                //                                   textcolor: Palette.dukalinkBlack,
                                                //                                   displayLoading: false,
                                                //                                   onTap: () async {
                                                //                                     // Todo uncomment this
                                                //                                     ToastUtils.showErrorToast(
                                                //                                         'Card payment coming soon');
                                                //                                     // await paymentMethods(
                                                //                                     //   context,
                                                //                                     //   amount: '${orders?.getTotal}',
                                                //                                     //   orderId: '${orders?.orderId}',
                                                //                                     //   restaurantCode:
                                                //                                     //       '${orders?.restaurant?.restaurantCode}',
                                                //                                     //   // tableId: orders?.table ?? '',
                                                //                                     //   paymentOption:
                                                //                                     //       '${orders?.paymentOption}',
                                                //                                     //   orderType: '${orders?.orderType}',
                                                //                                     // );

                                                //  },
                                                //                                   fontSize: 16.sp,
                                                //                                   color: Palette.white,
                                                //                                   width: SizeConfig.screenWidth * 0.1,
                                                //                                 ),
                                                //                               ),
                                                //                             ),
                                                //                           ],
                                                //                         )
                                                //                       // Todo uncomment this
                                                //                       : const SizedBox.shrink(),
                                                TextButton(
                                                    onPressed: () {
                                                      launchSnackbar(
                                                        context: context,
                                                        message:
                                                            'Downloading receipt coming soon!',
                                                        okCallback: () {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                        },
                                                        type: SnackbarType
                                                            .success,
                                                        dismissText: 'OK',
                                                      );
                                                    },
                                                    child: Text(
                                                        "Download Receipt")),
                                                // Spacer(),

                                                // CustomTextButton(
                                                //   text: 'Ask Waiter',
                                                //   frontIcon:
                                                //       Assets.notificationBell,
                                                //   displayLoading: false,
                                                //   onTap: () async {
                                                //     await requestSupport(
                                                //         context);
                                                //   },
                                                //   fontSize: 16.sp,
                                                //   color: Palette.dukalinkBlack,
                                                //   width:
                                                //       SizeConfig.screenWidth *
                                                //           0.9,
                                                // ),
                                                // SizedBox(height: 12.h),
                                                // TODO Call waiter
                                                // Spacer(),

                                                // CustomTextButton(
                                                //   text: 'Download Receipt',
                                                //   displayLoading: false,
                                                //   onTap: () async {
                                                //     return ToastUtils.showInfoToast(
                                                //         "Downloading receipt coming soon..");
                                                //   },
                                                //   fontSize: 19.sp,
                                                //   color: Palette.dukalinkPrimaryColor,
                                                //   width: SizeConfig.screenWidth * 0.4,
                                                // ),
                                                SizedBox(height: 7.h),
                                              ],
                                            ),
                                          )))));
                        });
                  });
            },

            //  AnimatedBuilder(
            //   animation: _animation,
            //   builder: (context, child) {
            //     return GestureDetector(
            //       onTap: _toggleSheet,
            //       child:

            // );
            //   },
            // ),
          )),
    );
  }

  Widget mavenStepper(restaurantCode,
      {required bool isOrderMade,
      required bool isPreparing,
      required bool isReadyToServe}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        headerTile(
          Icons.calendar_month,
          isOrderMade,
          "Order Made".tr(),
        ),
        Expanded(
            child: FAProgressBar(
                currentValue: 100,
                size: 7,
                // displayText: '%',
                progressColor:
                    isOrderMade ? Palette.accentColor : Palette.dukalinkBlack3,
                backgroundColor: Palette.dukalinkBlack3,
                animatedDuration: Duration(seconds: 1))

            //  Divider(
            //   color: isOrderMade ? Palette.accentColor : Palette.dukalinkBlack3,
            //   thickness: 1.5,
            // ),
            ),
        headerTile(
          Icons.watch_later,
          isPreparing,
          "Preparing".tr(),
        ),
        Expanded(
            child: FAProgressBar(
                currentValue: 100,
                size: 7,
                // displayText: '%',
                progressColor:
                    isPreparing ? Palette.accentColor : Palette.dukalinkBlack3,
                backgroundColor: Palette.dukalinkBlack3,
                animatedDuration: Duration(seconds: 1))),

        //   Divider(
        //     color: isPreparing ? Palette.accentColor : Palette.dukalinkBlack3,
        //     thickness: 1.5,
        //   ),
        // ),

        headerTile(
          Icons.done_outlined,
          isReadyToServe,
          " Served".tr(),
        ),
      ],
    );
  }

  GestureDetector headerTile(IconData icon, bool complet, String text) {
    return GestureDetector(
      onTap: () {
        // setState(() {});
      },
      child: Column(
        children: [
          CircleAvatar(
              radius: 16,
              backgroundColor:
                  complet ? Palette.dukalinkPrimary2 : Palette.dukalinkBlack3,
              child: Icon(
                icon,
                size: 20,
                color: complet ? Palette.dukalinkBlack1 : Palette.white,
              )),
          Text(
            text,
            style: Styles.normalTitleTextStyle.copyWith(
                fontSize: 12.sp,
                color:
                    complet ? Palette.dukalinkBlack2 : Palette.dukalinkBlack3),
          ),
        ],
      ),
    );
  }
}

class MavoStepper extends StatefulWidget {
  final Color? backgroundColor;
  final Color? activeColor;
  final int? currentStep;
  final List<Maven> maven;
  final void Function(int)? onStepTapped;
  // final List
  const MavoStepper(
      {Key? key,
      this.backgroundColor,
      this.activeColor,
      this.onStepTapped,
      this.currentStep = 0,
      required this.maven})
      : super(key: key);

  @override
  State<MavoStepper> createState() => _MavoStepperState();
}

class _MavoStepperState extends State<MavoStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(child: _buildStepper());
  }

  bool _isLast(int index) {
    return widget.maven.length - 1 == index;
  }

  Widget _buildStepper() {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.maven.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: () {},
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 72.0,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.currentStep == i
                              ? widget.activeColor
                              : Palette.dukalinkBlack3,
                        ),
                        child: Icon(
                          widget.maven[i].icon,
                          color: widget.currentStep == i
                              ? Palette.dukalinkBlack1
                              : Palette.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 12.0),
                        child: Text(
                          widget.maven[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: widget.currentStep == i
                                ? Palette.dukalinkBlack1
                                : Palette.dukalinkBlack3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!_isLast(i))
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: 50,
              // margin: const EdgeInsets.symmetric(horizontal: .0),
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
      ],
    ];

    return Material(
      // elevation: widget.elevation ?? 2,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: children,
        ),
      ),
    );
  }
}

class Maven {
  final String title;
  final IconData icon;

  Maven({required this.title, required this.icon});
}
