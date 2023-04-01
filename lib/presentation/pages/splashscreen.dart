import 'package:dukalink/application/core/utils.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacementNamed(
          context, appInitialRoute.initialRoute.value);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Card(
                elevation: 2,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: DukalinkThemes.whiteSmoke,
                  backgroundImage: AssetImage('assets/logo/logo.png'),
                ),
              ),
              SizedBox(height: 20),
              Text('Dukalink', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
