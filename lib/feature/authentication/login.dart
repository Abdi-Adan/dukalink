import 'package:dukalink_app/core/blocs/login/login_cubit.dart';
import 'package:dukalink_app/core/data/model/login/email_pss_login_req.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/core/services/on_will_pop.dart';
import 'package:dukalink_app/feature/authentication/reset_password.dart';
import 'package:dukalink_app/feature/authentication/widgets/form_field_widget.dart';
import 'package:dukalink_app/feature/home/home_screen.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? username;
  String? password;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isWeb = Responsive.isDesktop(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => handleWillPop(context),
        child: Form(
          key: _formKey,
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
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                          Container(
                            width: size.width * 0.5,
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Assets.logo,
                              height: 50.h,
                            ),
                            // Image.asset(
                            //   Assets.logo,
                            //   height: 132.h,
                            // ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Welcome back",
                            style: TextStyle(
                                color: Palette.dukalinkBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 100.h,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: 3,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (index, context) {
                                          return usersWidget();
                                        }),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  FadeIn(
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Container(
                                          width: isWeb ? 90 : 70,
                                          height: 85.h,
                                          padding: EdgeInsets.all(8.sm),
                                          decoration: BoxDecoration(
                                            color: Palette.dukalinkPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Palette.dukalinkBlack1,
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 20.sm,
                                                  color: Palette
                                                      .dukalinkWhiteColor,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Add New",
                                                style: TextStyle(
                                                    color:
                                                        Palette.dukalinkBlack2,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          FormTitleAndField(
                            title: "Enter email, username or number",
                            hintText: 'i.e talha',
                            textEditingController: usernameController,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          FormTitleAndField(
                            title: "Password",
                            textEditingController: passwordController,
                            textInputAction: TextInputAction.done,
                            obscure: show,
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (show) {
                                      show = false;
                                    } else {
                                      show = true;
                                    }
                                  });
                                },
                                child: Icon(!show
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined)),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, ResetPasswordScreen.routeName),
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Palette.dukalinkPrimaryColor),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocProvider(
                                create: (context) => inject<LoginCubit>(),
                                child: BlocConsumer<LoginCubit, LoginState>(
                                    listener: (ctx, state) async {
                                  if (state is ErrorLoginState) {
                                    launchSnackbar(
                                      context: context,
                                      message: state.message,
                                      okCallback: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                      type: SnackbarType.error,
                                      dismissText: 'EXIT',
                                    );
                                  }

                                  if (state is SuccessLoginState) {
                                    launchSnackbar(
                                      context: context,
                                      message: state.message,
                                      okCallback: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                      type: SnackbarType.info,
                                      dismissText: 'OKAY',
                                    );
                                    Navigator.pushReplacementNamed(
                                        context, HomeScreen.routeName);
                                  }
                                }, builder: (context, state) {
                                  return CustomTextButton(
                                    text: 'Sign in',
                                    displayLoading: state is LoadingLoginState,
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        context.read<LoginCubit>().loginUser(
                                            EmailPssLoginReq(
                                                email: usernameController.text
                                                    .trim(),
                                                password: passwordController
                                                    .text
                                                    .trim()));
                                      }
                                    },
                                    color: Palette.dukalinkBlack,
                                    width: isWeb ? 450 : 280,
                                  );
                                }),
                              ),
                              InkWell(
                                onTap: () => biometricScan(context),
                                child: SvgPicture.asset(
                                  'assets/icons/fingerPrint.svg',
                                  height: 50.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 90.h,
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/face_id.svg',
                                height: 50.h,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const Text(
                                "Login using Face ID",
                                style: TextStyle(color: Palette.dukalinkBlack3),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void biometricScan(BuildContext context) {
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
                      Assets.finger_scan,
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
                    "Authenticate with biometric",
                    style: TextStyle(
                        color: Palette.dukalinkBlack1,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  Text(
                    "Use your biometric to login to dukalink application",
                    style: TextStyle(
                        color: Palette.dukalinkBlack3,
                        fontWeight: FontWeight.w500,
                        fontSize: 9),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 20.h),
            Center(
              child: Container(
                height: 60.h,
                width: 70.w,
                decoration: BoxDecoration(
                    color: Palette.dukalinkBlack5,
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    Assets.finger_scan_icon,
                    height: 30.h,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                "Scan your Finger print",
                style: TextStyle(
                    color: Palette.dukalinkBlack1,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp),
              ),
            ),
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
