import 'package:flutter_core/utils/number_utils.dart';

class DailySaleModel {
  String? sodate;
  String? name;
  String? location;
  String? invnum;
  String? typeno;
  String? type;
  String? retInv;
  dynamic pointAmt;
  String? discTotal;
  double? totalAmount;
  List<Products>? products;

  DailySaleModel(
      {this.sodate,
      this.name,
      this.location,
      this.invnum,
      this.typeno,
      this.type,
      this.retInv,
      this.pointAmt,
      this.discTotal,
      this.totalAmount,
      this.products});

  DailySaleModel.fromJson(Map<String, dynamic> json) {
    sodate = json['sodate'];
    name = json['name'];
    location = json['location'];
    invnum = json['invnum'];
    typeno = json['typeno'];
    type = json['type'];
    retInv = json['ret_inv'];
    pointAmt = json['point_amt'];
    discTotal = json['disc_total'];
    totalAmount = parseDouble(json['total_amount']);
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }
  static List<DailySaleModel> fromJsonList(list) {
    var data = <DailySaleModel>[];
    for (var obj in list) {
      data.add(DailySaleModel.fromJson(obj));
    }
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sodate'] = this.sodate;
    data['name'] = this.name;
    data['location'] = this.location;
    data['invnum'] = this.invnum;
    data['typeno'] = this.typeno;
    data['type'] = this.type;
    data['ret_inv'] = this.retInv;
    data['point_amt'] = this.pointAmt;
    data['disc_total'] = this.discTotal;
    data['total_amount'] = this.totalAmount;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? stockid;
  String? description;
  String? category;
  String? unitprice;
  String? quantity;
  String? totalprice;
  String? discountAmount;
  String? discountpercent;
  String? disPrice;
  String? discounttype;

  Products(
      {this.stockid,
      this.description,
      this.category,
      this.unitprice,
      this.quantity,
      this.totalprice,
      this.discountAmount,
      this.discountpercent,
      this.disPrice,
      this.discounttype});

  Products.fromJson(Map<String, dynamic> json) {
    stockid = json['stockid'];
    description = json['description'];
    category = json['category'];
    unitprice = json['unitprice'];
    quantity = json['quantity'];
    totalprice = json['totalprice'];
    discountAmount = json['discountAmount'];
    discountpercent = json['discountpercent'];
    disPrice = json['dis_price'];
    discounttype = json['discounttype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stockid'] = this.stockid;
    data['description'] = this.description;
    data['category'] = this.category;
    data['unitprice'] = this.unitprice;
    data['quantity'] = this.quantity;
    data['totalprice'] = this.totalprice;
    data['discountAmount'] = this.discountAmount;
    data['discountpercent'] = this.discountpercent;
    data['dis_price'] = this.disPrice;
    data['discounttype'] = this.discounttype;
    return data;
  }
}
