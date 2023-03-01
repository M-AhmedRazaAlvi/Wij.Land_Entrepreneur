class PersonProfileUpdateRequestModel {
  String? addressMail;
  String? emailAddress;
  String? firstName;
  String? lastName;
  String? personImageId;
  String? phoneNumberHome;
  String? phoneNumberMobile;

  PersonProfileUpdateRequestModel(
      {this.addressMail,
        this.emailAddress,
        this.firstName,
        this.lastName,
        this.personImageId,
        this.phoneNumberHome,
        this.phoneNumberMobile});

  PersonProfileUpdateRequestModel.fromJson(Map<String, dynamic> json) {
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