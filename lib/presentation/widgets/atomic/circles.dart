import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

List<Widget> circles(BuildContext context, {Color? circleColor}) {
  const double circleSize = 1000;
  const double circleOffscreenSize = -500;
  return <Widget>[
    Positioned(
      top: circleOffscreenSize,
      left: circleOffscreenSize,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor ?? DukalinkThemes.whiteSmoke,
        ),
      ),
    ),
  ];
}
