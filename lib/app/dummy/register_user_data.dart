UserDummy getRegisterUserDummy() {
  return UserDummy.fromJson({
    "email": "neang2@gmail.com",
    "displayName": "Noeurn Neang 2",
    "phoneNumber": ""
  });
}

class UserDummy {
  String? email;
  String? displayName;
  String? phoneNumber;

  UserDummy({this.email, this.displayName, this.phoneNumber});

  UserDummy.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    displayName = json['displayName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
