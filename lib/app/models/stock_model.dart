import 'package:flutter_core/utils/number_utils.dart';

class StockModel {
  List<Records>? records;
  String? stockid;
  String? description;
  String? size;
  String? color;
  String? area;
  double? price;

  StockModel(
      {this.records,
      this.stockid,
      this.description,
      this.size,
      this.color,
      this.area,
      this.price});

  StockModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
    stockid = json['stockid'];
    description = json['description'];
    size = json['size'];
    color = json['color'];
    area = json['area'];
    price = parseDouble(json['price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    data['stockid'] = stockid;
    data['description'] = description;
    data['size'] = size;
    data['color'] = color;
    data['area'] = area;
    data['price'] = price;
    return data;
  }
}

class Records {
  String? loccode;
  String? locationname;
  int? qoh;

  Records({this.loccode, this.locationname, this.qoh});

  Records.fromJson(Map<String, dynamic> json) {
    loccode = json['loccode'];
    locationname = json['locationname'];
    qoh = int.parse(json['qoh']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loccode'] = loccode;
    data['locationname'] = locationname;
    data['qoh'] = qoh;
    return data;
  }
}
