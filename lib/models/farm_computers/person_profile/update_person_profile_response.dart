class UpdatePersonProfileResponseModel {
  Data? data;
  String? message;
  int? status;

  UpdatePersonProfileResponseModel({this.data, this.message, this.status});

  UpdatePersonProfileResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? emailAddress;
  String? firstName;
  String? joinDate;
  String? lastName;
  int? personId;
  dynamic? personNFarms;
  String? phoneNumberHome;
  String? phoneNumberMobile;

  Data(
      {this.addressMail,
        this.emailAddress,
        this.firstName,
        this.joinDate,
        this.lastName,
        this.personId,
        this.personNFarms,
        this.phoneNumberHome,
        this.phoneNumberMobile});

  Data.fromJson(Map<String, dynamic> json) {
    addressMail = json['address_mail'];
    emailAddress = json['email_address'];
    firstName = json['first_name'];
    joinDate = json['join_date'];
    lastName = json['last_name'];
    personId = json['person_id'];
    personNFarms = json['person_n_farms'];
    phoneNumberHome = json['phone_number_home'];
    phoneNumberMobile = json['phone_number_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_mail'] = this.addressMail;
    data['email_address'] = this.emailAddress;
    data['first_name'] = this.firstName;
    data['join_date'] = this.joinDate;
    data['last_name'] = this.lastName;
    data['person_id'] = this.personId;
    data['person_n_farms'] = this.personNFarms;
    data['phone_number_home'] = this.phoneNumberHome;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    return data;
  }
}