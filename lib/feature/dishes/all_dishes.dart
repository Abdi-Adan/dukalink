import 'package:dukalink_app/core/blocs/food/food_state.dart';
// import 'package:dukalink_app/core/data/model/dishes_model.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/feature/dishes/dish_screen.dart';
import 'package:dukalink_app/feature/dishes/widgets/dish_item.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/blocs/food/food_cubit.dart';
// import '../../core/data/model/newFavoriteFoodModel.dart';
import '../../core/data/model/dishes_model.dart';
import '../../core/data/model/newFavoriteFoodModel.dart';
import '../../core/data/model/new_orders_model.dart';
import '../../responsive.dart';
import '../restaurant/all_restaurant.dart';

class AllDishScreen extends StatefulWidget {
  static const routeName = 'AllDishScreen';

  const AllDishScreen({Key? key}) : super(key: key);

  @override
  State<AllDishScreen> createState() => _AllDishScreenState();
}

class _AllDishScreenState extends State<AllDishScreen> {
  var focusNode = FocusNode();
  final debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Palette.dukalinkBlack),
        title: const Text("All Dishes",
            style: TextStyle(color: Palette.dukalinkBlack)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40.h,
              width: 40.w,
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
        create: (context) => inject<FoodCubit>()..topDishes(),
        child: BlocConsumer<FoodCubit, FoodState>(
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
              orElse: () {});
        }, builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            error: (message) {
              return SizedBox(
                height: 100.h,
                width: 100.w,
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
            success: (dish) {
              return DishListWidget(
                size: size,
                focusNode: focusNode,
                debouncer: debouncer,
                dish: dish ?? [],
              );
            },
            search: (searchResult) {
              Fimber.e("Search reslut length ${searchResult?.length}");
              return DishListWidget(
                size: size,
                focusNode: focusNode,
                debouncer: debouncer,
                dish: searchResult ?? [],
              );
            },
          );
        }),
      ),
    );
  }
}

class DishListWidget extends StatelessWidget {
  const DishListWidget({
    Key? key,
    required this.size,
    required this.focusNode,
    required this.debouncer,
    required this.dish,
  }) : super(key: key);

  final Size size;
  final FocusNode focusNode;
  final Debouncer debouncer;
  final List<FavoriteFood>? dish;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0.sm, left: 10.sm, right: 10.sm),
          child: Container(
            // width: SizeConfig.screenWidth,
            // height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0.sm),
                  child: Text(
                    'Dishes',
                    style: TextStyle(
                        fontSize: 19.sp,
                        color: Palette.dukalinkBlack,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.h,
                      mainAxisSpacing: 15.w,
                    ),
                    itemCount: dish?.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 225.h,
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, DishScreen.routeName,
                              arguments: {'dish': dish![index]}),
                          child: DishItem(
                            dish: dish![index] as FavoriteFood,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
