import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';

import '../auth_manager.dart';
import '../routes/app_pages.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  List<dynamic> listMenu = [
    {
      'title': 'Home',
      'route': Routes.MAIN,
      'icon': Icons.home_rounded,
    },
    {
      'title': 'Search product',
      'route': Routes.COUNTPRD,
      'icon': Icons.search,
    },
    {
      'title': 'Stock balance',
      'route': Routes.STOCK_BLANCE,
      'icon': Icons.qr_code_scanner,
    },
    {
      'title': 'Stock count',
      'route': Routes.STOCK_COUNT,
      'icon': Icons.barcode_reader,
    },
    {
      'title': 'Daily Sale Report',
      'route': Routes.DAILY_SALRE_REPORT,
      'icon': Icons.point_of_sale,
    },
    {
      'title': 'Logout',
      'icon': Icons.logout,
    }
  ];
  @override
  Widget build(BuildContext context) {
    final AuthManager authManager = Get.find();

    return Drawer(
      elevation: 0.0,
      shape: const BeveledRectangleBorder(),
      semanticLabel: 'Home',
      child: Column(
        children: [
          // header
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Young_girl_smiling_in_sunshine_%282%29.jpg/450px-Young_girl_smiling_in_sunshine_%282%29.jpg'),
                    radius: 35,
                  ),
                  Dimens.hml,
                  Text(
                    authManager.user.value.username ?? 'Admin',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: listMenu
                    .map(
                      (menu) => ListTile(
                        minLeadingWidth: 40,
                        title: Text(menu['title'] ?? ''),
                        leading: Icon(
                          menu['icon'],
                          size: 16,
                        ),
                        selectedColor: Theme.of(context).colorScheme.primary,
                        focusColor: Theme.of(context).colorScheme.primary,
                        selected: Get.currentRoute == menu['route'],
                        selectedTileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        onTap: () {
                          if (menu['route'] != null) {
                            Get.back();
                            Get.toNamed(menu['route']);
                          } else {
                            authManager.logOut();
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
