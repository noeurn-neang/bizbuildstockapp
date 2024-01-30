import 'package:flutter_core/getx.dart';

import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(stockApiRepository: Get.find()));
  }
}
