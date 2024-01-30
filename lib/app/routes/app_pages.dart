import 'package:flutter_core/getx.dart';

import '../modules/auth/auth_binding.dart';
import '../modules/auth/auth_view.dart';
import '../modules/main/dailysale_report/dailysale_report_binding.dart';
import '../modules/main/dailysale_report/dailysale_report_view.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_view.dart';
import '../modules/main/search_product/search_product_binding.dart';
import '../modules/main/search_product/search_product_view.dart';
import '../modules/main/stock_balance/stock_balance_binding.dart';
import '../modules/main/stock_balance/stock_balance_view.dart';
import '../modules/main/stock_count/stock_count_binding.dart';
import '../modules/main/stock_count/stock_count_view.dart';
import '../modules/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHPRD,
      page: () => SearchProductView(),
      binding: SearchProductBinding(),
    ),
    GetPage(
      name: _Paths.STOCKBALANCE,
      page: () => StockBalanceView(),
      binding: StockBalanceBinding(),
    ),
    GetPage(
      name: _Paths.STOCK_COUNT,
      page: () => const StockCountView(),
      binding: StockCountBinding(),
    ),
    GetPage(
      name: _Paths.DAILYSALREPORT,
      page: () => DailySaleView(),
      binding: DailySaleReportBinding(),
    )
  ];
}
