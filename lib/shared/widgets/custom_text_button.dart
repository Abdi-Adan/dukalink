import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? borderColor;
  final Color textcolor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? frontIconSize;
  final double? fontSize;
  final bool displayLoading;
  final String? frontIcon;

  const CustomTextButton(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.textcolor = Palette.dukalinkWhiteColor,
      required this.onTap,
      this.fontSize,
      this.frontIconSize,
      this.borderColor,
      this.frontIcon,
      this.width,
      this.height,
      required this.displayLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? Palette.dukalinkBlack5),
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: !displayLoading
            ? Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  frontIcon != null
                      ? SvgPicture.asset(
                          frontIcon!,
                          // color: disabledColor,
                          height: frontIconSize ?? 50.h,
                        )
                      : const SizedBox.shrink(),
                  frontIcon != null
                      ? SizedBox(
                          width: 10.w,
                        )
                      : const SizedBox.shrink(),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textcolor,
                        fontSize: fontSize ?? 12,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                ],
              )
            : const SpinKitThreeBounce(
                color: Colors.white,
                size: 20,
              ),
      ),
    );
  }
}
