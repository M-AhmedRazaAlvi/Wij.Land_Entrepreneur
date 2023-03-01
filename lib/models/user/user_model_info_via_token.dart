class UserInfoModelInfoViaToken {
  bool? active;
  String? email;
  int? id;
  String? insertedAt;
  String? locale;
  String? name;
  int? personId;
  PersonInfo? personInfo;
  String? updatedAt;

  UserInfoModelInfoViaToken(
      {this.active,
        this.email,
        this.id,
        this.insertedAt,
        this.locale,
        this.name,
        this.personId,
        this.personInfo,
        this.updatedAt});

  UserInfoModelInfoViaToken.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    email = json['email'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    locale = json['locale'];
    name = json['name'];
    personId = json['person_id'];
    personInfo = json['person_info'] != null
        ? new PersonInfo.fromJson(json['person_info'])
        : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['email'] = this.email;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['person_id'] = this.personId;
    if (this.personInfo != null) {
      data['person_info'] = this.personInfo!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PersonInfo {
  String? emailAddress;
  String? firstName;
  int? id;
  String? lastName;
  String? phoneNumberMobile;

  PersonInfo(
      {this.emailAddress,
        this.firstName,
        this.id,
        this.lastName,
        this.phoneNumberMobile});

  PersonInfo.fromJson(Map<String, dynamic> json) {
    emailAddress = json['email_address'];
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
    phoneNumberMobile = json['phone_number_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email_address'] = this.emailAddress;
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    return data;
  }
}
