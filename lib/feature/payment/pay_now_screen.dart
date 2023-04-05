// import 'package:dukalink_app/core/blocs/restaurant/restaurant_cubit.dart';
// import 'package:dukalink_app/core/data/model/dishes_model.dart';
// import 'package:dukalink_app/core/data/model/restaurant_detail.dart';
// import 'package:dukalink_app/core/di/injector.dart';
// import 'package:dukalink_app/feature/dishes/dish_screen.dart';
// import 'package:dukalink_app/feature/restaurant/food_categories.dart';
// import 'package:dukalink_app/shared/configs/assets.dart';
// import 'package:dukalink_app/shared/configs/colors.dart';
// import 'package:dukalink_app/shared/configs/size_config.dart';
// import 'package:dukalink_app/shared/utils/toast_utils.dart';
// import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PaymentHomeScreen extends StatefulWidget {
//   static const routeName = 'PaymentHomeScreen';

//   const PaymentHomeScreen({Key? key}) : super(key: key);

//   @override
//   State<PaymentHomeScreen> createState() => _PaymentHomeScreenState();
// }

// class _PaymentHomeScreenState extends State<PaymentHomeScreen> {
//   bool isFavorite = false;
//   String? restaurantCode;

//   @override
//   void didChangeDependencies() {
//     final args = ModalRoute.of(context)?.settings.arguments as Map?;
//     if (args != null) {
//       restaurantCode = args['restaurantCode'] as String;
//     }

