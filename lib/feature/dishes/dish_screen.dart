// ignore_for_file: use_build_context_synchronously

import 'package:dukalink_app/core/blocs/cartCubit/cart_state.dart';
import 'package:dukalink_app/core/blocs/order/order_state.dart';
import 'package:dukalink_app/core/data/model/dishes_model.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/feature/dishes/widgets/addon_item.dart';
import 'package:dukalink_app/feature/dishes/widgets/side_item.dart';
import 'package:dukalink_app/feature/orders/order_list.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:rxdart/subjects.dart';
import '../../core/blocs/cartCubit/cart_cubit.dart';
import '../../core/data/model/newFavoriteFoodModel.dart';
import '../../core/data/model/request/cart_request.dart';
import 'widgets/order_already_exists_screen.dart';
import 'widgets/variant_item.dart';

class DishScreen extends StatefulWidget {
  static const routeName = 'DishScreen';

  const DishScreen({Key? key}) : super(key: key);

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  BehaviorSubject<double> totalPrice = BehaviorSubject.seeded(0.0);

  List<FoodAddon> selectedAddonList = [];
  List<CartVariant>? selectedVariant = [];
  List<Sides> selectedSidesList = [];
  bool checked = false;
  TextEditingController descriptionController = TextEditingController();
  int count = 1;
  FavoriteFood? _dish;
  var variantValueName = '';
  var variantNameList = [];
  var variantPriceList = [];
  var variantTypeList = [];

