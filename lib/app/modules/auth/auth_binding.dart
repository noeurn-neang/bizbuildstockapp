import 'package:flutter_core/getx.dart';

import 'auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(stockApiRepository: Get.find()));
  }
}
