// ignore_for_file: prefer_is_empty

import 'dart:async';

import 'package:dukalink_app/core/blocs/restaurant/restaurant_state.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/feature/restaurant/retstaurant_detail.dart';
import 'package:dukalink_app/feature/restaurant/widget/restaurant_item.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/blocs/restaurant/restaurant_cubit.dart';
import '../../core/data/model/favoriteRestaurantModel.dart';
import '../../core/data/model/restaurant_model.dart';

class AllRestaurantScreen extends StatefulWidget {
  static const routeName = 'AllRestaurantScreen';

  const AllRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<AllRestaurantScreen> createState() => _AllRestaurantScreenState();
}

class _AllRestaurantScreenState extends State<AllRestaurantScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();
    final debouncer = Debouncer();
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Palette.dukalinkBlack),
        title: const Text("All Restaurants",
            style: TextStyle(color: Palette.dukalinkBlack)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                  backgroundColor: Palette.dukalinkPrimaryColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => inject<RestaurantCubit>()..allRestaurant(),
        child: BlocConsumer<RestaurantCubit, RestaurantState>(
          // bloc:
          listener: (context, state) {
            state.maybeWhen(
                error: (message) {
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
                orElse: () {},
                success: (allRestaurant, detail) {});
          },
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const SizedBox(),
                error: (message) {
                  return SizedBox(
                    height: 50,
                    child: Center(child: Text(message)),
                  );
                },
                loading: () {
                  return const Center(
                    child: SpinKitThreeBounce(
                      color: Palette.dukalinkPrimary1,
                    ),
                  );
                },
                success: (allRestaurant, detail) {
                  return RestaurantListWidget(
                    focusNode: focusNode,
                    debouncer: debouncer,
                    size: size,
                    allRestaurant: allRestaurant,
                  );
                }
                //  TODO for search uncomment this
                // ,
                // search: (allRestaurant) {
                //   return RestaurantListWidget(
                //     focusNode: focusNode,
                //     debouncer: debouncer,
                //     size: size,
                //     allRestaurant: allRestaurant,
                //   );
                // }
                );
          },
        ),
      ),
    );
  }
}

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({
    Key? key,
    required this.focusNode,
    required this.debouncer,
    required this.size,
    this.allRestaurant,
  }) : super(key: key);
  final List<RestaurantData>? allRestaurant;
  final FocusNode focusNode;
  final Debouncer debouncer;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0.sm, left: 10.sm, right: 10.sm),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.0.sm),
                    child: const Text(
                      'Restaurants',
                      style: TextStyle(
                          fontSize: 20,
                          color: Palette.dukalinkBlack,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // searchResultRestaurantListWidget.length != 0
                  //     ?
                  Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio: 3 / 3.4,
                          mainAxisExtent: 200,
                        ),
                        itemCount: allRestaurant?.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 197,
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, RestaurantDetailScreen.routeName,
                                  arguments: {
                                    'restaurant_code':
                                        allRestaurant![index].restaurantCode
                                  }),
                              child: RestaurantItem(
                                  restaurant: allRestaurant![index]),
                            ),
                          );
                        }),
                  )
                  // : Center(
                  //     child: Container(
                  //         child: const Text(
                  //             "Restaurants not availlable")))
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
