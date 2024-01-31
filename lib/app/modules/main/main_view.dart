import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';

import '../../components/drawer.dart';
import 'main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        body: HomeView(
          listMenu: controller.listMenu,
        ));
  }
}

class HomeView extends StatelessWidget {
  final List<dynamic>? listMenu;

  const HomeView({super.key, this.listMenu});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          expandedHeight: 140.0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(Dimens.marginLarge),
            title: Text(
              'BizBuildStock App',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          sliver: SliverGrid.builder(
            itemCount: listMenu?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Get.toNamed(listMenu?[index]['route']);
              },
              child: Container(
                // padding: const EdgeInsets.all(5.0),
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white10,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              listMenu?[index]['icon'],
                              size: 60,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          color: index % 3 == 0
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                        ),
                        child: Center(
                          child: Text(
                            listMenu?[index]['title'],
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                        ),
                        // color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
