import 'package:dukalink_app/feature/authentication/widgets/form_field_widget.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/size_config.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = 'ResetPasswordScreen';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String? username;
  String? password;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left,
              size: 30,
              color: Palette.dukalinkBlack,
            )),
        title: Container(
          width: SizeConfig.screenWidth * 0.5,
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Assets.logo,
            height: 40.h,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            color: Colors.white,
            width: size.width,
            height: size.height,
            // alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          color: Palette.dukalinkBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Your New password must be different than your previous used password ",
                      style: TextStyle(
                          color: Palette.dukalinkBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                    ),
                  ),
                  Container(
                    width: 600,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.green.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        FormTitleAndField(
                          title: "New Password",
                          textEditingController: passwordController,
                          textInputAction: TextInputAction.next,
                          obscure: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "Confirm Password",
                          textInputAction: TextInputAction.done,
                          textEditingController: passwordController,
                          obscure: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextButton(
                          text: 'Save password',
                          displayLoading: false,
                          onTap: () {
                            notiMessage(context);
                          },
                          color: Palette.dukalinkBlack,
                          width: SizeConfig.screenWidth * 0.9,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void notiMessage(BuildContext context) {
    final biometricDialog = AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  Assets.closeCircle,
                  height: 20.h,
                ),
              ),
            ),
            Row(children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                    color: Palette.dukalinkBlack5, shape: BoxShape.circle),
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: const BoxDecoration(
                      color: Palette.dukalinkBlack1, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Assets.tickCircle,
                      height: 20.h,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Your password has been updated",
                    style: TextStyle(
                        color: Palette.dukalinkBlack1,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  SizedBox(
                    child: Text(
                      "Make sure you keep your password to yourself.\n Keep it secure.",
                      maxLines: 2,
                      style: TextStyle(
                          color: Palette.dukalinkBlack3,
                          fontWeight: FontWeight.w500,
                          fontSize: 9),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => biometricDialog,
    );
  }

  Widget usersWidget() {
    return Card(
      child: Container(
        width: 90,
        height: 95,
        decoration: BoxDecoration(
          color: Palette.white,
          // border: Border.all(
          //   color: kYellowLightColor, // red as border color
          // ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(sampleAvator),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10.0),
            //   child: SizedBox(
            //     width: 100,
            //     height: 0,
            //     child: AspectRatio(
            //         aspectRatio: 1.8,
            //         child: CachedNetworkImage(
            //           imageUrl: sampleAvator,
            //           fit: BoxFit.cover,
            //         )),
            //   ),
            // ),
            SizedBox(height: 5.h),
            SizedBox(
              child: Text(
                "Kelline Kelly",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Palette.dukalinkBlack2,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
