import 'dart:async';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/feature/restaurant/waiter/support_screen.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/core/data/model/newFavoriteFoodModel.dart';
import 'package:dukalink_app/core/data/repository/restaurant_repository.dart';
import 'package:dukalink_app/feature/dishes/dish_screen.dart';
import 'package:dukalink_app/feature/dishes/widgets/dish_item.dart';
import 'package:dukalink_app/feature/home/home_screen.dart';
import 'package:dukalink_app/feature/orders/order_list.dart';
import 'package:dukalink_app/shared/singletons/recent_searches_store.dart';
import 'package:dukalink_app/shared/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

final restaurantCodeSubject = BehaviorSubject<String>();

class RestaurantDetailScreen extends StatefulWidget {
  static const routeName = 'RestaurantDetailScreen';
  final String? restaurantCode;
  final String? tableNumber;

  const RestaurantDetailScreen(
      {super.key, this.restaurantCode, this.tableNumber});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  String? restaurantCode;
  final searchController = TextEditingController();
  final _searchSubject = BehaviorSubject<String>();
  final _searchTapSubject = BehaviorSubject<bool>.seeded(false);
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    _searchSubject.close();
    searchFocusNode.dispose();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      restaurantCode = args['restaurant_code'] as String;
    }

    super.didChangeDependencies();
  }

  Future<Map<String, dynamic>> fetchRawData() async {
    var data = await RestaurantRepositoryImpl(
            apiProvider: inject(), sharedHelper: inject())
        .fetchRawRestaurantDetails(
            restaurantCode ?? widget.restaurantCode ?? '');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool wasScanned = isQRScanned.value;
    restaurantCodeSubject.add(restaurantCode ?? widget.restaurantCode ?? '');

    return Scaffold(
      backgroundColor: Colors.grey[50],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: wasScanned
          ? FloatingActionButton.extended(
              shape: const CircleBorder(),
              label: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: SvgPicture.asset(
                  Assets.notificationBell,
                  fit: BoxFit.cover,
                  height: 85,
                  width: 85,
                ),
              ),
              onPressed: () async {
                await requestSupport(context);
              },
            )
          : const SizedBox.shrink(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchRawData(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            String snapshotResname =
                snapshot.data!['restaurant']['branch_name'];
            String restaurantName = snapshotResname[0].toUpperCase() +
                snapshotResname.substring(1).toLowerCase();

            return RefreshIndicator(
              color: Palette.dukalinkOrangeColor,
              onRefresh: () => Navigator.pushNamed(
                  context, RestaurantDetailScreen.routeName,
                  arguments: {'restaurant_code': restaurantCode}),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${snapshot.data!['restaurant']['restaurant_image']}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                if (!kIsWeb)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () =>
                                          Navigator.pushReplacementNamed(
                                              context, HomeScreen.routeName),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Palette.white),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.home,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, OrderListScreen.routeName,
                                          arguments: {
                                            'restaurant_code':
                                                '${widget.restaurantCode ?? restaurantCode}',
                                          });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Palette.white),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.shopping_cart_checkout,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.13,
                        left: 20,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Palette.dukalinkPrimary1,
                          backgroundImage: NetworkImage(
                              snapshot.data!['restaurant']['restaurant_image']),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.17,
                        child: SizedBox(
                          width: size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 18.h),
                              Column(
                                children: [
                                  Text(
                                    restaurantName,
                                    style: TextStyle(
                                      color: Palette.dukalinkBlack1,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    width: size.width * 0.40,
                                    height: kIsWeb ? 25 : 22.h,
                                    decoration: BoxDecoration(
                                      color: Palette.dukalinkPrimary3,
                                      border: Border.all(
                                        color: Palette
                                            .dukalinkPrimary3, // red as border color
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(15.0.sm),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14.0, right: 14),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.watch_later_rounded,
                                            size: 18,
                                            color: Palette.dukalinkBlack1,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '08:00 AM - 8:00 PM',
                                            style: TextStyle(
                                              color: Palette.dukalinkBlack1,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  wasScanned
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Table Number: ',
                                              style: TextStyle(
                                                color: Palette.dukalinkBlack1,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            Text(
                                              widget.tableNumber ?? '',
                                              style: TextStyle(
                                                color: Palette.dukalinkBlack1,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyDishSearchDelegate()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
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
                                              'Search for dishes',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
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
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        color: Colors.grey[50],
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10.h),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: (snapshot.data!['food'].length != 0)
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Top dishes',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              SizedBox(
                                                height: 230,
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: snapshot
                                                      .data!['food'].length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    var dish2 =
                                                        FavoriteFood.fromJson(
                                                            snapshot.data![
                                                                'food'][index]);

                                                    return InkWell(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            DishScreen
                                                                .routeName,
                                                            arguments: {
                                                              'dish': dish2
                                                            });
                                                      },
                                                      child: DishItem(
                                                        dish: dish2,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        : const Center(
                                            child: Text(
                                              'There are no food items or food sections on record for this particular restaurant branch!',
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FoodCategoryAndGrid(
                                    restaurantCode: restaurantCode,
                                    restaurantCode1: widget.restaurantCode,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Palette.dukalinkPrimary1,
            ));
          }
        },
      ),
    );
  }

  StreamTransformer<String, List<dynamic>> get searchForDishes {
    return StreamTransformer<String, List<dynamic>>.fromHandlers(
      handleData: (searchTerm, sink) async {
        var searchResults = await RestaurantRepositoryImpl(
                apiProvider: inject(), sharedHelper: inject())
            .searchForDishes(searchTerm, restaurantCode ?? '');

        sink.add(searchResults);
      },
    );
  }
}

class FoodCategoryAndGrid extends StatefulWidget {
  final String? restaurantCode;
  final String? restaurantCode1;

  const FoodCategoryAndGrid({
    super.key,
    required this.restaurantCode,
    required this.restaurantCode1,
  });

  @override
  State<FoodCategoryAndGrid> createState() => _FoodCategoryAndGridState();
}

class _FoodCategoryAndGridState extends State<FoodCategoryAndGrid> {
  final _sectionSubject = BehaviorSubject<SectionModel>();

  Future<Map<String, dynamic>> fetchAllCategories() async {
    var data = await RestaurantRepositoryImpl(
            apiProvider: inject(), sharedHelper: inject())
        .fetchAllFoodCategories(
            widget.restaurantCode1 ?? widget.restaurantCode ?? '');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: fetchAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!['data'].length,
                    itemBuilder: (BuildContext context, index) {
                      ImageProvider sectionImg = sectionImage(
                          snapshot.data!['data'][index]['section_image']);
                      String sectionName =
                          snapshot.data!['data'][index]['section_name'];
                      String categoryName = sectionName[0].toUpperCase() +
                          sectionName.substring(1).toLowerCase();

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _sectionSubject.value = SectionModel(
                                sectionId: snapshot.data!['data'][index]['id'],
                                sectionName: snapshot.data!['data'][index]
                                    ['section_name'],
                              );
                            });
                          },
                          child: Column(
                            children: [
                              Card(
                                elevation: 2,
                                shape: const CircleBorder(),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Palette.dukalinkPrimary1,
                                  backgroundImage: sectionImg,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Container(
                                width: 70,
                                alignment: Alignment.center,
                                child: Text(
                                  categoryName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                FoodSectionGrid(
                  categorySubject: _sectionSubject,
                  restaurantId: widget.restaurantCode,
                  restaurantId1: widget.restaurantCode1,
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Palette.dukalinkPrimary1,
            ));
          }
        });
  }
}

class FoodSectionGrid extends StatelessWidget {
  BehaviorSubject<SectionModel> categorySubject;
  String? restaurantId;
  String? restaurantId1;

  FoodSectionGrid({
    super.key,
    required this.categorySubject,
    required this.restaurantId,
    this.restaurantId1,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: categorySubject.stream,
        builder: (context, sectionSnapshot) {
          if (!sectionSnapshot.hasData ||
              sectionSnapshot.data.toString().isEmpty ||
              !categorySubject.hasValue) {
            return AllFoodGrid(
              restCode: restaurantId,
              restCode1: restaurantId1,
            );
          } else if (sectionSnapshot.hasData) {
            return SectionedFoodGrid(
              categoryId: categorySubject.value.sectionId,
              categoryName: categorySubject.value.sectionName,
              restaurantCode: restaurantId ?? '',
            );
          } else {
            return const Center(
              child: Text(
                'The food section you selected has no food items on record. Try another food section',
                textAlign: TextAlign.center,
              ),
            );
          }
        });
  }
}

class SectionedFoodGrid extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final String restaurantCode;

  const SectionedFoodGrid({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.restaurantCode,
  });

  Future<Map<String, dynamic>> fetchFoodPerCategory(
      String currentCategory) async {
    var foods = await RestaurantRepositoryImpl(
            apiProvider: inject(), sharedHelper: inject())
        .fetchRawFoodPerCategory(currentCategory);
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: fetchFoodPerCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!['food'].length != 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    toCapitalCase(categoryName),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!['food'].length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var dish2 =
                          FavoriteFood.fromJson(snapshot.data!['food'][index]);
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DishScreen.routeName,
                              arguments: {'dish': dish2});
                        },
                        child: DishItem(
                          dish: dish2,
                        ),
                      );
                    }),
              ],
            );
          } else if (snapshot.hasData && snapshot.data!['food'].length == 0) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Text(
                  'The food section you selected has no food items on record. Try another food section',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Palette.dukalinkPrimary1,
            ));
          }
        });
  }
}

