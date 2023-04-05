import 'package:dukalink_app/core/blocs/home_bottom_nav/home_tab_navigation_bloc.dart';
import 'package:dukalink_app/core/blocs/home_bottom_nav/home_tab_navigation_event.dart';
import 'package:dukalink_app/feature/home/tabs/favorite_tab.dart';
import 'package:dukalink_app/feature/home/tabs/home_tab.dart';
import 'package:dukalink_app/feature/home/tabs/order_history_tab.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<bool> snackbarPrompt = BehaviorSubject.seeded(false);

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool? orderOn = false;

  bool? orderOn = true;

  List getTabs() {
    return [HomeTab(), const FavoritesTab(), const OrderHistoryTab()];
  }

  @override
  void initState() {
    super.initState();
    (!snackbarPrompt.value)
        ? WidgetsBinding.instance.addPostFrameCallback((_) {
            launchSnackbar(
              context: context,
              message: 'Scan QR Code on your table to view menu',
              okCallback: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              type: SnackbarType.info,
              dismissText: 'OKAY',
            );
          })
        : () {};
    snackbarPrompt.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, int>(builder: (context, state) {
        return Scaffold(
            // bottomSheet: orderOn!
            //     // ? GrowableSheet()
            //     ? NewOrderProgressBottomSheet(
            //         restaurantCode: 'd7b1964d-c496-4938-b278-925bb66f571a',
            //       )
            //     : null,
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Palette.dukalinkPrimary2,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  BlocProvider.of<BottomNavBloc>(context)
                      .add(NavigateToAnotherTab(index));
                },
                currentIndex: state,
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.home,
                          color: state != 0
                              ? Colors.grey
                              : Palette.dukalinkPrimary2,
                          semanticsLabel: 'Home'.tr()),
                      label: 'Home'.tr()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.favorite,
                          color: state != 1
                              ? Colors.grey
                              : Palette.dukalinkPrimary2,
                          semanticsLabel: 'Favorites'),
                      label: 'Favorites'.tr()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.orderHistory,
                          color: state != 2
                              ? Colors.grey
                              : Palette.dukalinkPrimary2,
                          semanticsLabel: 'Order history'),
                      label: 'Order history'.tr()),
                ]),
            body: getTabs()[state]);
      }),
    );
  }
}
