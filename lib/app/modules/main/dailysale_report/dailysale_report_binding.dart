import 'package:flutter_core/getx.dart';

import 'dailysale_report_controller.dart';

class DailySaleReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DailySaleReportController(stockApiRepository: Get.find()));
  }
}