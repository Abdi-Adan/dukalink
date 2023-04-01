import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

///[AppWrapper] is a wrapper widget inserted at the application's root to provide 
/// inheritance of the App state to all child widgets and pages across the entire widget tree
class AppWrapper extends InheritedWidget {
  const AppWrapper({
    Key? key,
    required Widget child,
    required this.store,
  }) : super(key: key, child: child);

  final Store store;

  static AppWrapper of(BuildContext context) {
    final AppWrapper? store =
        context.dependOnInheritedWidgetOfExactType<AppWrapper>();
    assert(store != null, 'No Store found in context');
    return store!;
  }

  @override
  bool updateShouldNotify(AppWrapper oldWidget) => store != oldWidget.store;
}
