import 'package:flutter_core/getx.dart';
import 'package:flutter_core/network/base_provider.dart';

import './network/api_provider.dart';
import 'configs/stock_app.dart';
import 'network/stock_api_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<BaseProvider>(ApiProvider(StockAppConfig.baseUrl), permanent: true);
    Get.put(StockApiRepository(apiProvider: Get.find()), permanent: true);
  }
}
