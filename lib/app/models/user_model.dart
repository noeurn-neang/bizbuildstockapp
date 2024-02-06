class UserModel {
  int? id;
  String? username;
  String? gender;
  String? email;
  String? fullName;
  String? tel;
  String? companyCode;
  String? photoURL;
  int? fullaccess;

  UserModel(
      {this.id,
      this.username,
      this.gender,
      this.email,
      this.fullName,
      this.tel,
      this.companyCode,
      this.fullaccess,
      this.photoURL});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    gender = json['gender'];
    email = json['email'];
    fullName = json['fullName'];
    tel = json['tel'];
    companyCode = json['companyCode'];
    photoURL = json['photoURL'];
    fullaccess = int.parse(json['fullaccess']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['gender'] = gender;
    data['email'] = email;
    data['fullName'] = fullName;
    data['tel'] = tel;
    data['companyCode'] = companyCode;
    data['photoURL'] = photoURL;
    data['fullaccess'] = fullaccess;
    return data;
  }
}
