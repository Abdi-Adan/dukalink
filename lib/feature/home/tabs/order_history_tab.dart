import 'package:cached_network_image/cached_network_image.dart';
import 'package:dukalink_app/core/data/model/order_item.dart';
import 'package:dukalink_app/feature/commonWidget/login_auth_dialog.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../core/blocs/food/food_cubit.dart';
import '../../../core/blocs/login/login_cubit.dart';
import '../../../core/blocs/order/order_cubit.dart';
import '../../../core/blocs/order/order_state.dart';
import '../../../core/blocs/orderhistory/orderHistory_cubit.dart';
import '../../../core/blocs/orderhistory/orderHistory_state.dart';
import '../../../core/blocs/restaurant/restaurant_cubit.dart';
import '../../../core/data/model/userOrdersModel.dart';
import '../../../core/di/injector.dart';
import '../../../shared/utils/toast_utils.dart';
import '../../../shared/widgets/custom_text_button.dart';
import '../../dishes/all_dishes.dart';
import '../../dishes/dish_screen.dart';
import '../../orders/order_list.dart';
import '../../restaurant/new_order_progress.dart';
import '../../restaurant/test_order_progress.dart';
import '../home_screen.dart';

class OrderHistoryTab extends StatefulWidget {
  const OrderHistoryTab({Key? key}) : super(key: key);

  @override
  State<OrderHistoryTab> createState() => _OrderHistoryTabState();
}

class _OrderHistoryTabState extends State<OrderHistoryTab> {
  @override
  void initState() {
    // inject<RestaurantCubit>().topRestaurant();
    context.read<RestaurantCubit>().topRestaurant();
    context.read<RestaurantCubit>().allRestaurant();
    context.read<FoodCubit>().topDishes();

    super.initState();
  }

  List<UserOrders> pendingOrders = [];
  List<UserOrders> previousOrders = [];

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        title: Text(
          'Order History',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Palette.dukalinkBlack1),
        ),
        elevation: 5,
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
                }
              });
        }, builder: (ctx, state) {
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
                      // Text(
                      //   message,
                      //   style: const TextStyle(fontSize: 18),
                      // ),
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
                                if (message.toLowerCase().contains('login')) {
                                  bool value = await loginDialog(context);
                                  if (value) {
                                    if (!mounted) return;
                                    ctx
                                        .read<OrderHistoryCubit>()
                                        .getUserOrders();
                                  }
                                }
                              },
                              displayLoading: state is LoadingLoginState)),
                      // ),
                    ],
                  )),
                );
              },
              loading: () {
                return const Center(
                  child: SpinKitThreeBounce(
                    color: Palette.dukalinkPrimary1,
                  ),
                );
              },
              success: (orderlist, orderItem) {
                return OrderHistoryWidget(
                    pendingOrders: pendingOrders,
                    previousOrders: previousOrders);
              });
        }),
      ),
    );
  }
}

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({
    super.key,
    required this.pendingOrders,
    required this.previousOrders,
  });

  final List<UserOrders> pendingOrders;
  final List<UserOrders> previousOrders;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Palette.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.sm),
                    child: Text(
                      'Pending orders',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Palette.dukalinkBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: pendingOrders.length,
                      itemBuilder: (context, index) {
                        UserOrders pendingOrder = pendingOrders[index];
                        return HistoryItem(
                          order: pendingOrder,
                          isPendingOrder: true,
                        );
                      })
                ],
              ),
            ),
          ),
          SizedBox(height: 17.h),
          Container(
            decoration: const BoxDecoration(
              color: Palette.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.sm),
                    child: const Text(
                      'Previous orders',
                      style: TextStyle(
                          fontSize: 18,
                          color: Palette.dukalinkBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: previousOrders.length,
                      itemBuilder: (context, index) {
                        UserOrders previousOrder = previousOrders[index];
                        return HistoryItem(
                          order: previousOrder,
                          isPendingOrder: false,
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.order,
    required this.isPendingOrder,
  }) : super(key: key);

  final UserOrders order;
  final bool isPendingOrder;

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${order.orderNumber}',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Palette.dukalinkBlack2)),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.orderDetails?.length,
                itemBuilder: (context, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            isPendingOrder
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        OrderProgressBottomSheet(
                                            restaurantCode: '${order.id}')))
                                :
                                // for(int i < ){}
                                Navigator.pushNamed(
                                    context, AllDishScreen.routeName);
                          },
                          child: OrderItemWidget(
                            isPendingOrder: isPendingOrder,
                            orderItem: order.orderDetails![index],
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final OrderDetail? orderItem;
  final bool isPendingOrder;
  const OrderItemWidget(
      {Key? key, required this.orderItem, required this.isPendingOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isWeb = Responsive.isDesktop(context);
    return Row(
      children: [
        // TODO add image url instead of notes
        CachedNetworkImage(
          imageUrl: '${orderItem?.foodImage![0].url}',
          imageBuilder: (context, imageProvider) => Container(
            height: 60.h,
            width: 60.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          placeholder: (context, url) => Image.asset(
            'assets/images/loading.gif',
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 7.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${orderItem?.orderList?.foodFoodName} +${orderItem?.orderList?.quantity} Items',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Palette.dukalinkBlack2)),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: size.width * 0.58,
              child: Row(
                children: [
                  Text('Ksh ${orderItem?.orderList?.foodPrice}',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Palette.dukalinkBlack3)),
                  const Spacer(),
                  Container(
                    width: isWeb ? 100 : 80.w,
                    height: isWeb ? 35 : 30.h,
                    decoration: BoxDecoration(
                      color: isPendingOrder
                          ? Palette.dukalinkPrimary5
                          : Palette.dukalinkPrimaryColor,
                      borderRadius: BorderRadius.circular(15.0.sm),
                    ),
                    child: isPendingOrder
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.watch_later_rounded,
                                size: isWeb ? 14 : 13,
                                color: Palette.dukalinkBlack2,
                              ),
                              // Text(
                              //   '${orderItem?.food?.preparationTime ?? 'mins'} left',
                              //   style: const TextStyle(
                              //     fontSize: 10,
                              //     color: Palette.dukalinkBlack3,
                              //   ),
                              // ),
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                top: 5.0.sm,
                                bottom: 7.sm,
                                left: 5.sm,
                                right: 5.sm),
                            child: Center(
                              child: Text(
                                'Reorder',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Palette.dukalinkBlack1),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
