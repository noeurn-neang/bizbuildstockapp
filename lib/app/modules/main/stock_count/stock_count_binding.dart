import 'package:flutter_core/getx.dart';

import 'stock_count_controller.dart';

class StockCountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StockCountController(stockApiRepository: Get.find()));
  }
}
