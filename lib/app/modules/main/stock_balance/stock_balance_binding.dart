import 'package:flutter_core/getx.dart';

import 'stock_balance_controller.dart';

class StockBalanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockBalanceController(stockApiRepository: Get.find()));
  }
}
