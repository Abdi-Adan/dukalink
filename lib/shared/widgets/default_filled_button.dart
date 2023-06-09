import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/size_config.dart';
import 'package:dukalink_app/shared/configs/styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      this.press,
      this.height,
      this.hasBackground = true,
      this.fontSize,
      this.displayLoading = false,
      this.loaderSize = 40.0,
      this.frontIcon,
      this.disable = false,
      this.backGroundColor = Palette.dukalinkBlack,
      this.textColor = Colors.white,
      this.frontIconColor = Colors.white})
      : super(key: key);
  final String text;
  final Function()? press;
  final double? height;
  final bool hasBackground;
  final double? fontSize;
  final double loaderSize;
  final bool displayLoading;
  final bool disable;
  final String? frontIcon;
  final Color? backGroundColor;
  final Color? textColor;
  final Color? frontIconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? getProportionateScreenHeight(48),
      child: TextButton(
        style: ButtonStyle(
            alignment: Alignment.center,
            textStyle: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.disabled)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.white)),
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.disabled)
                    ? Palette.gray
                    : hasBackground
                        ? backGroundColor!
                        : Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)))),
        onPressed: !disable ? press : null,
        child: !displayLoading
            ? (frontIcon != null)
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        frontIcon!,
                        color: frontIconColor,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(text,
                          textAlign: TextAlign.center,
                          style: Styles.normalTextStyle.copyWith(
                              fontSize:
                                  getProportionateScreenWidth(fontSize ?? 18),
                              color: hasBackground
                                  ? textColor
                                  : Palette.transPrimaryColor)),
                      const Spacer()
                    ],
                  )
                : Text(
                    text,
                    style: Styles.normalTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(fontSize ?? 18),
                      color:
                          hasBackground ? textColor : Palette.transPrimaryColor,
                    ),
                  )
            : SpinKitThreeBounce(
                color: Colors.white,
                size: loaderSize,
              ),
      ),
    );
  }
}
