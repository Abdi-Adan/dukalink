import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/data/model/login/login_response.dart';
import '../../shared/utils/routes.dart';
import '../authentication/login.dart';
import '../commonWidget/login_auth_dialog.dart';
import '../profile/edit_profile.dart';

class SidebarMenuScreen extends StatefulWidget {
  static const routeName = 'SidebarMenuScreen/';
  const SidebarMenuScreen({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SidebarMenuScreen> {
  User? currentUser;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    // final SharedHelper sharedHelper;
    User? user = await inject<SharedHelper>().getUsersData();
    debugPrint("${user!.firstName}");
    // User? user = await sharedHelper.getUsersData();
    setState(() {
      currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Material(
          color: const Color(0xffffffff),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: (currentUser?.firstName != null)
                                  ? const Icon(Icons.person, size: 30)
                                  : const Icon(Icons.no_accounts, size: 30),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${currentUser?.firstName ?? 'Not logged in yet'} ${currentUser?.lastName ?? ''}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Palette.dukalinkBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  '${currentUser?.email ?? 'No email'} ',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Palette.dukalinkBlack3,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ]),
                    ),
                    (currentUser?.email != null)
                        ? SettingsTile(
                            title: 'Edit profile',
                            leading: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 206, 150, 8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(Assets.editIcon),
                                )),
                            onPressed: (BuildContext context) {
                              Navigator.pushNamed(
                                context,
                                EditProfilePage.routeName,
                              );
                            })
                        : const SizedBox.shrink(),
                    const Divider(),
                    // (currentUser?.email == null)
                    //     ? SettingsTile(
                    //         title: 'Sign up',
                    //         enabled: currentUser?.email == null,
                    //         leading: Container(
                    //             decoration: const BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               color: Color.fromARGB(255, 206, 150, 8),
                    //             ),
                    //             child: const Padding(
                    //               padding: EdgeInsets.all(8.0),
                    //               child:
                    //                   Icon(Icons.person, color: Colors.white),
                    //             )),
                    //         onPressed: (BuildContext context) {
                    //           Navigator.pushNamed(
                    //             context,
                    //             EditProfilePage.routeName,
                    //           );
                    //         })
                    //     : const SizedBox.shrink(),
                    SettingsTile(
                      title: currentUser == null ? 'Login' : 'Logout',
                      leading: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 206, 150, 8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.login, color: Colors.white),
                          )),
                      onPressed: (BuildContext context) async {
                        if (currentUser == null) {
                          await loginDialog(context);
                          Navigator.pop(context);
                        } else {
                          GlobalNavigationService()
                              .logOutUser(LoginScreen.routeName);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
