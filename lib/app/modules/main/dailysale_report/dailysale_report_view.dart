import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/utils/string_utils.dart';

import '../../../models/dailysale_model.dart';
import 'dailysale_report_controller.dart';

class DailySaleView extends GetView<DailySaleReportController> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  DailySaleView({super.key});

  Widget getListProduct({
    required List<DailySaleModel> model,
    required BuildContext context,
  }) {
    Color textColor = Theme.of(context).colorScheme.onBackground;
    return Expanded(
        child: RefreshIndicator(
      key: refreshIndicatorKey,
      onRefresh: controller.getListProduct,
      child: Obx(() => ListView.builder(
            itemCount: model.length,
            itemBuilder: ((context, index) {
              return Container(
                color: index % 2 == 0
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: Dimens.marginSmall),
                          child: Text(
                            "${model.length - index}-${model[index].invnum.toString()}",
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model[index].name ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                model[index].sodate ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: textColor,
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Text(
                          textAlign: TextAlign.end,
                          StringUtils.formatMoney(
                              '\$', model[index].totalAmount),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ]),
              );
            }),
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily sale report'),
        actions: [
          IconButton(
              onPressed: controller.openFilterDialog,
              icon: const Icon(Icons.tune_rounded)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.center,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimens.marginSmall),
                      child: Text(
                        'Invoice#',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimens.marginSmall),
                      child: Text(
                        'Customer name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
          ),
          getListProduct(
            model: controller.dailyRecodes,
            context: context,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
            color: Theme.of(context).colorScheme.surfaceVariant,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('G-Total'),
                Dimens.hml,
                Obx(() => Text(
                      StringUtils.formatMoney('\$', controller.total.value),
                      style: Theme.of(context).textTheme.titleLarge,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
