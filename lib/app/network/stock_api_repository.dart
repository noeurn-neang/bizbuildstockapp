import 'package:flutter_core/mixins/cache_manager_mixin.dart';
import 'package:flutter_core/network/base_api_repository.dart';

import '../models/user_login_model.dart';
import '../utils/common_utils.dart';

class StockApiRepository extends BaseApiRepository with CacheManagerMixin {
  String? token;
  StockApiRepository({
    required super.apiProvider,
  });

  // Login
  Future<dynamic> login(UserLoginModel user) async {
    String url = '/login.php?';
    return apiProvider.post(url, user.toJson());
  }

  Future<dynamic> getListProduct(String? itemname) {
    return apiProvider.post('/product/list.php?', {
      "token": getAuthToken(),
      "itemname": itemname ?? "",
    });
  }

  Future<dynamic> getStockCount({String? stockid, String? loccode}) {
    return apiProvider.post('/product/qoh.php', {
      "token": getAuthToken(),
    }, query: {
      'stockid': stockid ?? '',
      'loccode': loccode ?? ''
    });
  }

  Future<dynamic> updateStockCount(Map<String, dynamic> dataModel) async {
    return apiProvider.post('/stockcount/create.php?', dataModel);
  }

  Future<dynamic> getSaleReport(
      {DateTime? startDate, DateTime? endDate, String? location}) async {
    print({
      "token": getAuthToken(),
      "loccode": location,
      "fromdate": formatDateToString(startDate ?? DateTime.now()),
      "todate": formatDateToString(endDate ?? DateTime.now()),
    });
    return apiProvider.post("/sale/dailysale.php?", {
      "token": getAuthToken(),
      "loccode": location,
      "fromdate": formatDateToString(startDate ?? DateTime.now()),
      "todate": formatDateToString(endDate ?? DateTime.now()),
    });
  }

  String? getAuthToken() {
    token ??= getToken();
    return token;
  }
}