//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: SizedBox(
//             height: SizeConfig.screenHeight * 1.2,
//             width: SizeConfig.screenWidth,
//             child: BlocProvider(
//               create: (context) => inject<RestaurantCubit>(),
//               child: BlocConsumer<RestaurantCubit, RestaurantState>(
//                   listener: (ctx, state) async {
//                 if (state is ErrorRestaurantState) {
//                   ToastUtils.showErrorToast(state.message);
//                 }
//               }, builder: (context, state) {
//                 // if (state is ErrorRestaurantState) {
//                 //   return Container(
//                 //     child: Center(child: Text(state.message)),
//                 //   );
//                 // } else if (state is SuccessRestaurantState) {
//                 return Stack(
//                   children: [
//                     Container(
//                       height: 100.h,
//                       width: SizeConfig.screenWidth,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: NetworkImage(sampleAvator
//                               // '${state.restaurantDetail?.data?.restaurantImage}',
//                               ),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             InkWell(
//                               onTap: () => Navigator.pop(context),
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Palette.white),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Icon(
//                                     Icons.arrow_back_outlined,
//                                     size: 30,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const Spacer(),
//                             Container(
//                               decoration: const BoxDecoration(
//                                   shape: BoxShape.circle, color: Palette.white),
//                               child: const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Icon(
//                                   Icons.share,
//                                   size: 30,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 97,
//                       child: SizedBox(
//                         height: SizeConfig.screenHeight,
//                         width: SizeConfig.screenWidth,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   // width: 70.w,
//                                   height: 40.h,
//                                   decoration: const BoxDecoration(
//                                     color: Palette.dukalinkBlack4,
//                                     borderRadius: BorderRadius.only(
//                                         bottomRight: Radius.circular(8)),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 14.0, right: 14),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         const Icon(
//                                           Icons.watch_later_rounded,
//                                           size: 18,
//                                           color: Palette.dukalinkBlack1,
//                                         ),
//                                         const SizedBox(width: 5),
//                                         Text(
//                                           '06:30 AM - 9:00 PM',
//                                           style: TextStyle(
//                                             color: Palette.dukalinkBlack1,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 10.sp,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 Container(
//                                   // width: 70.w,
//                                   height: 40.h,
//                                   decoration: const BoxDecoration(
//                                     color: Palette.dukalinkBlack4,
//                                     borderRadius: BorderRadius.only(
//                                         bottomRight: Radius.circular(8)),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 14.0, right: 14),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         const Icon(
//                                           Icons.table_restaurant_sharp,
//                                           size: 18,
//                                           color: Palette.dukalinkBlack1,
//                                         ),
//                                         const SizedBox(width: 5),
//                                         Text(
//                                           'Table # 21',
//                                           style: TextStyle(
//                                             color: Palette.dukalinkBlack1,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 10.sp,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   // '${state.restaurantDetail?.data?.branchName}',
//                                   'Java Mbagathi',
//                                   style: TextStyle(
//                                     color: Palette.dukalinkBlack1,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 16.sp,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       // '${state.restaurantDetail?.data?.ratings ?? 1}',
//                                       '4.5',
//                                       style: TextStyle(
//                                         color: Palette.dukalinkBlack1,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12.sp,
//                                       ),
//                                     ),
//                                     RatingBarIndicator(
//                                       rating: 2.75,
//                                       itemBuilder: (context, index) =>
//                                           const Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                       ),
//                                       itemCount: 5,
//                                       itemSize: 20.0,
//                                       direction: Axis.horizontal,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: 4,
//                                 itemBuilder: (context, index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(12),
//                                     child: Container(
//                                       color: Colors.white,
//                                       child: Row(children: [
//                                         SizedBox(
//                                           height: 60.h,
//                                           width: 60.h,
//                                           child: Container(
//                                             height: 45,
//                                             width: 45,
//                                             decoration: BoxDecoration(
//                                               // color: Colors.black,
//                                               border: Border.all(
//                                                 color: Palette
//                                                     .dukalinkPrimary2, // red as border color
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(14),
//                                               image: DecorationImage(
//                                                 image:
//                                                     NetworkImage(sampleImage),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 10.w,
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text('Java Mbagathi',
//                                                 style: TextStyle(
//                                                     fontSize: 14.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color:
//                                                         Palette.dukalinkBlack)),
//                                             SizedBox(
//                                               height: 5.h,
//                                             ),
//                                             Text('Ksh 1,290.00',
//                                                 style: TextStyle(
//                                                     fontSize: 12.sp,
//                                                     fontWeight: FontWeight.w700,
//                                                     color:
//                                                         Palette.dukalinkBlack3)),
//                                           ],
//                                         ),
//                                         const Spacer(),
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(6.0),
//                                               child: Container(
//                                                 decoration: const BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     color: Palette.white),
//                                                 child: const Padding(
//                                                   padding: EdgeInsets.all(6.0),
//                                                   child: Icon(
//                                                     Icons.remove,
//                                                     color: Palette.dukalinkBlack1,
//                                                     size: 18,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 12.0, right: 12.0),
//                                               child: Text(
//                                                 '3',
//                                                 style: TextStyle(
//                                                   color: Palette.dukalinkBlack1,
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize: 20.sp,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(6.0),
//                                               child: Container(
//                                                 decoration: const BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     color: Palette.white),
//                                                 child: const Padding(
//                                                   padding: EdgeInsets.all(6.0),
//                                                   child: Icon(
//                                                     Icons.add,
//                                                     color: Palette.dukalinkBlack1,
//                                                     size: 18,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ]),
//                                     ),
//                                   );
//                                 }),
//                             const Divider(),
//                             SizedBox(height: 10.h),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 8.0, right: 8),
//                               child: ListTile(
//                                 title: Text('VAT',
//                                     style: TextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w400,
//                                         color: Palette.dukalinkBlack1)),
//                                 trailing: const Text('Kshs 380'),
//                               ),
//                             ),
//                             const Divider(),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 8.0, right: 8),
//                               child: ListTile(
//                                 title: Text('(2 items)',
//                                     style: TextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w400,
//                                         color: Palette.dukalinkBlack1)),
//                                 trailing: Text('Kshs 3800',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w400,
//                                       color: Palette.dukalinkPrimary1,
//                                     )),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             CustomTextButton(
//                               text: 'Pay bill',
//                               displayLoading: false,
//                               onTap: () async {},
//                               fontSize: 16.sp,
//                               color: Palette.dukalinkBlack,
//                               width: SizeConfig.screenWidth * 0.9,
//                             ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             CustomTextButton(
//                               text: 'Split bill',
//                               displayLoading: false,
//                               onTap: () async {},
//                               fontSize: 16.sp,
//                               textcolor: Palette.dukalinkBlack1,
//                               color: Palette.dukalinkBlack4,
//                               width: SizeConfig.screenWidth * 0.9,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 150,
//                       top: 50,
//                       child: Card(
//                         shape: const CircleBorder(),
//                         child: CircleAvatar(
//                           backgroundColor: Palette.dukalinkWhiteColor,
//                           radius: 52.r,
//                           child: CircleAvatar(
//                             radius: 46.r,
//                             backgroundImage: NetworkImage(
//                               // '${state.restaurantDetail?.data?.restaurantImage}',
//                               sampleAvator,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//                 // }
//                 // return const Center(
//                 //   child: SpinKitThreeBounce(
//                 //     color: Palette.dukalinkPrimary1,
//                 //   ),
//                 // );
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget topDishesWidget(Dish? dish) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Palette.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15.sm),
//           topRight: Radius.circular(15.sm),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(8.sm),
//               topRight: Radius.circular(8.sm),
//             ),
//             child: Container(
//               width: 150.w,
//               height: SizeConfig.screenHeight * 0.15,
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Palette.dukalinkBlack5,
//                 image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: NetworkImage('${dish?.foodImage}')),
//                 // borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           if (isFavorite) {
//                             setState(() {
//                               isFavorite = false;
//                             });
//                           } else {
//                             setState(() {
//                               isFavorite = true;
//                             });
//                           }
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(5.sm),
//                           decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Palette.dukalinkBlack5),
//                           child: Icon(
//                             Icons.favorite,
//                             color: isFavorite
//                                 ? Palette.dukalinkErrorColor
//                                 : Palette.dukalinkWhiteColor,
//                             size: 20,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(
//                 '${dish?.foodName}',
//                 style: const TextStyle(
//                     fontSize: 14,
//                     color: Palette.dukalinkBlack,
//                     fontWeight: FontWeight.w400),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 'Ksh ${dish?.price}',
//                 style: const TextStyle(
//                     fontSize: 12,
//                     color: Palette.dukalinkBlack3,
//                     fontWeight: FontWeight.w500),
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class StatrtersWidget extends StatefulWidget {
//   final RestaurantDetail restaurantDetailData;
//   const StatrtersWidget({Key? key, required this.restaurantDetailData})
//       : super(key: key);

//   @override
//   State<StatrtersWidget> createState() => _StatrtersWidgetState();
// }

// class _StatrtersWidgetState extends State<StatrtersWidget> {
//   bool isFavorite = false;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 18.0, right: 18.0),
//       child: Column(
//         children: [
//           SizedBox(
//               child: CategoryIconWithText(
//                   menu: widget.restaurantDetailData.data!.menu!)),
//           Row(
//             children: const [
//               Text(
//                 'Starters',
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: Palette.dukalinkBlack,
//                     fontWeight: FontWeight.w400),
//               ),
//               Spacer(),
//               Text(
//                 'See all',
//                 style: TextStyle(
//                     fontSize: 12,
//                     color: Palette.dukalinkPrimaryColor,
//                     decoration: TextDecoration.underline),
//               ),
//             ],
//           ),
//           SizedBox(height: 10.h),
//           Expanded(
//             child: GridView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 5.0,
//                   mainAxisSpacing: 15.0,
//                 ),
//                 itemCount: widget.restaurantDetailData.data?.food?.length,
//                 itemBuilder: (context, index) {
//                   Dish? food = widget.restaurantDetailData.data?.food![index];
//                   return InkWell(
//                     onTap: () =>
//                         Navigator.pushNamed(context, DishScreen.routeName),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Palette.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(15.sm),
//                           topRight: Radius.circular(15.sm),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(8.sm),
//                               topRight: Radius.circular(8.sm),
//                             ),
//                             child: Container(
//                               width: 180.w,
//                               height: SizeConfig.screenHeight * 0.13,
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Palette.dukalinkBlack5,
//                                 image: DecorationImage(
//                                     fit: BoxFit.fill,
//                                     image: NetworkImage('${food?.foodImage}')),
//                                 // borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           if (isFavorite) {
//                                             setState(() {
//                                               isFavorite = false;
//                                             });
//                                           } else {
//                                             setState(() {
//                                               isFavorite = true;
//                                             });
//                                           }
//                                         },
//                                         child: Container(
//                                           padding: EdgeInsets.all(5.sm),
//                                           decoration: const BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Palette.dukalinkBlack5),
//                                           child: Icon(
//                                             Icons.favorite,
//                                             color: isFavorite
//                                                 ? Palette.dukalinkErrorColor
//                                                 : Palette.dukalinkWhiteColor,
//                                             size: 20,
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${food?.foodName}',
//                                     style: const TextStyle(
//                                         fontSize: 16,
//                                         color: Palette.dukalinkBlack,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Text(
//                                     '${food?.menuCategory?.menuName}',
//                                     style: const TextStyle(
//                                         fontSize: 10,
//                                         color: Palette.dukalinkBlack2,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Text(
//                                     'Ksh ${food?.price}',
//                                     style: const TextStyle(
//                                         fontSize: 12,
//                                         color: Palette.dukalinkPrimaryColor,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ]),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
