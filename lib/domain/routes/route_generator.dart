// Flutter imports:
import 'package:dukalink/domain/routes/routes.dart';
import 'package:dukalink/dukalink_app.dart';
import 'package:dukalink/presentation/pages/homepage.dart';
import 'package:dukalink/presentation/pages/login_page.dart';
import 'package:dukalink/presentation/pages/splashscreen.dart';
import 'package:dukalink/presentation/pages/verify_phone_page.dart';
import 'package:dukalink/presentation/widgets/molecular/unrecoverable_error_widget.dart';
import 'package:flutter/material.dart';

class AppRouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    // ignore: unused_local_variable
    final dynamic args = settings?.arguments;

    switch (settings?.name) {
      case landingPageRoute:
        return MaterialPageRoute<SplashPage>(
            builder: (_) => const SplashPage());
      case phoneInputPageRoute:
        return MaterialPageRoute<LoginPage>(builder: (_) => const LoginPage());
      case verifyPhonePageRoute:
        return MaterialPageRoute<PhoneVerifyPage>(
            builder: (_) => const PhoneVerifyPage());
      case homePageRoute:
        return MaterialPageRoute<Homepage>(
            builder: (_) => const Homepage(
                  title: 'Dukalink demo',
                ));

      default:
        return _errorRoute();
    }
  }

  /// When the route is unknown, 404 page is displayed with a link to navigate to home or login
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<DukalinkApp>(
      builder: (_) => const UnrecoverableErrorWidget(),
    );
  }
}