  var variantType = '';
  var variantPrice = 0.0;
  var foodPrice = 0.0;
  var addOnsTotalPrice = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      _dish = args['dish'];
      if (_dish?.variants != null && _dish!.variants!.isNotEmpty) {
        foodPrice = double.parse(_dish!.variants!.first.values!.first.price!);
      } else {
        foodPrice = _dish!.price!;
        debugPrint("FOOD PRICE: $foodPrice");
      }
    }
    // totalPrice.value = foodPrice;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    totalPrice.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomSheet: SizedBox(
        height: 145.h,
        width: size.width,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.sm),
            width: isWeb ? 1000.w : null,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                onTap: () {
                                  if (count != 0) {
                                    setState(() {
                                      count -= 1;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.white),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.remove,
                                      color: Palette.dukalinkBlack1,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: Text(
                                '$count',
                                style: TextStyle(
                                  color: Palette.dukalinkBlack1,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                onTap: () {
                                  // if (count != 0) {
                                  setState(() {
                                    count += 1;
                                  });
                                  // }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.white),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.add,
                                      color: Palette.dukalinkBlack1,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                BlocProvider(
                  create: (context) => inject<CartCubit>(),
                  child: BlocConsumer<CartCubit, CartState>(
                      listener: (ctx, state) async {
                    state.maybeWhen(
                        orElse: () {},
                        generateOrderId: (orderId) {
                          // for (int i = 0; i < _dish!.variants!.length; i++) {
                          //   selectedVariant!.add(
                          //     CartVariant(
                          //       name: variantType.toString(),
                          //       price: variantPrice.toString(),
                          //       valueName: variantValueName));
                          // }
                          ctx.read<CartCubit>().addItemToCart(
                              foodCode: '${_dish?.foodCode}',
                              restaurantId: '${_dish?.branch?.restaurantCode}',
                              quantity: count.toString(),
                              orderId: orderId,
                              addOns: selectedAddonList,
                              sides: selectedSidesList,
                              amount: selectedAddonList.isNotEmpty
                                  ? ((addOnsTotalPrice + foodPrice) * count)
                                  : (foodPrice * count),
                              orderVariant: variantPrice == 0.0 ||
                                      variantValueName == "" ||
                                      variantType == ""
                                  ? []
                                  : [
                                      CartVariant(
                                          name: variantType.toString(),
                                          price: variantPrice.toString(),
                                          valueName: variantValueName)
                                    ]);
                        },
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
                          if (message.contains(
                              "duplicate key value violates unique constraint")) {
                            bool? value = await orderAlreadyExists(context);
                            if (value!) {
                              ctx.read<CartCubit>().createOrderId(
                                    // '${_dish?.menuCategory?.restaurantCode}',
                                    '${_dish?.branch?.restaurantCode}',
                                  );
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        success: (orderItem, orderlist) {
                          Navigator.pushNamed(
                              context, OrderListScreen.routeName,
                              arguments: {
                                'restaurant_code':
                                    '${_dish?.branch?.restaurantCode}',
                                'totalPlusExtras':
                                    '${_dish!.foodAddons!.isNotEmpty ? (totalPrice.value * count) : (foodPrice * count)}'
                              });
                        });
                  }, builder: (ctx, state) {
                    return CustomTextButton(
                      text:
                          'Add to order (${selectedAddonList.isNotEmpty ? ((addOnsTotalPrice + foodPrice) * count) : (foodPrice * count)})',
                      displayLoading: state is LoadingOrderState,
                      onTap: () {
                        ctx.read<CartCubit>().createOrGetOrderId(
                              '${_dish?.branch?.restaurantCode}',
                            );
                      },
                      fontSize: 20,
                      color: Palette.dukalinkBlack,
                      width: size.width * 0.9,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Center(
          child: SizedBox(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: Swiper(
                        itemCount: _dish!.foodImageJson!.length,
                        indicatorLayout: PageIndicatorLayout.SCALE,
                        pagination: const SwiperPagination(),
                        itemBuilder: (BuildContext context, int index) =>
                            Image.network(
                          _dish!.foodImageJson![index].url!,
                          fit: BoxFit.cover,
                        ),
                        autoplay: true,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 15,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Card(
                          elevation: 2,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Palette.dukalinkBlack1,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: NetworkImage(
                                  '${_dish!.foodImageJson?.first.url}'),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_dish?.foodName}',
                                  style: TextStyle(
                                    color: Palette.dukalinkBlack1,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Ksh ${_dish!.variants!.isNotEmpty ? _dish!.variants?.first.values?.first.price : _dish?.price}',
                                  style: TextStyle(
                                    fontSize: isWeb ? 19.sp : 17.sp,
                                    color: Palette.dukalinkPrimaryColor,
                                    // fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            (_dish!.description!.isNotEmpty)
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: ListTile(
                                          title: Text(
                                            'Description',
                                            style: TextStyle(
                                              color: Palette.dukalinkBlack,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          subtitle: Text(
                                            '''${_dish?.description}''',
                                            maxLines: 3,
                                            style: TextStyle(
                                              color: Palette.dukalinkBlack2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      const Divider(),
                                      SizedBox(height: 8.h),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            if (_dish?.variants != null &&
                                _dish!.variants!.isNotEmpty)
                              SizedBox(
                                  // height: size.height * 0.15,
                                  child:
                                      selectedVariantWidget(_dish?.variants)),
                            if (_dish?.foodAddons != null &&
                                _dish!.foodAddons!.isNotEmpty)
                              populateAddons(_dish, size)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Additional notes',
                              style: TextStyle(
                                color: Palette.dukalinkBlack,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                color: Colors.grey[200],
                                child: TextFormField(
                                  // Handles Form Validation
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length > 200) {
                                      return 'Please describe yourself but keep it under 200 characters.';
                                    }
                                    return null;
                                  },
                                  controller: descriptionController,
                                  textInputAction: TextInputAction.go,
                                  decoration: const InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 15, 10, 100),
                                      hintMaxLines: 3,
                                      hintText:
                                          'Write additional notes here..'),
                                  onTap: () {
                                    _scrollController.jumpTo(size.height);
                                  },
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 380.h),
                      // ?Todo removed reviews
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 8.0),
                      //   child: Container(
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 24, vertical: 20),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             'Reviews',
                      //             style: TextStyle(
                      //               color: Palette.dukalinkBlack,
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 16.sp,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //               width: size.width,
                      //               height: size.height * 0.2,
                      //               child: DishReviews(count: 1)),
                      //           SizedBox(height: 10.h),
                      //           Text(
                      //             'More Reviews',
                      //             style: TextStyle(
                      //               color: Palette.dukalinkPrimary1,
                      //               fontWeight: FontWeight.w400,
                      //               decoration: TextDecoration.underline,
                      //               fontSize: 12.sp,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addonWidget(List<FoodAddon>? foodAddons) {
    return SizedBox(
      child: ListView.builder(
        padding: const EdgeInsets.all(1),
        itemCount: foodAddons?.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AddonTile(
            addon: foodAddons?[index],
            isSelected: (bool value) {
              setState(() {
                if (value) {
                  // for (int i = 0; i < selectedAddonList.length; i++) {
                  //   totalPrice.value =
                  //       totalPrice.value + selectedAddonList[i].addon!.price!;
                  // }
                  addOnsTotalPrice = 0.0;
                  if (selectedAddonList.isNotEmpty) {
                    selectedAddonList.add(foodAddons![index]);
                    // totalPrice.value = (totalPrice.value +
                    //     foodAddons[index].addon!.price!.toDouble());

                    for (int i = 0; i < selectedAddonList.length; i++) {
                      addOnsTotalPrice =
                          addOnsTotalPrice + selectedAddonList[i].addon!.price!;
                    }
                  } else {
                    selectedAddonList.add(foodAddons![index]);
                    // totalPrice.value =
                    //     (foodPrice + foodAddons![index].addon!.price!.toDouble());
                    addOnsTotalPrice = (addOnsTotalPrice +
                        foodAddons[index].addon!.price!.toDouble());
                  }

                  debugPrint("TOTAL PRICE ${addOnsTotalPrice}");
                } else {
                  addOnsTotalPrice = 0.0;
                  selectedAddonList.remove(foodAddons![index]);
                  // totalPrice.value = (totalPrice.value -
                  //     foodAddons[index].addon!.price!.toDouble());
                  for (int i = 0; i < selectedAddonList.length; i++) {
                    addOnsTotalPrice =
                        addOnsTotalPrice + selectedAddonList[i].addon!.price!;
                  }
                  debugPrint("TOTAL PRICE ${addOnsTotalPrice}");
                }
              });
            },
            key: Key(
              foodAddons![index].addon!.foodName.toString(),
            ),
          );
        },
      ),
    );
  }

  Widget selectedVariantWidget(List<Variant>? foodVariant) {
    List<List<bool>> isSelectedList = List.generate(
      foodVariant!.length,
      (index) => List.filled(foodVariant[index].values!.length, false),
    );
    debugPrint("SELECTED ITEM LIST: ${isSelectedList}");
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
      itemCount: foodVariant.length,
      itemBuilder: (context, index) {
        return VariantTile(
          variants: foodVariant[index],
          key: Key(foodVariant[index].name.toString()),
          isSelected: List.generate(
            foodVariant[index].values!.length,
            (valueIndex) => (value) {
              setState(() {
                debugPrint("SELECTED ITEM LIST Final: ${value}");
                isSelectedList[index][valueIndex] = value;
                debugPrint("SLED ${isSelectedList[index][valueIndex]}");
                variantType = foodVariant[index].name!;
                variantTypeList.add(variantType);
                // variantPriceList.add(foodVariant[index].values!.first.price!);
              });

              debugPrint("SELECTED ITEM LIST Final: ${isSelectedList}");
            },
          ),
          onTotalAmountChanged: (double value) {
            debugPrint("SELECTED ITEM Amount value: ${value}");
            setState(() {
              // totalPrice.value = value;
              foodPrice = value;
              variantPrice = value;
              variantPriceList.add(variantPrice);
            });

            debugPrint("SELECTED ITEM Amount Final: ${totalPrice.value}");
          },
          onValueChanged: (String value) {
            variantValueName = value;
            variantNameList.add(variantValueName);
          },
        );
      },
    );
  }

  Widget populateAddons(FavoriteFood? dish, Size size) {
    final sides = dish!.foodAddons!
        .where((food) => food.addon!.dishCategory == 'side')
        .toList();
    final extras = dish.foodAddons!
        .where((food) => food.addon!.dishCategory == 'extra')
        .toList();

    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        const Divider(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListTile(
                title: Text(
                  'Choice of Sides',
                  style: TextStyle(
                    color: Palette.dukalinkBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                subtitle: Text(
                  'Choose one item.',
                  maxLines: 3,
                  style: TextStyle(
                    color: Palette.dukalinkBlack2,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            if (_dish?.foodAddons != null && _dish!.foodAddons!.isNotEmpty)
              SizedBox(
                child: addonWidget(sides),
              ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        const Divider(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListTile(
                title: Text(
                  'Choice of Extras',
                  style: TextStyle(
                    color: Palette.dukalinkBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                subtitle: Text(
                  'Choose up to three items.',
                  maxLines: 3,
                  style: TextStyle(
                    color: Palette.dukalinkBlack2,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            if (_dish?.foodAddons != null && _dish!.foodAddons!.isNotEmpty)
              SizedBox(
                child: addonWidget(extras),
              ),
          ],
        ),
      ],
    );
  }
}
