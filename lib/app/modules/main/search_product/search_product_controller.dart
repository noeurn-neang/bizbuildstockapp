import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/utils/message_utils.dart';
import 'package:flutter_core/utils/request_utils.dart';

import '../../../models/product_model.dart';
import '../../../network/stock_api_repository.dart';

class SearchProductController extends GetxController {
  final StockApiRepository stockApiRepository;
  SearchProductController({required this.stockApiRepository});
  var searchNode = FocusNode().obs;
  var products = <ProductModel>[].obs;
  var sourceProducts = <ProductModel>[].obs;
  var textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getListProduct();
  }

  Future<void> getListProduct({String? itemcode}) async {
    if (itemcode == null || itemcode.isEmpty) {
      textEditingController.text = '';
    }

    showLoading();
    try {
      Response response = await stockApiRepository.getListProduct(itemcode);
      if (response.hasError) {
        handleRequestError(response);
      } else {
        sourceProducts.value =
            ProductModel.fromJsonList(response.body['records']);
        products.value = sourceProducts;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      hideLoading();
    }
  }

  Future<void> searchProduct(String? value) async {
    if (value!.isNotEmpty) {
      getListProduct(itemcode: value);
      // products.value = sourceProducts
      //     .where((element) => '${element.itemname!}${element.itemcode!}'
      //         .toLowerCase()
      //         .contains(value.toLowerCase()))
      //     .toList();
    } else {
      products.value = sourceProducts;
    }
  }
}
