import 'package:dukalink_app/core/blocs/login/login_cubit.dart';
import 'package:dukalink_app/core/data/model/login/email_pss_login_req.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/feature/authentication/reset_password.dart';
import 'package:dukalink_app/feature/authentication/widgets/form_field_widget.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../authentication/widgets/register_screen.dart';

class LoginDialogScreen extends StatefulWidget {
  static const routeName = 'LoginDialogScreen';
  const LoginDialogScreen({Key? key}) : super(key: key);

  @override
  _LoginDialogScreenState createState() => _LoginDialogScreenState();
}

class _LoginDialogScreenState extends State<LoginDialogScreen> {
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
      body: Form(
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
            // alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: InkWell(
                      onTap: () => Navigator.pop(context, false),
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.close,
                            size: 35,
                          )),
                    ),
                  ),
                  Container(
                    width: 700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.green.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                          // padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            Assets.logo,
                            height: 50.h,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Kindly login or signup to proceed",
                          style: TextStyle(
                              color: Palette.dukalinkBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        FormTitleAndField(
                          title: "Enter email, and password",
                          hintText: 'example@email.com',
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
                              onTap: () async {
                                var val = await Navigator.pushNamed(
                                    context, SignUpScreen.routeName);
                                if (val != null) {
                                  Navigator.pop(context, val);
                                }
                              },
                              child: const Text(
                                "SIGNUP",
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
                                    dismissText: 'OK',
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
                                    type: SnackbarType.success,
                                    dismissText: 'OK',
                                  );
                                  Navigator.pop(context, true);
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
                                              password: passwordController.text
                                                  .trim()));
                                    }
                                  },
                                  color: Palette.dukalinkBlack,
                                  width: isWeb ? 320 : 150,
                                );
                              }),
                            ),
                            // InkWell(
                            //   onTap: () => biometricScan(context),
                            //   child: SvgPicture.asset(
                            //     'assets/icons/fingerPrint.svg',
                            //     height: 50.h,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 90.h,
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
                        // InkWell(
                        //   child: Column(
                        //     children: [
                        //       SvgPicture.asset(
                        //         'assets/icons/face_id.svg',
                        //         height: 50.h,
                        //       ),
                        //       SizedBox(
                        //         height: 20.h,
                        //       ),
                        //       const Text(
                        //         "You dont have an account Signup",
                        //         style: TextStyle(color: Palette.dukalinkBlack3),
                        //       ),
                        //     ],
                        //   ),
                        // )
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
}
