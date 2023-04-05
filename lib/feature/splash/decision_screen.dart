import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/configs/assets.dart';

Future<String?> scanTableQrRequest(
  BuildContext context,
) async {
  var size = MediaQuery.of(context).size;
  return showDialog<String?>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
            content: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.7,
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                Assets.logo,
                height: 102.h,
              ),
              // Image.asset(
              //   Assets.logo,
              //   height: 132.h,
              // ),
            ),
            Text(
              'Welcome to dukalink app',
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Palette.dukalinkBlack2),
            ),
          ],
        )));
        //   SingleChildScrollView(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        // Text(
        //       'Welcome to dukalink app. ',
        //       overflow: TextOverflow.ellipsis,
        //       maxLines: 7,
        //       style: TextStyle(
        //           fontSize: 15.sp,
        //           fontWeight: FontWeight.w700,
        //           color: Palette.dukalinkBlack2),
        //     ),
        //         const SizedBox(height: 5),
        //         Column(children: [
        //           const SizedBox(height: 5),
        //           Text(
        //             'We realized we missed your table number!',
        //             overflow: TextOverflow.ellipsis,
        //             maxLines: 7,
        //             style: TextStyle(
        //                 fontSize: 15.sp,
        //                 fontWeight: FontWeight.w700,
        //                 color: Palette.dukalinkBlack2),
        //           ),
        //           const SizedBox(height: 10),
        // Text(
        //   'Kindly scan the QR on the table to proceed',
        //   overflow: TextOverflow.ellipsis,
        //   textAlign: TextAlign.center,
        //   maxLines: 7,
        //   style: TextStyle(
        //       fontSize: 18.sp,
        //       fontWeight: FontWeight.w700,
        //       color: Palette.dukalinkBlack1),
        // ),
        //         ])
        //       ],
        //     ),
        //   ),
        // );
      });
}
