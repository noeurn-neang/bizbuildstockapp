import 'package:flutter/material.dart';
import 'package:flutter_core/configs/variables.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_core/models/language_model.dart';

import '../constants/theme.dart';

class StockAppConfig {
  StockAppConfig._();

  // static const String baseUrl = 'http://api-v3-pln.bizbuildtec.com:83';
  static const String baseUrl = 'http://api-v3-stg.bizbuildtec.com:83';
  static const String saleUrl = '$baseUrl/salse';
  static const String productUrl = '$baseUrl/product';

  static const String defaultPassword = '123';

  static Future<void> init() async {
    // Init Flutter Core Plugin
    await FlutterCore.initApplication();

    // Http Request Header
    Variables.authHeaderKey = 'Authorization';

    // Translation
    Variables.languages = [
      LanguageModel("en", "us", "English"),
    ];

    // Theme Data
    Variables.themeDataDark = ThemeData(
      colorSchemeSeed: ColorSeed.indigo.color,
      useMaterial3: true,
      brightness: Brightness.dark,
    );

    Variables.themeDataLight = ThemeData(
      colorSchemeSeed: ColorSeed.indigo.color,
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }
}
