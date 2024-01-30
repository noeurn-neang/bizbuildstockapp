import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_core/x_material_app.dart';

import 'app/app_binding.dart';
import 'app/configs/stock_app.dart';
import 'app/routes/app_pages.dart';
import 'app/translation/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Application
  await StockAppConfig.init();

  runApp(const MyApp());

  // Run Config After App Loaded
  FlutterCore.configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return XMaterialApp(
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.loadTranslateKeys(),
    );
  }
}
