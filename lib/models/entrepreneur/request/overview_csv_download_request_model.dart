class OverviewCSVDownloadRequestModel {
  String? prefixEntity;
  Property? property;
  List<int>? selectedIds;

  OverviewCSVDownloadRequestModel(
      {this.prefixEntity, this.property, this.selectedIds});

  OverviewCSVDownloadRequestModel.fromJson(Map<String, dynamic> json) {
    prefixEntity = json['prefix_entity'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    selectedIds = json['selected_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prefix_entity'] = this.prefixEntity;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    data['selected_ids'] = this.selectedIds;
    return data;
  }
}

class Property {
  String? personFirstName;
  String? personLastName;
  String? personEmailAddress;
  String? personPhoneNumberMobile;
  String? personPhoneNumberHome;

  Property(
      {this.personFirstName,
        this.personLastName,
        this.personEmailAddress,
        this.personPhoneNumberMobile,
        this.personPhoneNumberHome});

  Property.fromJson(Map<String, dynamic> json) {
    personFirstName = json['person_first_name'];
    personLastName = json['person_last_name'];
    personEmailAddress = json['person_email_address'];
    personPhoneNumberMobile = json['person_phone_number_mobile'];
    personPhoneNumberHome = json['person_phone_number_home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_first_name'] = this.personFirstName;
    data['person_last_name'] = this.personLastName;
    data['person_email_address'] = this.personEmailAddress;
    data['person_phone_number_mobile'] = this.personPhoneNumberMobile;
    data['person_phone_number_home'] = this.personPhoneNumberHome;
    return data;
  }
}