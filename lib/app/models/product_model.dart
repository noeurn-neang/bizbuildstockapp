import 'package:flutter_core/utils/number_utils.dart';

class ProductModel {
  String? itemcode;
  String? itemname;
  String? area;
  dynamic qoh;
  double? price;

  ProductModel({this.itemcode, this.itemname, this.area, this.qoh, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    itemcode = json['itemcode'];
    itemname = json['itemname'];
    area = json['area'];
    qoh = json['qoh'];
    price = parseDouble(json['price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemcode'] = itemcode;
    data['itemname'] = itemname;
    data['area'] = area;
    data['qoh'] = qoh;
    data['price'] = price;
    return data;
  }

  static List<ProductModel> fromJsonList(list) {
    var data = <ProductModel>[];
    for (var obj in list) {
      data.add(ProductModel.fromJson(obj));
    }
    return data;
  }
}
