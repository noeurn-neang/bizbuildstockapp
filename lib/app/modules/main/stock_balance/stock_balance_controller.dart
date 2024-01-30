import 'package:flutter/cupertino.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/utils/message_utils.dart';
import 'package:flutter_core/utils/request_utils.dart';

import '../../../models/stock_model.dart';
import '../../../network/stock_api_repository.dart';

class StockBalanceController extends GetxController {
  final StockApiRepository stockApiRepository;
  StockBalanceController({
    required this.stockApiRepository,
  });
  var textEditingController = TextEditingController().obs;
  var stockBalance = StockModel().obs;
  var totalQuantity = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getStockCount();
  }

  Future<void> getStockCount({String? value}) async {
    try {
      showLoading();
      Response response =
          await stockApiRepository.getStockCount(stockid: value);
      if (response.hasError) {
        handleRequestError(response);
      } else {
        stockBalance.value = StockModel.fromJson(response.body);
        int total = 0;
        for (var stock in stockBalance.value.records ?? []) {
          total += int.parse(stock.qoh);
        }
        totalQuantity.value = total;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      hideLoading();
    }
  }
}
