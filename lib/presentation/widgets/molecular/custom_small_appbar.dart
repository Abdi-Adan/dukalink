import 'package:dukalink/domain/value_objects/app_global_constants.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

class CustomSmallAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSecondary;
  final String? title;
  final Color? appbarColor;
  final Color? titleColor;
  final bool isTitleCenter = true;
  final List<Widget>? actions;
  final Function? onLeadingTap;

  const CustomSmallAppbar(
      {Key? key,
      this.title,
      this.appbarColor,
      this.titleColor,
      this.actions,
      this.onLeadingTap,
      this.isSecondary = true})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(appbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isSecondary
          ? IconButton(
              onPressed: (() => onLeadingTap ?? Navigator.pop(context)),
              icon: const Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
              ))
          : const SizedBox.shrink(),
      title: Text(
        title ?? '',
        style: DukalinkThemes().textThemes(color: titleColor ?? Colors.white),
      ),
      backgroundColor: appbarColor ?? Colors.white,
      centerTitle: isTitleCenter,
      elevation: 0,
      actions: actions ?? [const SizedBox.shrink()],
    );
  }
}
