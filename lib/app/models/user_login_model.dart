class UserLoginModel {
  String? userid;
  String? password;

  UserLoginModel({this.userid, this.password});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['password'] = this.password;
    return data;
  }
}