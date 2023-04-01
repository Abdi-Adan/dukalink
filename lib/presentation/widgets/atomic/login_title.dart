import 'package:dukalink/domain/value_objects/app_constants.dart';
import 'package:dukalink/domain/value_objects/app_spaces.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

List<Widget> titles({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String extraHeading,
  double? titleFontSize,
  double? headingFontSize,
}) {
  return <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: DukalinkThemes.primaryColor,
            fontSize: titleFontSize ?? 36,
            fontWeight: FontWeight.normal,
          ),
          children: <TextSpan>[
            TextSpan(
                text: subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: titleFontSize ?? 36,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    ),
    vSize10SizedBox,
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        extraHeading,
        style: TextStyle(
          color: DukalinkThemes.primaryColor,
          fontSize: headingFontSize ?? defaultFontSize,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.start,
      ),
    ),
  ];
}
