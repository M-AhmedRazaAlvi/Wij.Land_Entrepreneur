class PostEntrepreneurPersonRequest {
  String? comment;
  String? date;
  Person? person;
  String? position;
  List<String>? role;

  PostEntrepreneurPersonRequest(
      {this.comment, this.date, this.person, this.position, this.role});

  PostEntrepreneurPersonRequest.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    date = json['date'];
    person =
    json['person'] != null ? new Person.fromJson(json['person']) : null;
    position = json['position'];
    role = json['role'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['date'] = this.date;
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    data['position'] = this.position;
    data['role'] = this.role;
    return data;
  }
}

class Person {
  String? addressMail;
  String? emailAddress;
  String? firstName;
  String? lastName;
  String? personImageId;
  String? phoneNumberHome;
  String? phoneNumberMobile;

  Person(
      {this.addressMail,
        this.emailAddress,
        this.firstName,
        this.lastName,
        this.personImageId,
        this.phoneNumberHome,
        this.phoneNumberMobile});

  Person.fromJson(Map<String, dynamic> json) {
    addressMail = json['address_mail'];
    emailAddress = json['email_address'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    personImageId = json['person_image_id'];
    phoneNumberHome = json['phone_number_home'];
    phoneNumberMobile = json['phone_number_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_mail'] = this.addressMail;
    data['email_address'] = this.emailAddress;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['person_image_id'] = this.personImageId;
    data['phone_number_home'] = this.phoneNumberHome;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    return data;
  }
}