class AllFoodGrid extends StatelessWidget {
  final String? restCode;
  final String? restCode1;

  const AllFoodGrid({super.key, required this.restCode, this.restCode1});

  Future<Map<String, dynamic>> fetchRawData() async {
    var data = await RestaurantRepositoryImpl(
            apiProvider: inject(), sharedHelper: inject())
        .fetchRawRestaurantDetails(restCode1 ?? restCode!);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Map<String, dynamic>>(
          future: fetchRawData(),
          builder: (context, gridSnapshot) {
            if (gridSnapshot.hasData) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: gridSnapshot.data!['food'].length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var dish2 = FavoriteFood.fromJson(
                        gridSnapshot.data!['food'][index]);
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DishScreen.routeName,
                            arguments: {'dish': dish2});
                      },
                      child: DishItem(
                        dish: dish2,
                      ),
                    );
                  });
            } else if (gridSnapshot.hasError) {
              return Text('Error: ${gridSnapshot.error}');
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Palette.dukalinkPrimary1,
              ));
            }
          }),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('restCode1', restCode1));
  }
}

ImageProvider sectionImage(String networkImageUrl) {
  if (networkImageUrl != '' || networkImageUrl.isNotEmpty) {
    return NetworkImage(networkImageUrl);
  } else {
    return const AssetImage('assets/images/defaultSectionImage.jpg');
  }
}

