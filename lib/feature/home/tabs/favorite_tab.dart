import 'package:dukalink_app/core/blocs/favoritesCubit/favorite_state.dart';
import 'package:dukalink_app/feature/dishes/dish_screen.dart';
import 'package:dukalink_app/feature/restaurant/retstaurant_detail.dart';
import 'package:dukalink_app/feature/restaurant/widget/restaurant_item.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../core/blocs/favoritesCubit/favorite_cubit.dart';
import '../../../core/data/model/restaurant_model.dart';
import '../../../core/di/injector.dart';
import '../../../shared/utils/toast_utils.dart';
import '../../commonWidget/login_auth_dialog.dart';
// import '../../dishes/widgets/dish_item.dart';
// import '../../dishes/widgets/favorite_dish_item.dart';
import '../../dishes/widgets/dish_item.dart';
import '../../dishes/widgets/favorite_dish_item.dart';
import '../home_screen.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  void initState() {
    // inject<RestaurantCubit>().topRestaurant();
    // context.read<FavoriteCubit>().getFavoriteFood();
    // context.read<FavoriteCubit>().getFavoriteRestaurant();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.all(12.0.sm),
          child: Row(
            children: [
              InkWell(
                  onTap: () =>
                      {Navigator.pushNamed(context, HomeScreen.routeName)},
                  child: const Icon(Icons.arrow_back_rounded)),
              SizedBox(width: 15.w),
              Text(
                'Favorites',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Palette.dukalinkBlack,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                // width: size.width,
                // height: isWeb ? 280.h : size.height * 0.33,
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
                          'Favorite restaurants',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Palette.dukalinkBlack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      BlocProvider(
                        create: (context) =>
                            inject<FavoriteCubit>()..getFavoriteRestaurant(),
                        child: BlocConsumer<FavoriteCubit, FavoriteState>(
                            listener: (context, state) {
                          state.maybeWhen(
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
                                    if (!mounted) return null;
                                    context
                                        .read<FavoriteCubit>()
                                        .getFavoriteFood();
                                    context
                                        .read<FavoriteCubit>()
                                        .getFavoriteFood();
                                  }
                                }
                              },
                              orElse: () {});
                        }, builder: (context, state) {
                          return state.maybeWhen(
                              orElse: () => const SizedBox(),
                              error: (message) {
                                return SizedBox(
                                  height: 112,
                                  child: Center(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        message,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          if (message
                                              .toLowerCase()
                                              .contains('login')) {
                                            bool value =
                                                await loginDialog(context);
                                            if (value) {
                                              if (!mounted) return;
                                              context
                                                  .read<FavoriteCubit>()
                                                  .getFavoriteFood();
                                              context
                                                  .read<FavoriteCubit>()
                                                  .getFavoriteFood();
                                            }
                                          }
                                        },
                                        child: Icon(
                                          Icons.refresh_outlined,
                                          color: Palette.dukalinkBlack4,
                                          size: 55.sm,
                                        ),
                                      ),
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
                              restaurantSuccess: (restaurant) {
                                return restaurant!.data.isEmpty
                                    ? const Center(
                                        child: Text(
                                            "No Favorite restaurant found"),
                                      )
                                    : SizedBox(
                                        // flex: 1,
                                        height: isWeb ? 220.h : 200.h,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: restaurant.data.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.all(3.0.sm),
                                                child: InkWell(
                                                  onTap: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          RestaurantDetailScreen
                                                              .routeName,
                                                          arguments: {
                                                        'restaurant_code':
                                                            restaurant
                                                                .data[index]
                                                                .restaurantCode
                                                      }),
                                                  child: RestaurantItem(
                                                      restaurant: restaurant
                                                              .data[index]
                                                          as RestaurantData),
                                                ),
                                              );
                                            }),
                                      );
                              });
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              // topDishesWidget(),
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
                          'Favorite dishes',
                          style: TextStyle(
                              fontSize: 20,
                              color: Palette.dukalinkBlack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      BlocProvider(
                        create: (context) =>
                            inject<FavoriteCubit>()..getFavoriteFood(),
                        child: BlocConsumer<FavoriteCubit, FavoriteState>(
                          // bloc:
                          listener: (context, state) {
                            state.maybeWhen(
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
                                },
                                orElse: () {});
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                                orElse: () => const SizedBox(),
                                error: (message) {
                                  return const SizedBox();
                                },
                                loading: () {
                                  return const Center(
                                    child: SpinKitThreeBounce(
                                      color: Palette.dukalinkPrimary1,
                                    ),
                                  );
                                },
                                foodSuccess: (dish) {
                                  return dish.isEmpty
                                      ? const Center(
                                          child: Text("No Favorite dish found"),
                                        )
                                      : GridView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 1,
                                          ),
                                          itemCount: dish.length,
                                          itemBuilder: (context, index) {
                                            return dish.isNotEmpty
                                                ? Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.sm),
                                                    child: InkWell(
                                                      onTap: () =>
                                                          Navigator.pushNamed(
                                                              context,
                                                              DishScreen
                                                                  .routeName,
                                                              arguments: {
                                                            'dish': dish[index]
                                                          }),
                                                      child: DishItem(
                                                        dish: dish[index],
                                                      ),
                                                    ),
                                                  )
                                                : const Center(
                                                    child: Text(
                                                        'You have no favorite dish'));
                                          });
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
