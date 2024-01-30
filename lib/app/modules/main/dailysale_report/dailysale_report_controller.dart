import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/utils/message_utils.dart';
import 'package:flutter_core/utils/request_utils.dart';

import '../../../auth_manager.dart';
import '../../../components/dialogs/search_dialog.dart';
import '../../../models/dailysale_model.dart';
import '../../../network/stock_api_repository.dart';

class DailySaleReportController extends GetxController {
  final StockApiRepository stockApiRepository;
  DailySaleReportController({required this.stockApiRepository});
  final AuthManager authManager = Get.find();
  final dailyRecodes = <DailySaleModel>[].obs;
  final selectedValue = "".obs;
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;
  final total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedValue.value = authManager.defloc.value;
    getListProduct();
  }

  Future<void> getListProduct() async {
    return requestListProduct(
        selectedValue.value, DateTime.now(), DateTime.now());
  }

  Future requestListProduct(
      String location, DateTime startDate, DateTime endDate) async {
    total.value = 0;
    dailyRecodes.clear();
    showLoading();
    try {
      Response response = await stockApiRepository.getSaleReport(
          location: selectedValue.value,
          startDate: startDate,
          endDate: endDate);
      if (response.hasError) {
        handleRequestError(response);
      } else {
        dailyRecodes.value =
            DailySaleModel.fromJsonList(response.body["records"]);
        for (var item in dailyRecodes) {
          total.value += item.totalAmount!;
        }
      }
    } catch (e) {
      print(e.toString());
    } finally {
      hideLoading();
    }
  }

  Future openFilterDialog() async {
    Get.dialog(AlertDialog(
      title: const Text('Dialog'),
      content: SizedBox(
          height: 150,
          width: 330,
          child: SearchDialog.withDate(
            selectedLoc: selectedValue.value,
            startDate: startDate.value,
            endDate: endDate.value,
            dropdownlist: authManager.listBranch,
            onChange: (loc, sd, ed) {
              selectedValue.value = loc ?? '';
              startDate.value = sd ?? DateTime.now();
              endDate.value = ed ?? DateTime.now();
            },
          )),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: const Text("Search"),
          onPressed: () {
            requestListProduct(
              selectedValue.value,
              startDate.value,
              endDate.value,
            );
            Get.back();
          },
        ),
      ],
    ));
  }
}
