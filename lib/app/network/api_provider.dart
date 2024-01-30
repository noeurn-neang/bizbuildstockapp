import 'dart:async';

import 'package:flutter_core/getx.dart';
import 'package:flutter_core/network/base_provider.dart';
import 'package:flutter_core/utils/message_utils.dart';

import '../auth_manager.dart';

class ApiProvider extends BaseProvider {
  ApiProvider(super.baseApiUrl);

  @override
  FutureOr responseInterceptor(Request request, Response response) async {
    // Save updated token to storage

    var body = response.body;
    if (body['error'] != null && body['status'] == 'Token Expired') {
      showMessage('Token expired!'.tr, isError: true);

      final AuthManager authManager = Get.find();
      authManager.logOut();
    }

    return super.responseInterceptor(request, response);
  }
}
