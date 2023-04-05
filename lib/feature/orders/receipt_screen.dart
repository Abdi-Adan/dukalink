// ignore_for_file: use_build_context_synchronously

import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/bordered_btn.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../restaurant/retstaurant_detail.dart';

class ReceiptScreen extends StatefulWidget {
  static const routeName = 'ReceiptScreen';

  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  _ReceiptScreenState createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  String? amount;
  String? phone;
  String? restaurantCode;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      amount = args['amount'] as String;
      phone = args['phone'] as String;
      restaurantCode = args['restaurantCode'] as String;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Palette.dukalinkPrimary4,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RestaurantDetailScreen.routeName,
                            arguments: {'restaurant_code': restaurantCode});
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette
                                    .dukalinkBlack1, //                   <--- border color
                              ),
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: EdgeInsets.all(4.0.sm),
                            child: Icon(
                              Icons.close_outlined,
                              size: 10.sm,
                            ),
                          )),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: size.width * 0.7,
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              Assets.logo,
                              height: 132.h,
                            ),
                          ),
                        ),
                        Text('Payment receipt',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Palette.dukalinkBlack1)),
                      ])
                ],
              ),
              SizedBox(height: 32.h),
              bottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSection() {
    Size size = MediaQuery.of(context).size;

    return BounceInUp(
      child: Container(
        width: size.width,
        height: size.height * 0.7,
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SvgPicture.asset(Assets.greenTick),
                  ),
                ),
                Center(
                  child: Text('Payment successful!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Palette.dukalinkBlack1)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text('Ksh $amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Palette.dukalinkBlack1)),
                ),
                const Divider(),
              ],
            ),
            const SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Transaction details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Palette.dukalinkBlack1)),
            ),
            const ListTileWidget(
              title: 'Date:',
              trailing: '13 July 2022',
            ),
            const ListTileWidget(
              title: 'Time:',
              trailing: '13:30',
            ),
            const ListTileWidget(
              title: 'Transaction ID:',
              trailing: 'KHG54FGSJ2',
            ),
            ListTile(
              leading: SvgPicture.asset(Assets.mpesa),
              trailing: Text(
                '$phone',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Palette.dukalinkBlack1),
              ),
            ),
            SizedBox(height: 20.h),
            BorderedButton(
                btnText: 'Get Pdf receipt',
                fillColor: Palette.dukalinkPrimary3,
                textColor: const Color(0xFFB78610),
                borderColor: const Color(0xFFB78610),
                // displayLoading: false,
                onTap: () async {
                  launchSnackbar(
                    context: context,
                    message: "Receipt generation comming soon",
                    okCallback: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    type: SnackbarType.info,
                    dismissText: 'OK',
                  );
                  Navigator.pushNamed(context, RestaurantDetailScreen.routeName,
                      arguments: {'restaurant_code': restaurantCode});
                })
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final String trailing;
  const ListTileWidget({
    Key? key,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Palette.dukalinkBlack1)),
      trailing: Text(trailing,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Palette.dukalinkBlack1)),
    );
  }
}
