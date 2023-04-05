// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/login/login_response.dart';
import 'package:dukalink_app/core/data/model/restaurant_model.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/blocs/favoritesCubit/favorite_cubit.dart';
import '../../../core/blocs/favoritesCubit/favorite_state.dart';
import '../../../core/di/injector.dart';
import '../../commonWidget/login_auth_dialog.dart';

class RestaurantItem extends StatefulWidget {
  final RestaurantData restaurant;
  const RestaurantItem({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<RestaurantItem> createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      child: Container(
        width: size.width * 0.5,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sm),
            topRight: Radius.circular(15.sm),
            bottomLeft: Radius.circular(15.sm),
            bottomRight: Radius.circular(15.sm),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${widget.restaurant.restaurantImage}',
              imageBuilder: (context, imageProvider) => Container(
                width: size.width * 0.5,
                height: size.height * 0.14,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.sm),
                      topRight: Radius.circular(8.sm)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          BlocProvider(
                            create: (context) => inject<FavoriteCubit>()
                              ..checkUserFavoritesRestaurant(widget.restaurant),
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
                                        type: SnackbarType.success,
                                        dismissText: 'OK',
                                      );
                                      if (message
                                          .toLowerCase()
                                          .contains('login')) {
                                        bool value = await loginDialog(context);
                                        if (value) {
                                          context
                                              .read<FavoriteCubit>()
                                              .getFavoriteRestaurant();
                                          // context
                                          //     .read<FavoriteCubit>()
                                          //     .getFavoriteRestaurant();
                                        }
                                      }
                                    },
                                    orElse: () {});
                              },
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => const SizedBox(),
                                  checkFavorite: (isFavorite) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() async {
                                          User? user =
                                              await inject<SharedHelper>()
                                                  .getUsersData();
                                          if (user?.id != null) {
                                            context
                                                .read<FavoriteCubit>()
                                                .addFavoriteRestaurant(
                                                    restaurantCode: widget
                                                        .restaurant
                                                        .restaurantCode);
                                          } else {
                                            launchSnackbar(
                                              context: context,
                                              message:
                                                  'You need to login to favorite any restaurant',
                                              okCallback: () {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                              },
                                              type: SnackbarType.error,
                                              dismissText: 'OK',
                                            );
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5.sm),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromRGBO(
                                                230, 230, 230, 1)),
                                        child: Icon(
                                          Icons.favorite,
                                          color: isFavorite
                                              ? Palette.dukalinkErrorColor
                                              : Palette.dukalinkWhiteColor,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  },
                                  loading: () {
                                    return const Center(
                                      child: SpinKitThreeBounce(
                                        color: Palette.dukalinkPrimary1,
                                        size: 20,
                                      ),
                                    );
                                  },
                                  error: (message) {
                                    return SizedBox(
                                      height: 50.h,
                                      child: Center(
                                          child: InkWell(
                                        onTap: () async {
                                          if (message
                                              .toLowerCase()
                                              .contains('login')) {
                                            bool value =
                                                await loginDialog(context);
                                            if (value) {
                                              context
                                                  .read<FavoriteCubit>()
                                                  .addFavoriteRestaurant(
                                                      restaurantCode: widget
                                                          .restaurant
                                                          .restaurantCode);
                                            }
                                          } else {
                                            context
                                                .read<FavoriteCubit>()
                                                .addFavoriteRestaurant(
                                                    restaurantCode: widget
                                                        .restaurant
                                                        .restaurantCode);
                                          }
                                        },
                                        child: Icon(
                                          message
                                                  .toLowerCase()
                                                  .contains('login')
                                              ? Icons.refresh_outlined
                                              : Icons.favorite,
                                          color: Palette.dukalinkBlack4,
                                          size: 55.sm,
                                        ),
                                      )),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/loading.gif',
                  fit: BoxFit.cover,
                  width: 170.w,
                  height: 147.h,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(6.0.sm),
              child: Text(
                widget.restaurant.restaurant.restaurantName!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: isWeb ? 16.sp : 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
