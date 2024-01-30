import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/utils/debouncer.dart';
import 'package:flutter_core/utils/string_utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../components/bar_code_scanner.dart';
import '../../../components/input_field/custom_input_form_field.dart';
import 'search_product_controller.dart';

class SearchProductView extends GetView<SearchProductController> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final _debouncer = Debouncer(milliseconds: 500);

  SearchProductView({super.key});

  Widget listProduct({
    required BuildContext context,
  }) {
    Color textColor = Theme.of(context).colorScheme.onBackground;
    return RefreshIndicator(
      key: refreshIndicatorKey,
      onRefresh: controller.getListProduct,
      child: Obx(() => ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: ((context, index) {
              var item = controller.products[index];
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
                        child: Text(
                          item.itemcode.toString(),
                          softWrap: true,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          item.itemname ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          StringUtils.formatMoney('\$', item.price),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                    ]),
              );
            }),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search product'),
      ),
      body: Column(
        children: [
          Dimens.vmm,
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
            child: CustomInputFormField(
              controller: controller.textEditingController,
              onChange: (value) {
                _debouncer.run(() {
                  controller.searchProduct(value);
                });
              },
              onTapOutside: (event) {
                controller.searchNode.value.unfocus();
              },
              suffixIcon: IconButton(
                onPressed: () {
                  Get.to(
                    BarCoderScannerWithController(
                      onDetect: ((capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        controller.textEditingController.text =
                            barcodes.last.rawValue.toString();
                        controller
                            .searchProduct(barcodes.last.rawValue.toString());
                        Get.back();
                      }),
                    ),
                  );
                },
                icon: const Icon(Icons.qr_code_scanner_rounded),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.center,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Code#',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Product name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Price',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(child: listProduct(context: context)),
        ],
      ),
    );
  }
}
