import 'dart:async';

import 'package:dukalink_app/core/data/model/newFavoriteFoodModel.dart';
import 'package:dukalink_app/feature/restaurant/widget/restaurant_item.dart';
import 'package:dukalink_app/core/data/model/restaurant_model.dart';
import 'package:dukalink_app/core/data/model/favoriteRestaurantModel.dart'
    as newRestaurantModel;
import 'package:dukalink_app/core/data/repository/restaurant_repository.dart';
import 'package:dukalink_app/feature/home/home_screen.dart';
import 'package:dukalink_app/feature/home/sidebar_menu.dart';
import 'package:dukalink_app/feature/qrScanner/scan_home.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/singletons/recent_searches_store.dart';
import 'package:dukalink_app/shared/utils/constants.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/subjects.dart';
import '../../../core/blocs/cubit/res_cubit_cubit.dart';
import '../../../core/blocs/food/food_cubit.dart';
import '../../../core/blocs/food/food_state.dart';
import '../../../core/blocs/orderhistory/orderHistory_cubit.dart';
import '../../../core/blocs/orderhistory/orderHistory_state.dart';
import '../../../core/blocs/restaurant/restaurant_cubit.dart';
import '../../../core/blocs/restaurant/restaurant_state.dart';
import '../../../core/data/model/userOrdersModel.dart';
import '../../../core/di/injector.dart';
import '../../../shared/configs/assets.dart';
import '../../dishes/all_dishes.dart';
import '../../dishes/dish_screen.dart';
import '../../dishes/widgets/dish_item.dart';
import '../../restaurant/all_restaurant.dart';
import '../../restaurant/new_order_progress_bottomSheet.dart';
import '../../restaurant/retstaurant_detail.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import '../../restaurant/slidingUpPanel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  RestaurantCubit? restaurantCubit;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchFocusNode = FocusNode();
  bool? orderOn = false;
  //  OrderTrackingModel? pendingOrders;
  List<UserOrders> pendingOrders = [];
  List<UserOrders> previousOrders = [];
  // var allUserOrders = [];

  @override
  void initState() {
    BlocProvider.of<ResBloc>(context).add(Res());
    // getAllOrders();
    super.initState();
  }

  @override
  void dispose() {
    restaurantCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isTablet(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const SidebarMenuScreen(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: const CircleBorder(),
        label: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: SvgPicture.asset(
            Assets.qrScan,
            fit: BoxFit.cover,
          ),
        ),
        onPressed: () {
          scanQR();
        },
      ),

      body: BlocProvider(
        create: (context) => inject<OrderHistoryCubit>()..getUserOrders(),
        child: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
            listener: (ctx, state) async {
          state.maybeWhen(
              orElse: () {},
              error: (message) async {
                // launchSnackbar(
                //   context: context,
                //   message: message,
                //   okCallback: () {
                //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
                //   },
                //   type: SnackbarType.error,
                //   dismissText: 'OK',
                // );
                if (message.toLowerCase().contains('login')
                    // ||
                    //     message.toLowerCase().contains('error')
                    ) {
                  // bool value = await loginDialog(context);
                  // if (value) {
                  //   if (!mounted) return null;
                  //   ctx.read<OrderHistoryCubit>().getUserOrders();
                  // }
                }
              },
              success: (orderlist, orderItem) {
                // orderlist!.isNotEmpty ? orderOn = true : orderOn = false;
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
                  pendingOrders.isNotEmpty ? orderOn = true : orderOn = false;
                }
              });
        }, builder: (ctx, state) {
          return state.maybeWhen(
              orElse: () => const SizedBox(),
              error: (message) {
                return HomeWidget(
                    isWeb: isWeb,
                    scaffoldKey: _scaffoldKey,
                    searchFocusNode: searchFocusNode,
                    size: size);
              },
              loading: () {
                return const Center(
                  child: SpinKitThreeBounce(
                    color: Palette.dukalinkPrimary1,
                  ),
                );
              },
              success: (orderlist, orderItem) {
                return orderOn!
                    ?
                    // TODO remove draggable
                    //  DraggableBottomSheet(
                    //     barrierDismissible: true,
                    //     curve: Curves.easeIn,
                    //     // minExtent: MediaQuery.of(context).size.height * 0.191,
                    //     minExtent: 180,
                    //     previewWidget: NewOrderProgressBottomSheet(
                    //       restaurantCode: '${orderlist![0].id}',
                    //     ),
                    //     expandedWidget: NewOrderProgressBottomSheet(
                    //       restaurantCode: '${orderlist[0].id}',
                    //     ),
                    //     backgroundWidget:
                    // HomeWidget(
                    //         isWeb: isWeb,
                    //         scaffoldKey: _scaffoldKey,
                    //         searchFocusNode: searchFocusNode,
                    //         size: size),
                    //     maxExtent: MediaQuery.of(context).size.height * 0.8,
                    //     onDragging: (pos) {},
                    //     expansionExtent: 150,
                    //   )
                    SlidingUpPanel(
                        minHeight: MediaQuery.of(context).size.height * 0.25,
                        maxHeight: MediaQuery.of(context).size.height * 0.8,
                        panel: NewOrderProgressBottomSheet(
                          restaurantCode: '${orderlist![0].id}',
                        ),
                        backdropEnabled: true,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.0),
                            topRight: Radius.circular(18.0)),
                        body: HomeWidget(
                            isWeb: isWeb,
                            scaffoldKey: _scaffoldKey,
                            searchFocusNode: searchFocusNode,
                            size: size))
                    : HomeWidget(
                        isWeb: isWeb,
                        scaffoldKey: _scaffoldKey,
                        searchFocusNode: searchFocusNode,
                        size: size);

                // OrderHistoryWidget(pendingOrders: pendingOrders, previousOrders: previousOrders);
              });
        }),
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      if (kIsWeb) {
        Fimber.e('=======>');
        Navigator.pushNamedAndRemoveUntil(
            context, ScannerHome.routeName, (route) => false,
            arguments: true);
      } else {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        Fimber.d('BARCODE  $barcodeScanRes');
        if (barcodeScanRes.isNotEmpty &&
            barcodeScanRes != '' &&
            !barcodeScanRes.contains('-1')) {
          var url = Uri.parse(barcodeScanRes);
          String branchId = url.queryParameters['branch']!;
          String tableNumber = url.queryParameters['table_number']!;
          var tableId = url.queryParameters['table_id'];

          tableID.add(tableId!);

          // ignore: use_build_context_synchronously
          launchSnackbar(
            context: context,
            message:
                'QR Code scanned successfuly, taking you to the restaurant',
            okCallback: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            type: SnackbarType.success,
            dismissText: 'OKAY',
          );

          isQRScanned.add(true);

          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantDetailScreen(
                        restaurantCode: branchId,
                        tableNumber: tableNumber,
                      )));
        }
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _scanBarcode = barcodeScanRes;
    });
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required this.isWeb,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.searchFocusNode,
    required this.size,
  }) : _scaffoldKey = scaffoldKey;

  final bool isWeb;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final FocusNode searchFocusNode;
  final Size size;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final searchController = TextEditingController();
  final _searchTapSubject = BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    searchController.dispose();
    widget.searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Palette.dukalinkOrangeColor,
        onRefresh: () =>
            Navigator.pushReplacementNamed(context, HomeScreen.routeName),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              top: 25.sm,
              left: 10.sm,
              right: 10.sm,
              // bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0.sm),
                  child: SvgPicture.asset(
                    Assets.logo,
                    height: 30,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () =>
                      widget._scaffoldKey.currentState?.openEndDrawer(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        backgroundColor: Palette.dukalinkPrimaryColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      height: widget.size.height,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Wrap(
                          children: [
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyRestaurantSearchDelegate()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Search for restaurants',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Icon(
                                            Icons.search,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Top restaurants',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context,
                                            AllRestaurantScreen.routeName),
                                        child: const Text(
                                          'See all',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Palette.dukalinkPrimaryColor,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                BlocConsumer<ResBloc, ResState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      if (state is ResSuccess) {
                                        return SizedBox(
                                          height: 210.h,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  state.restaurant.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      EdgeInsets.all(3.0.sm),
                                                  child: InkWell(
                                                    onTap: () =>
                                                        Navigator.pushNamed(
                                                            context,
                                                            RestaurantDetailScreen
                                                                .routeName,
                                                            arguments: {
                                                          'restaurant_code':
                                                              state
                                                                  .restaurant[
                                                                      index]
                                                                  .restaurantCode
                                                        }),
                                                    child: RestaurantItem(
                                                        restaurant: state
                                                            .restaurant[index]),
                                                  ),
                                                );
                                              }),
                                        );
                                      }
                                      if (state is ResError) {
                                        return Center(
                                          child: Text(state.error),
                                        );
                                      }
                                      return const Center(
                                        child: SpinKitThreeBounce(
                                          color: Palette.dukalinkPrimary1,
                                        ),
                                      );
                                      // );
                                    }),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Top dishes',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () => Navigator.pushNamed(
                                                  context,
                                                  AllDishScreen.routeName),
                                              child: const Text(
                                                'See all',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Palette
                                                        .dukalinkPrimaryColor,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      BlocProvider(
                                        create: (context) =>
                                            inject.get<FoodCubit>()
                                              ..topDishes(),
                                        child:
                                            BlocConsumer<FoodCubit, FoodState>(
                                          listener: (context, state) {
                                            state.maybeWhen(
                                                error: (message) {
                                                  launchSnackbar(
                                                    context: context,
                                                    message: message,
                                                    okCallback: () {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                    },
                                                    type: SnackbarType.error,
                                                    dismissText: 'OK',
                                                  );
                                                },
                                                orElse: () {});
                                          },
                                          builder: (context, state) {
                                            return state.maybeWhen(
                                                orElse: () => const SizedBox(),
                                                error: (message) {
                                                  return SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Center(
                                                        child: Text(message)),
                                                  );
                                                },
                                                loading: () {
                                                  return const Center(
                                                    child: SpinKitThreeBounce(
                                                      color: Palette
                                                          .dukalinkPrimary1,
                                                    ),
                                                  );
                                                },
                                                success: (dish) {
                                                  return SizedBox(
                                                    height: widget.isWeb
                                                        ? 270.h
                                                        : 225.h,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: dish?.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0.sm),
                                                            child: InkWell(
                                                              onTap: () => Navigator
                                                                  .pushNamed(
                                                                      context,
                                                                      DishScreen
                                                                          .routeName,
                                                                      arguments: {
                                                                    'dish': dish![
                                                                        index]
                                                                  }),
                                                              child: DishItem(
                                                                dish: dish![
                                                                        index]
                                                                    as FavoriteFood,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: widget.isWeb
                                      ? 270.h
                                      : widget.size.height * 0.32,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Other Restaurants',
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                ),
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () =>
                                                    Navigator.pushNamed(
                                                        context,
                                                        AllRestaurantScreen
                                                            .routeName),
                                                child: Text(
                                                  'See all',
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Palette
                                                          .dukalinkPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        BlocProvider(
                                          create: (context) =>
                                              inject.get<RestaurantCubit>()
                                                ..allRestaurant(),
                                          child: BlocConsumer<RestaurantCubit,
                                                  RestaurantState>(
                                              // bloc:
                                              listener: (context, state) {
                                            state.maybeWhen(
                                                error: (message) {
                                                  launchSnackbar(
                                                    context: context,
                                                    message: message,
                                                    okCallback: () {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                    },
                                                    type: SnackbarType.error,
                                                    dismissText: 'OK',
                                                  );
                                                },
                                                orElse: () {});
                                          }, builder: (context, state) {
                                            return state.maybeWhen(
                                                orElse: () => const SizedBox(),
                                                error: (message) {
                                                  return SizedBox(
                                                    height: 50.h,
                                                    child: Center(
                                                        child: Text(message)),
                                                  );
                                                },
                                                loading: () {
                                                  return const Center(
                                                    child: SpinKitThreeBounce(
                                                      color: Palette
                                                          .dukalinkPrimary1,
                                                    ),
                                                  );
                                                },
                                                success:
                                                    (allRestaurant, detail) {
                                                  return SizedBox(
                                                    height: widget.isWeb
                                                        ? 220.h
                                                        : 200.h,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: allRestaurant
                                                            ?.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: InkWell(
                                                              onTap: () => Navigator
                                                                  .pushNamed(
                                                                      context,
                                                                      RestaurantDetailScreen
                                                                          .routeName,
                                                                      arguments: {
                                                                    'restaurant_code':
                                                                        allRestaurant![index]
                                                                            .restaurantCode
                                                                  }),
                                                              child: RestaurantItem(
                                                                  restaurant:
                                                                      allRestaurant![
                                                                          index]),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                });
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}

class MyRestaurantSearchDelegate extends StatefulWidget {
  const MyRestaurantSearchDelegate({super.key});

  @override
  State<MyRestaurantSearchDelegate> createState() =>
      _MyRestaurantSearchDelegateState();
}

class _MyRestaurantSearchDelegateState
    extends State<MyRestaurantSearchDelegate> {
  final _searchSubject = BehaviorSubject<String>();
  RecentSearchesStore recent = RecentSearchesStore();
  TextEditingController searchCriteriaController = TextEditingController();
  late Future<List<dynamic>> searchResultData;
  final _searchBarEnabled = BehaviorSubject<bool>.seeded(true);

  @override
  void initState() {
    super.initState();
    searchResultData = searchForRestaurantItems(searchCriteriaController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _searchSubject.close();
    recent.recentSearches.close();
    searchCriteriaController.dispose();
  }

  bool disableSearch(v) {
    setState(() {});
    return v;
  }

  void reload(String recentSearch) {
    setState(() {
      searchResultData = searchForRestaurantItems(recentSearch);
    });
  }

  Widget buildRecentSearches() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Recent searches',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: recent.recentSearches.value.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  setState(() {
                    reload(recent.recentSearches.value[index]);
                    _searchBarEnabled.value = false;
                  });
                },
                child: ListTile(
                    leading: const Icon(Icons.restaurant),
                    title: Text(recent.recentSearches.value[index].toString())),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildEmptyState() {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Card(
              elevation: 2,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Palette.dukalinkPrimary1,
                backgroundImage: AssetImage('assets/icons/search.png'),
              ),
            ),
            SizedBox(height: 30),
            Text('What are you searching for?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Text('Search for your favorite restaurant.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextFormField(
          controller: searchCriteriaController,
          cursorColor: Palette.dukalinkOrangeColor,
          autofocus: true,
          enabled: _searchBarEnabled.value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintText: 'Search for restaurants...',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onFieldSubmitted: (value) {
            setState(() {});
            disableSearch(false);
            reload(searchCriteriaController.text);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              searchCriteriaController.text = '';
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: FutureBuilder<List<dynamic>>(
              future: searchResultData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    searchCriteriaController.text.isNotEmpty) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Palette.dukalinkPrimary1,
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}',
                          textAlign: TextAlign.center));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  var restaurantsListResult = snapshot.data!;
                  return GridView.builder(
                      shrinkWrap: true,
                      itemCount: restaurantsListResult.first.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> restList =
                            restaurantsListResult.first;
                        RestaurantData data = RestaurantData.fromJson(
                            restList['restaurants'][index]);
                        return InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RestaurantDetailScreen.routeName,
                              arguments: {
                                'restaurant_code': restList['restaurants']
                                    [index]['restaurant_code']
                              }),
                          child: RestaurantItem(
                            restaurant: data,
                          ),
                        );
                      });
                } else if (searchCriteriaController.text.isEmpty &&
                    recent.recentSearches.hasValue) {
                  return buildRecentSearches();
                } else if (!recent.recentSearches.hasValue &&
                    snapshot.hasData &&
                    snapshot.data!.isEmpty) {
                  return buildEmptyState();
                } else {
                  return buildEmptyState();
                }
              }),
        ),
      ),
    );
  }

  Future<List<dynamic>> searchForRestaurantItems(String searchCriteria) async {
    if (recent.recentSearches.hasValue &&
        searchCriteriaController.text.isNotEmpty) {
      List<String> currentList = recent.recentSearches.value;
      currentList.add(searchCriteriaController.text);
      currentList
          .map((e) => e.toLowerCase())
          .toSet()
          .toList(); //Remove duplicates
      recent.recentSearches.add(currentList);
    } else if (!recent.recentSearches.hasValue &&
        searchCriteriaController.text.isNotEmpty) {
      recent.recentSearches.add([searchCriteriaController.text]);
    }
    var searchResults = await RestaurantRepositoryImpl(
            apiProvider: inject(), sharedHelper: inject())
        .searchForRestaurant(searchCriteria);

    return searchResults;
  }
}
