import 'package:flutter_core/getx.dart';

import 'search_product_controller.dart';

class SearchProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchProductController(stockApiRepository: Get.find()));
  }
}
