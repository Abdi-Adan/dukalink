import 'package:dukalink/application/core/utils.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:dukalink/presentation/widgets/atomic/circles.dart';
import 'package:dukalink/presentation/widgets/atomic/diagonal_circles.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_numeric_keyboard.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_small_appbar.dart';
import 'package:flutter/material.dart';

class KeyboardScaffold extends StatefulWidget {
  final IconData? trailingActionIcon;
  final List<Widget> childWidgets;
  final Widget? trailingWidget;
  final bool isSecondary;
  final TextEditingController? keyboardController;

  const KeyboardScaffold({
    Key? key,
    required this.childWidgets,
    this.isSecondary = false,
    this.trailingActionIcon = Icons.settings,
    this.trailingWidget,
    this.keyboardController,
  }) : super(key: key);

  @override
  State<KeyboardScaffold> createState() => _KeyboardScaffoldState();
}

class _KeyboardScaffoldState extends State<KeyboardScaffold> {
  // ignore: prefer_typing_uninitialized_variables
  var keyController;

  @override
  void initState() {
    keyController = widget.keyboardController ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!widget.isSecondary) {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: CustomSmallAppbar(
          isSecondary: widget.isSecondary,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(widget.trailingActionIcon),
              color: DukalinkThemes.secondaryColor,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            ...circles(context, circleColor: DukalinkThemes.whiteSmoke),
            ...diagonalCircles(context,
                ringColor1: DukalinkThemes.whiteSmoke,
                ringColor2: DukalinkThemes.whiteSmoke),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.childWidgets,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: widget.trailingWidget ??
                  CustomNumericKeyboard(
                    onKeyboardTap: (String text) {
                      setState(() {
                        insertText(text, keyController);
                      });
                    },
                    rightIcon: const Icon(
                      Icons.backspace,
                      color: DukalinkThemes.orange,
                    ),
                    rightButtonFn: () {
                      setState(() {
                        backspace(keyController);
                      });
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
