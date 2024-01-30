import 'package:flutter/widgets.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/utils/message_utils.dart';
import 'package:flutter_core/utils/request_utils.dart';

import '../../auth_manager.dart';
import '../../constants/login_types.dart';
import '../../models/user_login_model.dart';
import '../../network/stock_api_repository.dart';

class AuthController extends GetxController {
  final StockApiRepository stockApiRepository;
  final AuthManager authManager = Get.find();

  final loggedInUser = UserLoginModel().obs;

  LoginType loginType = LoginType.facebook;

  AuthController({required this.stockApiRepository});

  Map<String, TextEditingController> loginController = {};

  @override
  void onReady() {
    super.onReady();
    loginController = {
      'username': TextEditingController(),
      'password': TextEditingController(),
    };
  }

  Future<void> userLogin() async {
    showLoading();
    Response loginResponse = await stockApiRepository.login(loggedInUser.value);
    hideLoading();
    if (loginResponse.hasError) {
      handleRequestError(loginResponse);
    } else {
      Map<String, dynamic> body = loginResponse.body;
      body.addAll({'username': loggedInUser.value.userid});
      authManager.login(body);
    }
  }
}
