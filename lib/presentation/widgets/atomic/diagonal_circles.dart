import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

List<Widget> diagonalCircles(
  BuildContext context, {
  Color? ringColor1,
  Color? ringColor2,
}) {
  const double diagonalCircleDiameter = 350;
  return <Widget>[
    Positioned(
      top: -(diagonalCircleDiameter / 2),
      right: -(diagonalCircleDiameter / 2),
      child: Container(
        width: diagonalCircleDiameter,
        height: diagonalCircleDiameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ringColor1 ?? DukalinkThemes.orange,
        ),
      ),
    ),
    Positioned(
      bottom: -(diagonalCircleDiameter / 2),
      left: -(diagonalCircleDiameter / 2),
      child: Container(
        width: diagonalCircleDiameter,
        height: diagonalCircleDiameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ringColor2 ?? DukalinkThemes.lightOrange,
        ),
      ),
    ),
  ];
}
