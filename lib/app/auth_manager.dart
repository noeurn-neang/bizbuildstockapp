import 'dart:convert';

import 'package:flutter_core/base_auth_manager.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/services/index.dart';

import 'models/user_model.dart';
import 'routes/app_pages.dart';

class AuthManager extends BaseAuthManager {
  final user = UserModel().obs;
  final listBranch = <String>[].obs;
  final defloc = ''.obs;

  @override
  void login(Map<String, dynamic> response) {
    var tokenStr = response['token'];
    List<dynamic> allowedlocs = response['allowedlocs'];

    setDefaultLocToState(response['defloc']);
    saveDefaultLocToCache(response['defloc']);

    setLocationsToState(allowedlocs);
    saveLocationsToCache(listBranch);

    setAuthState(response);
    saveToCache(tokenStr, response);
    redirectAfterLoggedIn();
  }

  @override
  Future<void> checkLoginStatus() async {
    final token = getToken();
    if (token != null) {
      try {
        var userStr = getUser();
        setAuthState(json.decode(userStr!));
        String? allowedlocsStr = StorageService.getString('allowedlocs');
        if (allowedlocsStr != null) {
          setLocationsToState(json.decode(allowedlocsStr));
          setDefaultLocToState(StorageService.getString('defaultLoc') ?? '');
        }

        redirectAfterLoggedIn();
      } catch (e) {
        logOut();
      }
    } else {
      redirectAfterLoggedOut();
    }
  }

  @override
  void redirectAfterLoggedIn() {
    Get.offAllNamed(Routes.MAIN);
  }

  @override
  void redirectAfterLoggedOut() {
    Get.offAllNamed(Routes.AUTH);
  }

  @override
  void setAuthState(userJson) {
    user.value = UserModel.fromJson(userJson);
  }

  @override
  void removeAuthState() {
    user.value = UserModel(id: 0);
    listBranch.clear();
    defloc.value = '';
  }

  saveLocationsToCache(List<String> allowedlocs) {
    StorageService.write('allowedlocs', json.encode(allowedlocs));
  }

  void setLocationsToState(List<dynamic> allowedlocsStr) {
    List<String> allowedlocs =
        allowedlocsStr.map((ele) => ele.toString()).toList();
    listBranch.value = allowedlocs;
  }

  saveDefaultLocToCache(String defaultLoc) {
    StorageService.write('defaultLoc', defaultLoc);
  }

  void setDefaultLocToState(String defaultLoc) {
    defloc.value = defaultLoc;
  }
}
