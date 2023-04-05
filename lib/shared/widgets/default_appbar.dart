import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dukalink_app/shared/configs/colors.dart';

var defaultAppBar = AppBar(
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Palette.dukalinkPrimaryColor,
    systemNavigationBarColor: Palette.dukalinkPrimaryColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ),
  foregroundColor: Palette.dukalinkPrimaryColor,
  backgroundColor: Palette.dukalinkPrimaryColor,
  elevation: 0.0,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);

var menuAppbar = AppBar(
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Palette.white,
    systemNavigationBarColor: Palette.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ),
  foregroundColor: Palette.white,
  backgroundColor: Palette.white,
  elevation: 0.0,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  leading: const Icon(Icons.menu),
);
