import 'package:dukalink_app/core/di/injector.dart';
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

import '../../../core/blocs/sign_up/signup_cubit.dart';
import '../../../core/data/model/sign_up/signup_check_request.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = 'SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? username;
  String? password;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                        const SizedBox(height: 10),
                        Text(
                          "Signup",
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
                          title: "Enter first and last name",
                          hintText: 'i.e John Doe',
                          textEditingController: nameController,
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
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains(" ")) {
                              return 'Please enter your full names';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "Enter email",
                          hintText: 'i.e example@gmail.com',
                          textEditingController: emailController,
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
                              return 'Please enter email address';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "Enter phone number",
                          hintText: 'i.e 0799143482',
                          textEditingController: phoneController,
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
                              return 'Please enter phone number';
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
                        FormTitleAndField(
                          title: "Confirm Password",
                          textEditingController: confirmPasswordController,
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
                              return 'Please confirm your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocProvider(
                              create: (context) => inject<SignUpCubit>(),
                              child: BlocConsumer<SignUpCubit, SignupState>(
                                  listener: (ctx, state) async {
                                if (state is ErrorSignupState) {
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

                                if (state is SuccessSignupState) {
                                  Navigator.pop(context, true);
                                  // ToastUtils.showSuccessToast(state.message);
                                  // Navigator.pushReplacementNamed(
                                  //     context, HomeScreen.routeName);
                                }
                              }, builder: (context, state) {
                                return CustomTextButton(
                                  text: 'Sign up',
                                  displayLoading: state is LoadingSignupState,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      if (passwordController.text ==
                                          confirmPasswordController.text) {
                                        context.read<SignUpCubit>().signupUser(
                                              SignUpCheckRequest(
                                                email:
                                                    emailController.text.trim(),
                                                password: passwordController
                                                    .text
                                                    .trim(),
                                                firstName: nameController.text
                                                    .trim()
                                                    .split(' ')[0],
                                                lastName: nameController.text
                                                    .trim()
                                                    .split(' ')[1],
                                                mobile:
                                                    phoneController.text.trim(),
                                                // userType: 'Client'
                                              ),
                                            );
                                      } else {
                                        setState(() {
                                          passwordController.text = "";
                                          confirmPasswordController.text = "";
                                        });

                                        launchSnackbar(
                                          context: context,
                                          message:
                                              "Passowrd does not match, please try again!",
                                          okCallback: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                          },
                                          type: SnackbarType.error,
                                          dismissText: 'OK',
                                        );
                                      }
                                    }
                                  },
                                  color: Palette.dukalinkBlack,
                                  width: isWeb ? 450 : 280,
                                );
                              }),
                            ),
                          ],
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
}
