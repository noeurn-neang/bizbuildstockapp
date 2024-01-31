import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/utils/debouncer.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../components/bar_code_scanner.dart';
import '../../../components/input_field/custom_input_form_field.dart';
import 'stock_balance_controller.dart';

class StockBalanceView extends GetView<StockBalanceController> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final _debouncer = Debouncer(milliseconds: 500);

  StockBalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock balance'),
      ),
      body: Column(
        children: [
          Dimens.vms,
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
            child: CustomInputFormField(
              controller: controller.textEditingController.value,
              onFieldSubmitted: (p0) {
                controller.getStockCount(value: p0);
              },
              onChange: (p0) {
                _debouncer.run(() {
                  controller.getStockCount(value: p0);
                });
              },
              suffixIcon: IconButton(
                onPressed: () {
                  Get.to(
                    BarCoderScannerWithController(
                      onDetect: ((capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        controller.textEditingController.value.text =
                            barcodes.last.rawValue.toString();
                        controller.getStockCount(
                            value: barcodes.last.rawValue.toString());
                        Get.back();
                      }),
                    ),
                  );
                },
                icon: const Icon(Icons.qr_code_scanner_rounded),
              ),
            ),
          ),
          Obx(() => Container(
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      selected: true,
                      // tileColor: Colors.amber,
                      selectedColor: Colors.white,
                      subtitleTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      title: Text(
                        'Product name ${controller.stockBalance.value.records?.length}',
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle:
                          Text(controller.stockBalance.value.description ?? ''),
                    ),
                    Container(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.2),
                      child: Row(
                        children: [
                          Flexible(
                            child: ListTile(
                                selected: true,
                                selectedColor: Colors.white,
                                subtitleTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                title: const Text(
                                  'Color',
                                  style: TextStyle(fontSize: 12),
                                ),
                                subtitle: Text(
                                    controller.stockBalance.value.color ??
                                        '-')),
                          ),
                          Flexible(
                            child: ListTile(
                                selected: true,
                                selectedColor: Colors.white,
                                subtitleTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                title: const Text(
                                  'Size',
                                  style: TextStyle(fontSize: 12),
                                ),
                                subtitle: Text(
                                    controller.stockBalance.value.size ?? '-')),
                          ),
                          Flexible(
                            child: ListTile(
                                selected: true,
                                selectedColor: Colors.white,
                                subtitleTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                title: const Text(
                                  'Quantity',
                                  style: TextStyle(fontSize: 12),
                                ),
                                subtitle:
                                    Text(controller.totalQuantity.toString())),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'No#',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Location name',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'QOH',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Obx(() => RefreshIndicator(
                    key: refreshIndicatorKey,
                    onRefresh: controller.getStockCount,
                    child: (controller.stockBalance.value.records != null &&
                            controller.stockBalance.value.records!.isNotEmpty)
                        ? ListView.builder(
                            itemCount:
                                controller.stockBalance.value.records?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                color: index % 2 == 0
                                    ? Theme.of(context).colorScheme.background
                                    : Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        controller.stockBalance.value
                                                .records?[index].locationname ??
                                            '',
                                        style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${controller.stockBalance.value.records?[index].qoh ?? 0}',
                                        style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : Container(),
                  )))
        ],
      ),
    );
  }
}
