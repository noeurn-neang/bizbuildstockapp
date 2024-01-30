import 'package:flutter/cupertino.dart';
import 'package:flutter_core/getx.dart';
import 'package:flutter_core/mixins/form_validation_mixin.dart';
import 'package:flutter_core/utils/message_utils.dart';
import 'package:flutter_core/utils/request_utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../auth_manager.dart';
import '../../../components/bar_code_scanner.dart';
import '../../../models/stock_model.dart';
import '../../../network/stock_api_repository.dart';

class StockCountController extends GetxController with FormValidationMixin {
  final StockApiRepository stockApiRepository;
  final AuthManager authManager = Get.find();
  final formKey = GlobalKey<FormState>();
  final stockModel = StockModel().obs;
  final selectedLocation = ''.obs;

  final locationController = TextEditingController();
  final barcodeController = TextEditingController();
  final itemCodeController = TextEditingController();
  final itemNameController = TextEditingController();
  final areaController = TextEditingController();
  final qohController = TextEditingController();
  final quantityCountController = TextEditingController();
  final remarkController = TextEditingController();

  StockCountController({required this.stockApiRepository});

  @override
  void dispose() {
    locationController.dispose();
    barcodeController.dispose();
    itemCodeController.dispose();
    itemNameController.dispose();
    areaController.dispose();
    qohController.dispose();
    quantityCountController.dispose();
    remarkController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    selectedLocation.value = authManager.defloc.value;
    super.onInit();
  }

  Future<void> requestGetProduct({String? stockid, String? loccode}) async {
    showLoading();
    try {
      Response response = await stockApiRepository.getStockCount(
          stockid: stockid, loccode: loccode);
      if (response.hasError) {
        handleRequestError(response);
      } else {
        stockModel.value = StockModel.fromJson(response.body);
        setFormData();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      hideLoading();
    }
  }

  Future<void> requestSaveStockCount(Map<String, dynamic> dataModel) async {
    showLoading();
    try {
      Response response = await stockApiRepository.updateStockCount(dataModel);
      if (response.hasError) {
        handleRequestError(response);
      } else {
        // var itemCode = response.body['stockid'];
        var message = response.body['message'];
        showMessage(message);
        stockModel.value = StockModel();
        clearFormData();
        // itemCodeController.text = itemCode;
      }
    } catch (e) {
      showMessage('Fail to save stock count', isError: true);
    } finally {
      hideLoading();
    }
  }

  void setFormData() {
    StockModel data = stockModel.value;

    var totalQoh = 0;
    for (var record in data.records!) {
      totalQoh += record.qoh ?? 0;
    }

    itemCodeController.text = data.stockid!;
    itemNameController.text = data.description!;
    areaController.text = data.area!;
    qohController.text = '$totalQoh';
  }

  void handleSave() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> dataModel = {
        "token": authManager.getToken(),
        "stockid": stockModel.value.stockid,
        "loccode": selectedLocation.value,
        "qtycount": quantityCountController.text,
        "uom": "PIECE",
        "qoh": qohController.text,
        "reason": remarkController.text,
        "countby": authManager.user.value.username,
        "note": "",
        "stkcountid": "",
      };
      requestSaveStockCount(dataModel);
    }
  }

  void handleSearch() {
    requestGetProduct(
        stockid: barcodeController.text, loccode: selectedLocation.value);
  }

  void handleScan() {
    Get.to(
      BarCoderScannerWithController(
        onDetect: ((capture) {
          final List<Barcode> barcodes = capture.barcodes;
          barcodeController.text = barcodes.last.rawValue.toString();
          Get.back();
        }),
      ),
    );
  }

  void handleChangeLocation(String? value) {
    selectedLocation.value = value ?? '';
  }

  void clearFormData() {
    barcodeController.clear();
    qohController.clear();
    itemCodeController.clear();
    itemNameController.clear();
    areaController.clear();
    quantityCountController.clear();
    remarkController.clear();
  }
}
