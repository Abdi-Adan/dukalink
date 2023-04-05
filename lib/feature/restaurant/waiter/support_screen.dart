// ignore_for_file: prefer_is_empty

import 'package:dukalink_app/shared/configs/assets.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/size_config.dart';
import 'package:dukalink_app/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String?> requestSupport(BuildContext context) async {
  return showDialog<String?>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      bool value = false;
      TextEditingController requestController = TextEditingController();
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (!value)
                  Column(
                    children: [
                      Text(
                        'Your request has been sent.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Palette.dukalinkBlack1),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(sampleAvator),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Faith Njeri will be attending to you shortly.',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Palette.dukalinkBlack2),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Would you like to request for something specific?',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Palette.dukalinkBlack1),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextButton(
                              height: 40.h,
                              text: 'Yes',
                              displayLoading: false,
                              onTap: () {
                                setState(() {
                                  value = true;
                                });
                              },
                              fontSize: 16.sp,
                              color: Palette.accentColor,
                              borderColor: Palette.accentColor,
                              width: SizeConfig.screenWidth * 0.2,
                            ),
                            CustomTextButton(
                              height: 40.h,
                              text: 'Not Really',
                              textcolor: Palette.dukalinkBlack,
                              displayLoading: false,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              fontSize: 16.sp,
                              color: Palette.white,
                              width: SizeConfig.screenWidth * 0.35,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                if (value)
                  Column(children: [
                    TextField(
                      controller: requestController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(color: Palette.dukalinkBlack1),
                        labelStyle: TextStyle(color: Palette.dukalinkBlack1),
                        labelText: 'Would you like something in specific',
                        hintText: 'Would you like something in specific',
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextButton(
                      text: 'Done',
                      displayLoading: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      fontSize: 16.sp,
                      color: Palette.dukalinkBlack,
                      width: SizeConfig.screenWidth * 0.9,
                    ),
                  ]),
              ],
            ),
          ),
        );
      });
    },
  );
}
