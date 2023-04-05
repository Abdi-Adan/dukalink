// // import 'dart:html';

// import 'package:dukalink_app/core/blocs/order/order_cubit.dart';
// import 'package:dukalink_app/core/data/model/order_item.dart';
// import 'package:dukalink_app/feature/commonWidget/login_auth_dialog.dart';
// import 'package:dukalink_app/feature/orders/checkout_process_screen.dart';
// import 'package:dukalink_app/feature/restaurant/waiter/support_screen.dart';
// import 'package:dukalink_app/feature/restaurant/widget/progress_food_item.dart';
// import 'package:dukalink_app/responsive.dart';
// import 'package:dukalink_app/shared/configs/assets.dart';
// import 'package:dukalink_app/shared/configs/colors.dart';
// import 'package:dukalink_app/shared/configs/constants.dart';
// import 'package:dukalink_app/shared/configs/size_config.dart';
// import 'package:dukalink_app/shared/configs/styles.dart';
// import 'package:dukalink_app/shared/utils/toast_utils.dart';
// import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:fimber/fimber.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import '../../core/blocs/order/order_state.dart';
// import '../../core/blocs/orderTrackCubit/orderTrack_cubit.dart';
// import '../../core/blocs/orderTrackCubit/orderTrack_state.dart';
// import '../../core/data/model/new_orders_model.dart';
// import '../../core/di/injector.dart';
// import 'dart:async';

// class OrderProgressBottomSheet extends StatefulWidget {
//   final String restaurantCode;
//   const OrderProgressBottomSheet({Key? key, required this.restaurantCode})
//       : super(key: key);

//   @override
//   State<OrderProgressBottomSheet> createState() =>
//       _OrderProgressBottomSheetState();
// }

// class _OrderProgressBottomSheetState extends State<OrderProgressBottomSheet> {
//   bool isOrderMade = true;
//   bool isPreparing = false;
//   bool isReadyToServe = false;
//   bool seeAll = true;
//   bool isExpanded = true;
// // TODO uncomment this
//   // List<OrderItem> pendingOrders = [];
//   // List<OrderItem> previousOrders = [];
//   List<NewOrders>? pendingOrders = [];
//   List<NewOrders>? previousOrders = [];
// //  "07347d44-7fc7-43f4-a548-616a4178d7b0";

//   Timer? timer;

//   checkForOrderStatus() async {
//     // TODO uncomment this immediately
//     String status =
//         await context.read<OrderCubit>().getOrderStatus(widget.restaurantCode);
//     // String status =
//     //     await context.read<OrderCubit>().getOrderStatus("07347d44-7fc7-43f4-a548-616a4178d7b0");
//     Fimber.d("NEW ORDER STATUS ==> $status");
//     if (status.toLowerCase().contains('ordered')) {
//       setState(() {
//         isOrderMade = true;
//         isPreparing = false;
//         isReadyToServe = false;
//       });
//     }
//     if (status.toLowerCase().contains('ongoing')) {
//       setState(() {
//         isOrderMade = true;
//         isPreparing = true;
//         isReadyToServe = false;
//       });
//     }
//     if (status.toLowerCase().contains('served')) {
//       setState(() {
//         isOrderMade = true;
//         isPreparing = true;
//         isReadyToServe = true;
//       });
//     }
//     if (status.toLowerCase().contains('isCompleted')) {
//       Navigator.pop(context);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     timer = Timer.periodic(
//         const Duration(seconds: 15), (Timer t) => checkForOrderStatus());
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isWeb = Responsive.isDesktop(context);
//     Size size = MediaQuery.of(context).size;
//     double screenHeight = size.height * 0.96;

//     return Scaffold(
//       body: Container(
//         // width: size.width,
//         height: seeAll ? screenHeight : 270.h,

