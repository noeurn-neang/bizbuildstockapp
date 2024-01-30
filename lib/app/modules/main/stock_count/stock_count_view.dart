import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';

import 'stock_count_controller.dart';

class StockCountView extends GetView<StockCountController> {
  const StockCountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock count'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.marginLarge, vertical: Dimens.margin),
            child: Obx(() => Column(
                  children: [
                    Dimens.vmm,
                    Row(
                      children: [
                        Expanded(
                            child: DropdownMenu<String>(
                          controller: controller.locationController,
                          initialSelection: controller.authManager.defloc.value,
                          label: const Text('Location'),
                          // width: (screenWidth - (Dimens.marginLarge * 2)),
                          onSelected: (String? value) {
                            controller.handleChangeLocation(value);
                          },
                          dropdownMenuEntries: controller.authManager.listBranch
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        )),
                        Expanded(
                            child: TextFormField(
                          controller: controller.barcodeController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Barcode')),
                        )),
                        IconButton(
                            onPressed: () {
                              controller.handleScan();
                            },
                            icon: const Icon(Icons.qr_code))
                      ],
                    ),
                    Dimens.vmm,
                    const Divider(),
                    Dimens.vmm,
                    TextFormField(
                      readOnly: true,
                      controller: controller.itemCodeController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Item Code')),
                    ),
                    Dimens.vmm,
                    TextFormField(
                      readOnly: true,
                      controller: controller.itemNameController,
                      maxLines: 3,
                      minLines: 2,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Item Name')),
                    ),
                    Dimens.vmm,
                    TextFormField(
                      readOnly: true,
                      controller: controller.areaController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Area')),
                    ),
                    Dimens.vmm,
                    TextFormField(
                      readOnly: true,
                      controller: controller.qohController,
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Quantity on hand')),
                    ),
                    Dimens.vmm,
                    TextFormField(
                      validator: controller.validateRequired,
                      controller: controller.quantityCountController,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Quantity count')),
                    ),
                    Dimens.vmm,
                    TextFormField(
                      controller: controller.remarkController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Remark')),
                    ),
                    Dimens.vml,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              controller.handleSearch();
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.search),
                                Dimens.hms,
                                Text('Search')
                              ],
                            )),
                        ElevatedButton(
                            onPressed:
                                controller.stockModel.value.stockid != null
                                    ? () {
                                        controller.handleSave();
                                      }
                                    : null,
                            child: const Row(
                              children: [
                                Icon(Icons.save),
                                Dimens.hms,
                                Text('Save')
                              ],
                            ))
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
