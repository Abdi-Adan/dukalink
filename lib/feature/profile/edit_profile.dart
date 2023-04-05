// ignore_for_file: use_build_context_synchronously

import 'package:dukalink_app/core/data/repository/signup_repository.dart';
import 'package:dukalink_app/feature/home/home_screen.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/data/local/shared_preference_helper.dart';
import '../../core/data/model/login/login_response.dart';
import '../../core/di/injector.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = 'editProfile/';
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  // late TextEditingController nameController;
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberController = TextEditingController();
  User? currentUser;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  getUser() async {
    User? user = await inject<SharedHelper>().getUsersData();
    debugPrint("${user!.firstName}");
    setState(() {
      currentUser = user;
      emailController.text = currentUser?.email ?? '';
      firstNameController.text = currentUser?.firstName ?? '';
      lastNameController.text = currentUser?.lastName ?? '';
      numberController.text = currentUser?.mobileNumber ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 206, 150, 8),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.w, top: 25.h, right: 16.w),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            child: ListView(
              children: [
                Text(
                  "Edit Profile",
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 80.w,
                          backgroundColor:
                              const Color.fromARGB(255, 206, 150, 8),
                          child: const Icon(Icons.person,
                              size: 80, color: Colors.white),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: const Color.fromARGB(255, 206, 150, 8),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                buildTextField("E-mail", "${currentUser?.email ?? 'No email'}",
                    false, emailController, true),
                buildTextField("First name", "${currentUser?.firstName}", false,
                    firstNameController, false),
                buildTextField("Last name", "${currentUser?.lastName}", false,
                    lastNameController, false),
                buildTextField(
                    "My Phone Number",
                    "${currentUser?.mobileNumber ?? 'No number'}",
                    false,
                    numberController,
                    false),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        var params = {
                          "first_name": firstNameController.text,
                          "last_name": lastNameController.text,
                          "phone": numberController.text,
                          "profile_url": "www.url.com"
                        };

                        var newUserProfile =
                            await editUserProfile(params, currentUser!.id);

                        if (newUserProfile != null) {
                          launchSnackbar(
                            context: context,
                            message: newUserProfile,
                            okCallback: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                            type: SnackbarType.error,
                            dismissText: 'OK',
                          );

                          launchSnackbar(
                            context: context,
                            message: "Profile edited successfully",
                            okCallback: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                            type: SnackbarType.success,
                            dismissText: 'OK',
                          );

                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                        } else {
                          launchSnackbar(
                            context: context,
                            message: "Something went wrong, try again",
                            okCallback: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                            type: SnackbarType.error,
                            dismissText: 'OK',
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // TODO add controller here on arguments

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController? c, bool readOnly) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        readOnly: readOnly,
        controller: c,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: c!.text,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  Future<String?> editUserProfile(
      Map<String, dynamic> params, String? userId) async {
    var data = await SignUpRepositoryImpl(
            apiProvider: inject(), sharedHelper: inject())
        .editUser(params, userId ?? '');

    return data;
  }
}

class EditProfileModel {
  final String firstname;
  final String lastname;
  final String phone;

  EditProfileModel(this.firstname, this.lastname, this.phone);
}
