import 'package:dukalink/domain/models/shops/product.dart';
import 'package:dukalink/domain/models/shops/shop.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_snackbars.dart';
import 'package:dukalink/presentation/widgets/molecular/extended_scan_fab.dart';
import 'package:dukalink/presentation/widgets/molecular/product_item.dart';
import 'package:dukalink/presentation/widgets/molecular/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<bool> snackbarPrompt = BehaviorSubject.seeded(false);

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    (!snackbarPrompt.value)
        ? WidgetsBinding.instance.addPostFrameCallback((_) {
            launchSnackbar(
              context: context,
              message: 'Scan QR Code',
              type: SnackbarType.info,
              dismissText: 'OKAY',
            );
          })
        : () {};
    snackbarPrompt.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () {},
              child: const Icon(Icons.menu, color: Colors.black),
            ),
            title: Text(
              widget.title,
              style: const TextStyle(color: Colors.black),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.receipt, color: Colors.black),
                ),
              ),
            ],
            pinned: true,
            collapsedHeight: 80,
            expandedHeight: 120,
            scrolledUnderElevation: 5,
            elevation: 5,
            centerTitle: false,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Top shops', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        Shop shop = Shop(
                            id: '', name: 'Shop $index', type: 'Restaurant');

                        return InkWell(
                          onTap: () {},
                          child: ShopItem(
                            shop: shop,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Top items', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 360,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Product product = Product(
                            basePrice: 100,
                            id: '',
                            name: 'Item $index',
                            shopName: 'Java');
                        return InkWell(
                          onTap: () {},
                          child: ProductItem(
                            product: product,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Other shops', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Flexible(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          Shop shop = Shop(
                              id: '', name: 'Shop $index', type: 'Restaurant');

                          return InkWell(
                            onTap: () {},
                            child: ShopItem(
                              shop: shop,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          const ExtendedFAB(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