//         decoration: BoxDecoration(
//           color: Colors.grey[50],
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0.sm),
//             topRight: Radius.circular(20.0.sm),
//           ),
//         ),
//         child: Card(
//           elevation: 2,
//           color: Colors.grey[50],
//           child: Padding(
//             padding: EdgeInsets.only(left: 12.0.sm, right: 12.0.sm),
//             child: BlocProvider(
//               create: (context) => inject<OrderTrackCubit>()
//                 ..getUserFulfilledOrdes(widget.restaurantCode),
//               child: BlocConsumer<OrderTrackCubit, OrderTrackState>(
//                   // bloc: context.read<OrderCubit>()
//                   //   ..getUserFulfilledOrdes(widget.restaurantCode),
//                   listener: (ctx, state) async {
//                 state.maybeWhen(
//                     orElse: () {},
//                     error: (message) async {
//                       ToastUtils.showErrorToast(message);
//                       if (message.toLowerCase().contains('login')) {
//                         bool value = await loginDialog(context);
//                         if (value) {
//                           if (!mounted) return null;
//                           ctx
//                               .read<OrderTrackCubit>()
//                               .getUserFulfilledOrdes(widget.restaurantCode);
//                         }
//                       }
//                     },
//                     success: (orderlist) {
//                       // AllUserOrders? orderlist=
//                       ToastUtils.showSuccessToast('Orders fetched');
//                       // Todo Uncomment this
//                       pendingOrders = orderlist;
//                       if (isOrderMade) {
//                         setState(() {
//                           isOrderMade = true;
//                           isPreparing = false;
//                           isReadyToServe = false;
//                         });
//                       }
//                     });
//               }, builder: (ctx, state) {
//                 return state.maybeWhen(
//                     orElse: () => const SizedBox.shrink(),
//                     error: (message) {
//                       return const SizedBox.shrink();
//                     },
//                     loading: () {
//                       return const Center(
//                         child: SpinKitThreeBounce(
//                           color: Palette.dukalinkPrimary1,
//                         ),
//                       );
//                     },
//                     success: (orderlist) {
//                       return ListView(
//                         children: [
//                           const Divider(
//                             thickness: 5,
//                             indent: 140,
//                             endIndent: 140,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 isExpanded = !isExpanded;
//                               });
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Center(
//                                   child: Text('Order progress ',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           fontSize: 20.sp,
//                                           fontWeight: FontWeight.w700,
//                                           color: Palette.dukalinkBlack1)),
//                                 ),
//                                 SizedBox(height: 7.h),
//                                 CustomTextButton(
//                                   text: 'Download Receipt',
//                                   displayLoading: false,
//                                   onTap: () async {
//                                     return ToastUtils.showInfoToast(
//                                         "Downloading receipt coming soon..");
//                                   },
//                                   fontSize: 19.sp,
//                                   color: Palette.dukalinkPrimaryColor,
//                                   width: SizeConfig.screenWidth * 0.4,
//                                 ),
//                                 SizedBox(height: 7.h),
//                                 Center(
//                                   child: Container(
//                                     width: isWeb ? 180 : 160.w,
//                                     height: isWeb ? 35 : 30.h,
//                                     decoration: BoxDecoration(
//                                       color: Palette.dukalinkPrimary4,
//                                       borderRadius:
//                                           BorderRadius.circular(15.0.sm),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Icon(
//                                           Icons.watch_later_rounded,
//                                           size: isWeb ? 14 : 13,
//                                           color: Palette.dukalinkBlack2,
//                                         ),
//                                         Text(
//                                           'Avg time: 30 minutes left',
//                                           style: TextStyle(
//                                             fontSize: isWeb ? 14 : 11,
//                                             fontWeight: FontWeight.w600,
//                                             color: Palette.dukalinkBlack1,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 7.h),
//                                 BlocProvider(
//                                   create: (context) => inject.get<OrderCubit>()
//                                     ..getOrderStatus(widget.restaurantCode),
//                                   child: BlocConsumer<OrderCubit, OrderState>(
//                                     // bloc: context.read<OrderCubit>()..getOrderStatus(restaurantCode),
//                                     listener: (context, state) {
//                                       state.maybeWhen(
//                                           orElse: () {},
//                                           orderStatus: (status) {
//                                             // ('Ongoing', 'Ongoing'),
//                                             // ('Completed', 'Completed'),
//                                             // ('Served', 'Served'),
//                                             // ('Cancelled', 'Cancelled'),
//                                           });
//                                     },
//                                     builder: (context, state) {
//                                       return mavenStepper(
//                                         widget.restaurantCode,
//                                         isOrderMade: isOrderMade,
//                                         isPreparing: isPreparing,
//                                         isReadyToServe: isReadyToServe,
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10.h,
//                                 ),
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       height: 50.h,
//                                       width: 80.w,
//                                       child: Stack(children: [
//                                         for (int i = 0;
//                                             i < pendingOrders!.length;
//                                             i++) ...[
//                                           Positioned(
//                                             left: i * 20,
//                                             child: Container(
//                                               height: 45.h,
//                                               width: 45.w,
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 image: DecorationImage(
//                                                   fit: BoxFit.cover,
//                                                   image: NetworkImage(
//                                                       '${pendingOrders![i].food?.foodImage}'),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ]
//                                       ]),
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     Text.rich(
//                                       TextSpan(
//                                           text:
//                                               '${pendingOrders![0].quantity} x ${pendingOrders![0].food?.foodName} ',
//                                           style: TextStyle(
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w700,
//                                               color: Palette.dukalinkBlack2),
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '+${pendingOrders!.length} items',
//                                               style: TextStyle(
//                                                   fontSize: 14.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Palette.dukalinkBlack3),
//                                             )
//                                           ]),
//                                     ),
//                                     const Spacer(),
//                                     !seeAll
//                                         ? InkWell(
//                                             onTap: () {
//                                               setState(() {
//                                                 seeAll = true;
//                                               });
//                                             },
//                                             child: Text('See all',
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                     fontSize: 14.sp,
//                                                     fontWeight: FontWeight.w700,
//                                                     color:
//                                                         Palette.dukalinkBlack1)),
//                                           )
//                                         : InkWell(
//                                             onTap: () {
//                                               setState(() {
//                                                 seeAll = false;
//                                               });
//                                             },
//                                             child: Text('Hide',
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     fontWeight: FontWeight.w700,
//                                                     color:
//                                                         Palette.dukalinkBlack1)),
//                                           ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 5.h),
//                           if (seeAll)
//                             Padding(
//                               padding: EdgeInsets.all(8.0.sm),
//                               child: Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(8.0.sm),
//                                       child: Text(
//                                         'Order Id: ${orders?.orderId}',
//                                         style: TextStyle(
//                                             fontSize: 18.sp,
//                                             color: Palette.dukalinkBlack,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                     Wrap(
//                                         children: pendingOrders!
//                                             .map((pendingOrder) =>
//                                                 ProgressFoodItem(
//                                                   orderItem: pendingOrder,
//                                                 ))
//                                             .toList()),
//                                     SizedBox(height: 10.h),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 8.0, right: 8),
//                                       child: ListTile(
//                                         title: Text('Subtotal',
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Palette.dukalinkBlack1)),
//                                         trailing: Text(
//                                             'Kshs ${orders?.food?.price}',
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Palette.dukalinkBlack1)),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 8.0, right: 8),
//                                       child: ListTile(
//                                         title: Text('VAT',
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Palette.dukalinkBlack1)),
//                                         trailing: Text(
//                                             'Kshs ${orders?.food?.discount ?? 20}'),
//                                       ),
//                                     ),
//                                     const Divider(),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 8.0, right: 8),
//                                       child: ListTile(
//                                         title: Text(
//                                             '(${orders?.quantity} items)',
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Palette.dukalinkBlack1)),
//                                         // TODO modify to take the total price
//                                         trailing:
//                                             Text('Kshs ${orders?.food?.price}',
//                                                 style: TextStyle(
//                                                   fontSize: 16.sp,
//                                                   fontWeight: FontWeight.w400,
//                                                   color: Palette.dukalinkPrimary1,
//                                                 )),
//                                       ),
//                                     ),
//                                     ListTile(
//                                       leading: Container(
//                                         height: 45,
//                                         width: 45,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: NetworkImage(sampleAvator),
//                                           ),
//                                         ),
//                                       ),
//                                       title: Text(
//                                         'Faith Njoki is serving you.',
//                                         style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontWeight: FontWeight.w600,
//                                           color: Palette.dukalinkBlack3,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           // TODO uncomment this
//                           // if (seeAll)
//                           //   orders?. != null &&
//                           //           orders?.paymentOption ==
//                           //               PaymentOptionConstants.PAYLATER
//                           //       ?
//                           Row(
//                             children: [
//                               Expanded(
//                                 flex: 5,
//                                 child: CustomTextButton(
//                                   text: 'Pay Now1',
//                                   displayLoading: false,
//                                   onTap: () async {
//                                     // Todo uncomment this
//                                     // await paymentMethods(
//                                     //   context,
//                                     //   amount: '${orders?.totalPrice}',
//                                     //   orderId: '${orders?.orderId}',
//                                     //   restaurantCode:
//                                     //       '${orders?.branch}',
//                                     //   // tableId: orders?.table ?? '',
//                                     //   paymentOption:
//                                     //       '${orders?.paymentOption}',
//                                     //   orderType: '${orders?.orderType}',
//                                     // );
//                                   },
//                                   fontSize: 16.sp,
//                                   color: Palette.dukalinkBlack,
//                                   // width: SizeConfig.screenWidth * 0.4,
//                                 ),
//                               ),
//                               SizedBox(width: 10.w),
//                               Expanded(
//                                 flex: 4,
//                                 child: SizedBox(
//                                   // height: 80,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.5,
//                                   child: CustomTextButton(
//                                     text: 'Split bill',
//                                     frontIcon: Assets.splitIcon,
//                                     frontIconSize: 40,
//                                     textcolor: Palette.dukalinkBlack,
//                                     displayLoading: false,
//                                     onTap: () async {
//                                       // Todo uncomment this
//                                       // await paymentMethods(
//                                       //   context,
//                                       //   amount: '${orders?.getTotal}',
//                                       //   orderId: '${orders?.orderId}',
//                                       //   restaurantCode:
//                                       //       '${orders?.restaurant?.restaurantCode}',
//                                       //   // tableId: orders?.table ?? '',
//                                       //   paymentOption:
//                                       //       '${orders?.paymentOption}',
//                                       //   orderType: '${orders?.orderType}',
//                                       // );
//                                     },
//                                     fontSize: 16.sp,
//                                     color: Palette.white,
//                                     width: SizeConfig.screenWidth * 0.1,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // Todo uncomment this
//                           // : const SizedBox.shrink(),
//                           SizedBox(height: 7.h),
//                           CustomTextButton(
//                             text: 'Ask Waiter',
//                             frontIcon: Assets.notificationBell,
//                             displayLoading: false,
//                             onTap: () async {
//                               await requestSupport(context);
//                             },
//                             fontSize: 16.sp,
//                             color: Palette.dukalinkBlack,
//                             width: SizeConfig.screenWidth * 0.9,
//                           ),
//                         ],
//                       );
//                     });
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget mavenStepper(restaurantCode,
//       {required bool isOrderMade,
//       required bool isPreparing,
//       required bool isReadyToServe}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         headerTile(
//           Icons.calendar_month,
//           isOrderMade,
//           "Order Made".tr(),
//         ),
//         Expanded(
//           child: Divider(
//             color: isOrderMade ? Palette.accentColor : Palette.dukalinkBlack3,
//             thickness: 1.5,
//           ),
//         ),
//         headerTile(
//           Icons.watch_later,
//           isPreparing,
//           "Preparing".tr(),
//         ),
//         Expanded(
//           child: Divider(
//             color: isPreparing ? Palette.accentColor : Palette.dukalinkBlack3,
//             thickness: 1.5,
//           ),
//         ),
//         headerTile(
//           Icons.done_outlined,
//           isReadyToServe,
//           " Served".tr(),
//         ),
//       ],
//     );
//   }

//   GestureDetector headerTile(IconData icon, bool complet, String text) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {});
//       },
//       child: Column(
//         children: [
//           CircleAvatar(
//               radius: 16,
//               backgroundColor:
//                   complet ? Palette.dukalinkPrimary2 : Palette.dukalinkBlack3,
//               child: Icon(
//                 icon,
//                 size: 20,
//                 color: complet ? Palette.dukalinkBlack1 : Palette.white,
//               )),
//           Text(
//             text,
//             style: Styles.normalTitleTextStyle.copyWith(
//                 fontSize: 12.sp,
//                 color: complet ? Palette.dukalinkBlack2 : Palette.dukalinkBlack3),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MavoStepper extends StatefulWidget {
//   final Color? backgroundColor;
//   final Color? activeColor;
//   final int? currentStep;
//   final List<Maven> maven;
//   final void Function(int)? onStepTapped;
//   // final List
//   const MavoStepper(
//       {Key? key,
//       this.backgroundColor,
//       this.activeColor,
//       this.onStepTapped,
//       this.currentStep = 0,
//       required this.maven})
//       : super(key: key);

//   @override
//   State<MavoStepper> createState() => _MavoStepperState();
// }

// class _MavoStepperState extends State<MavoStepper> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: _buildStepper());
//   }

//   bool _isLast(int index) {
//     return widget.maven.length - 1 == index;
//   }

//   Widget _buildStepper() {
//     final List<Widget> children = <Widget>[
//       for (int i = 0; i < widget.maven.length; i += 1) ...<Widget>[
//         InkResponse(
//           onTap: () {},
//           child: Row(
//             children: <Widget>[
//               SizedBox(
//                 height: 72.0,
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: widget.currentStep == i
//                               ? widget.activeColor
//                               : Palette.dukalinkBlack3,
//                         ),
//                         child: Icon(
//                           widget.maven[i].icon,
//                           color: widget.currentStep == i
//                               ? Palette.dukalinkBlack1
//                               : Palette.white,
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsetsDirectional.only(start: 12.0),
//                         child: Text(
//                           widget.maven[i].title,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w700,
//                             color: widget.currentStep == i
//                                 ? Palette.dukalinkBlack1
//                                 : Palette.dukalinkBlack3,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         if (!_isLast(i))
//           Center(
//             child: Container(
//               alignment: Alignment.topCenter,
//               width: 50,
//               // margin: const EdgeInsets.symmetric(horizontal: .0),
//               height: 1.0,
//               color: Colors.grey.shade400,
//             ),
//           ),
//       ],
//     ];

//     return Material(
//       // elevation: widget.elevation ?? 2,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Row(
//           children: children,
//         ),
//       ),
//     );
//   }
// }

// class Maven {
//   final String title;
//   final IconData icon;

//   Maven({required this.title, required this.icon});
// }
