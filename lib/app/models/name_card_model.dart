class NameCardModel {
  int? id;
  String? type;
  int? categoryID;
  int? templateID;
  String? languageID;
  String? firstName;
  String? lastName;
  String? mobile;
  String? phone;
  String? fax;
  String? email;
  String? company;
  String? position;
  String? street;
  String? city;
  String? zip;
  String? state;
  String? country;
  String? website;
  String? fullName;
  String? address;
  String? logoURL;
  int? status;

  NameCardModel(
      {this.id,
      this.type,
      this.categoryID,
      this.templateID,
      this.languageID,
      this.firstName,
      this.lastName,
      this.mobile,
      this.phone,
      this.fax,
      this.email,
      this.company,
      this.position,
      this.street,
      this.city,
      this.zip,
      this.state,
      this.country,
      this.website,
      this.fullName,
      this.address,
      this.logoURL,
      this.status});

  NameCardModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    type = json['Type'];
    categoryID = json['CategoryID'];
    templateID = json['TemplateID'];
    languageID = json['LanguageID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    mobile = json['Mobile'];
    phone = json['Phone'];
    fax = json['Fax'];
    email = json['Email'];
    company = json['Company'];
    position = json['Position'];
    street = json['Street'];
    city = json['City'];
    zip = json['Zip'];
    state = json['State'];
    country = json['Country'];
    website = json['Website'];
    status = json['Status'];
    logoURL = json['LogoURL'];
    fullName = '$firstName $lastName';
    address = '$street, $city, $country';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['categoryID'] = categoryID;
    data['templateID'] = templateID;
    data['languageID'] = languageID;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    data['phone'] = phone;
    data['fax'] = fax;
    data['email'] = email;
    data['company'] = company;
    data['position'] = position;
    data['street'] = street;
    data['city'] = city;
    data['zip'] = zip;
    data['state'] = state;
    data['country'] = country;
    data['website'] = website;
    data['status'] = status;
    data['fullName'] = fullName;
    data['address'] = address;
    data['logoURL'] = logoURL;
    return data;
  }
}
