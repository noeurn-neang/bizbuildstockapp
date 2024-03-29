import 'package:flutter/material.dart';
import 'package:flutter_core/getx.dart';

import '../constants/theme.dart';

class ViewUtils {
  static profileDecoration(String image) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(image),
      ),
    );
  }

  static onlineStatus() {
    return const BoxDecoration(
      color: activeColor,
      shape: BoxShape.circle,
    );
  }

  static bigStori() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.orange,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }

  static littleStori(String image) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(image),
      ),
    );
  }

  static displayAvatarDecoration({String? image}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(image ?? 'assets/img/musk.jpg'),
      ),
    );
  }

  static bodyDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      color: Theme.of(Get.context!).cardColor,
    );
  }
}