class SectionModel {
  String sectionId;
  String sectionName;

  SectionModel({required this.sectionId, required this.sectionName});
}

String toCapitalCase(String str) {
  List<String> words = str.split(' ');
  return words.map((word) => word.capitalize()).join(' ');
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

class MyDishSearchDelegate extends StatefulWidget {
  const MyDishSearchDelegate({super.key});

  @override
  State<MyDishSearchDelegate> createState() => _MyDishSearchDelegateState();
}

class _MyDishSearchDelegateState extends State<MyDishSearchDelegate> {
  final _searchSubject = BehaviorSubject<String>();
  final _searchBarEnabled = BehaviorSubject<bool>.seeded(true);
  RecentDishesSearchesStore recent = RecentDishesSearchesStore();
  TextEditingController searchCriteriaController = TextEditingController();
  late Future<List<dynamic>> searchResultData;

  @override
  void initState() {
    super.initState();
    searchResultData = searchForDishItems(searchCriteriaController.text);
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
      searchResultData = searchForDishItems(recentSearch);
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
                  var dishListResult = snapshot.data!;
                  return GridView.builder(
                      shrinkWrap: true,
                      itemCount: dishListResult.last.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> dishList = dishListResult.last;
                        FavoriteFood data =
                            FavoriteFood.fromJson(dishList['dish'][index]);

                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, DishScreen.routeName,
                                arguments: {'dish': data});
                          },
                          child: DishItem(
                            dish: data,
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

  Future<List<dynamic>> searchForDishItems(String searchCriteria) async {
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
