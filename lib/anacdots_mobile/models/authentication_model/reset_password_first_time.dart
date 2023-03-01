class ResetPasswordFirstTime {
  Data? data;
  String? message;
  int? status;

  ResetPasswordFirstTime({this.data, this.message, this.status});

  ResetPasswordFirstTime.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  bool? active;
  bool? autoGeneratePass;
  String? deletedAt;
  String? email;
  int? id;
  String? insertedAt;
  String? name;
  bool? passwordSkip;
  String? person;
  int? personId;
  String? updatedAt;

  Data(
      {this.active,
      this.autoGeneratePass,
      this.deletedAt,
      this.email,
      this.id,
      this.insertedAt,
      this.name,
      this.passwordSkip,
      this.person,
      this.personId,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    autoGeneratePass = json['auto_generate_pass'];
    deletedAt = json['deleted_at'];
    email = json['email'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    passwordSkip = json['password_skip'];
    person = json['person'];
    personId = json['person_id'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['auto_generate_pass'] = this.autoGeneratePass;
    data['deleted_at'] = this.deletedAt;
    data['email'] = this.email;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['password_skip'] = this.passwordSkip;
    data['person'] = this.person;
    data['person_id'] = this.personId;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
