class PersonProfileResponseModel {
  Data? data;
  String? message;
  int? status;

  PersonProfileResponseModel({this.data, this.message, this.status});

  PersonProfileResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? addressMail;
  String? dateAdded;
  String? emailAddress;
  List<FarmOrganization>? farmOrganization;
  String? firstName;
  String? lastName;
  String? organizationType;
  int? personId;
  String? phoneNumberHome;
  String? phoneNumberMobile;
  String? role;

  Data(
      {this.addressMail,
        this.dateAdded,
        this.emailAddress,
        this.farmOrganization,
        this.firstName,
        this.lastName,
        this.organizationType,
        this.personId,
        this.phoneNumberHome,
        this.phoneNumberMobile,
        this.role});

  Data.fromJson(Map<String, dynamic> json) {
    addressMail = json['address_mail'];
    dateAdded = json['date_added'];
    emailAddress = json['email_address'];
    if (json['farm_organization'] != null) {
      farmOrganization = <FarmOrganization>[];
      json['farm_organization'].forEach((v) {
        farmOrganization!.add(new FarmOrganization.fromJson(v));
      });
    }
    firstName = json['first_name'];
    lastName = json['last_name'];
    organizationType = json['organization_type'];
    personId = json['person_id'];
    phoneNumberHome = json['phone_number_home'];
    phoneNumberMobile = json['phone_number_mobile'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_mail'] = this.addressMail;
    data['date_added'] = this.dateAdded;
    data['email_address'] = this.emailAddress;
    if (this.farmOrganization != null) {
      data['farm_organization'] =
          this.farmOrganization!.map((v) => v.toJson()).toList();
    }
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['organization_type'] = this.organizationType;
    data['person_id'] = this.personId;
    data['phone_number_home'] = this.phoneNumberHome;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    data['role'] = this.role;
    return data;
  }
}

class FarmOrganization {
  String? id;
  String? name;

  FarmOrganization({this.id, this.name});

  FarmOrganization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}