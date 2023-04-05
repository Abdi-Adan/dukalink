// ignore_for_file: unnecessary_null_comparison, prefer_is_empty

import 'package:dukalink_app/core/blocs/notification/notification_cubit.dart';
import 'package:dukalink_app/core/blocs/notification/notification_state.dart';
import 'package:dukalink_app/feature/commonWidget/login_auth_dialog.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/di/injector.dart';
import '../../shared/configs/assets.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = 'NotificationScreen/';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // List notificationData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
            style: GoogleFonts.lato()
                .copyWith(
                    fontSize: 20.sp,
                    color: Theme.of(context).textTheme.bodyText1!.color)
                .copyWith(fontWeight: FontWeight.w700)),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).textTheme.bodyText1!.color,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 12),
            child: Text(
              'Mark all as read',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 11.sp,
                  color: Palette.dukalinkBlack3),
            ),
          ),
        ],
      ),
      // body: Container()
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            // width: SizeConfig.screenWidth,
            child: BlocProvider(
              create: (context) =>
                  inject<NotificationCubit>()..getNotifications(),
              child: BlocConsumer<NotificationCubit, NotificationState>(
                  listener: (ctx, state) async {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) async {
                    launchSnackbar(
                      context: context,
                      message: message,
                      okCallback: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      type: SnackbarType.error,
                      dismissText: 'OK',
                    );
                    if (message.toLowerCase().contains('login')) {
                      bool value = await loginDialog(context);
                      if (value) {
                        if (!mounted) return null;
                        ctx.read<NotificationCubit>().getNotifications();
                      }
                    }
                  },
                  success: (orderItem) {
                    launchSnackbar(
                      context: context,
                      message: 'Notification fetched successful!',
                      okCallback: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      type: SnackbarType.success,
                      dismissText: 'OK',
                    );
                  },
                );
              }, builder: (ctx, state) {
                return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    error: (message) {
                      return SizedBox(
                        height: 100,
                        width: 100,
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
                    success: (notificationData) {
                      return ListView.builder(
                          itemCount: notificationData?.length,
                          padding: const EdgeInsets.all(10.0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final notification =
                                notificationData?.toList()[index];
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                child: Card(
                                  child: ListTile(
                                    tileColor: notification?.isRead != null &&
                                            notification!.isRead!
                                        ? null
                                        : Palette.dukalinkPrimary4,
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromARGB(255, 206, 150, 8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              Assets.logoutIcon),
                                        )),
                                    title: Text(
                                      '${notification?.title}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text('${notification?.body}',
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis),
                                    trailing: Text(
                                      // DateFormat.yMd().format(DateTime.parse(
                                      '${notification?.createdAt}',
                                      // )),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    });
              }),
            ),
          ),
        ),
      ),
    );
  }
}
