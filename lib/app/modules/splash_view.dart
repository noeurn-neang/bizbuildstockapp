import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/getx.dart';

import '../auth_manager.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key}) {
    Get.put(AuthManager(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Center(
          child: Image.asset('assets/images/ic_buizbuildtec.jpeg'),
        ),
      ),
    );
  }
}
