// ignore_for_file: use_build_context_synchronously
import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/login/login_response.dart';
import 'package:dukalink_app/feature/restaurant/retstaurant_detail.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../core/blocs/favoritesCubit/favorite_cubit.dart';
import '../../../core/blocs/favoritesCubit/favorite_state.dart';
import '../../../core/data/model/newFavoriteFoodModel.dart';
import '../../../core/di/injector.dart';
import '../../commonWidget/login_auth_dialog.dart';

class DishItem extends StatefulWidget {
  final FavoriteFood dish;
  const DishItem({Key? key, required this.dish}) : super(key: key);

  @override
  State<DishItem> createState() => _DishItemState();
}

class _DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    String? restaurantName = widget.dish.branch!.restaurant!.restaurantName;
    var formatedResname = '$restaurantName'.capitalize();

    return Card(
      elevation: 2,
      child: Container(
        width: size.width * 0.5,
        height: size.height * 0.77,
        decoration: BoxDecoration(
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.108,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Palette.dukalinkBlack5,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${widget.dish.foodImageJson!.first.url}')),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocProvider(
                          create: (context) => inject<FavoriteCubit>()
                            ..checkUserFavoritesFood(widget.dish),
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
                                    if (message
                                        .toLowerCase()
                                        .contains('login')) {
                                      bool value = await loginDialog(context);
                                      if (value) {
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
                                              .addFavoriteFood(
                                                  foodCode:
                                                      widget.dish.foodCode ??
                                                          '');
                                        } else {
                                          launchSnackbar(
                                            context: context,
                                            message:
                                                'You need to login to favorite any food item',
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
                                          color: Palette.dukalinkBlack5),
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
                                                .addFavoriteFood(
                                                    foodCode:
                                                        widget.dish.foodCode ??
                                                            '');
                                          }
                                        } else {
                                          context
                                              .read<FavoriteCubit>()
                                              .addFavoriteFood(
                                                  foodCode:
                                                      widget.dish.foodCode ??
                                                          '');
                                        }
                                      },
                                      child: Icon(
                                        message.toLowerCase().contains('login')
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.dish.foodName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isWeb ? 18.sp : 14.sp,
                        color: Palette.dukalinkBlack,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      formatedResname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isWeb ? 16.sp : 14.sp,
                        color: Palette.dukalinkBlack2,
                        // fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Ksh ${widget.dish.variants!.isNotEmpty ? widget.dish.variants?.first.values?.first.price : widget.dish.price}',
                      style: TextStyle(
                        fontSize: isWeb ? 19.sp : 17.sp,
                        color: Palette.dukalinkPrimaryColor,
                        // fontWeight: FontWeight.w500
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
