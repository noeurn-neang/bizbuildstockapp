class CredentialModel {
  String? message;
  String? token;
  List<String>? allowedlocs;
  String? defloc;
  String? fullaccess;

  CredentialModel(
      {this.message,
      this.token,
      this.allowedlocs,
      this.defloc,
      this.fullaccess});

  CredentialModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    allowedlocs = json['allowedlocs'].cast<String>();
    defloc = json['defloc'];
    fullaccess = json['fullaccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['allowedlocs'] = this.allowedlocs;
    data['defloc'] = this.defloc;
    data['fullaccess'] = this.fullaccess;
    return data;
  }
}