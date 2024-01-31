import 'package:flutter/material.dart';
import 'package:flutter_core/getx.dart';

import '../../network/stock_api_repository.dart';
import '../../routes/app_pages.dart';

class MainController extends GetxController {
  final StockApiRepository stockApiRepository;
  MainController({required this.stockApiRepository});
  var globalKey = GlobalKey<ScaffoldState>().obs;

  var currentIndex = 0.obs;

  var pageController = PageController().obs;

  var listMenu = [
    {
      "title": 'Search product',
      'icon': Icons.manage_search_sharp,
      'route': Routes.COUNTPRD,
    },
    {
      "title": 'Stock balance',
      'icon': Icons.qr_code_scanner_rounded,
      'route': Routes.STOCK_BLANCE,
    },
    {
      "title": 'Stock count',
      'icon': Icons.barcode_reader,
      'route': Routes.STOCK_COUNT,
    },
    {
      "title": 'Daily sale report',
      'icon': Icons.attach_money,
      'route': Routes.DAILY_SALRE_REPORT,
    }
  ];

  Future handleDrawerMenu(
      int? index, GlobalKey<ScaffoldState> _globalKey) async {
    currentIndex.value = index ?? 0;
    pageController.value.jumpToPage(index ?? 0);
    _globalKey.currentState?.closeDrawer();
  }
}
