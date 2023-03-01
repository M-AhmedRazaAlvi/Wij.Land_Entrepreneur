class UpdateEntrepreneurRetailerResponse {
  String? address;
  OpeningHours? openingHours;
  String? phoneNumber;
  String? retailerName;
  String? shop;
  String? website;

  UpdateEntrepreneurRetailerResponse(
      {this.address,
      this.openingHours,
      this.phoneNumber,
      this.retailerName,
      this.shop,
      this.website});

  UpdateEntrepreneurRetailerResponse.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    openingHours = json['opening_hours'] != null
        ? new OpeningHours.fromJson(json['opening_hours'])
        : null;
    phoneNumber = json['phone_number'];
    retailerName = json['retailer_name'];
    shop = json['shop'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    if (this.openingHours != null) {
      data['opening_hours'] = this.openingHours!.toJson();
    }
    data['phone_number'] = this.phoneNumber;
    data['retailer_name'] = this.retailerName;
    data['shop'] = this.shop;
    data['website'] = this.website;
    return data;
  }
}

class OpeningHours {
  String? fridayClose;
  String? fridayOpen;
  String? mondayClose;
  String? mondayOpen;
  String? saturdayClose;
  String? saturdayOpen;
  String? sundayClose;
  String? sundayOpen;
  String? thursdayClose;
  String? thursdayOpen;
  String? tuesdayClose;
  String? tuesdayOpen;
  String? wednesdayClose;
  String? wednesdayOpen;

  OpeningHours(
      {this.fridayClose,
      this.fridayOpen,
      this.mondayClose,
      this.mondayOpen,
      this.saturdayClose,
      this.saturdayOpen,
      this.sundayClose,
      this.sundayOpen,
      this.thursdayClose,
      this.thursdayOpen,
      this.tuesdayClose,
      this.tuesdayOpen,
      this.wednesdayClose,
      this.wednesdayOpen});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    fridayClose = json['friday_close'];
    fridayOpen = json['friday_open'];
    mondayClose = json['monday_close'];
    mondayOpen = json['monday_open'];
    saturdayClose = json['saturday_close'];
    saturdayOpen = json['saturday_open'];
    sundayClose = json['sunday_close'];
    sundayOpen = json['sunday_open'];
    thursdayClose = json['thursday_close'];
    thursdayOpen = json['thursday_open'];
    tuesdayClose = json['tuesday_close'];
    tuesdayOpen = json['tuesday_open'];
    wednesdayClose = json['wednesday_close'];
    wednesdayOpen = json['wednesday_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['friday_close'] = this.fridayClose;
    data['friday_open'] = this.fridayOpen;
    data['monday_close'] = this.mondayClose;
    data['monday_open'] = this.mondayOpen;
    data['saturday_close'] = this.saturdayClose;
    data['saturday_open'] = this.saturdayOpen;
    data['sunday_close'] = this.sundayClose;
    data['sunday_open'] = this.sundayOpen;
    data['thursday_close'] = this.thursdayClose;
    data['thursday_open'] = this.thursdayOpen;
    data['tuesday_close'] = this.tuesdayClose;
    data['tuesday_open'] = this.tuesdayOpen;
    data['wednesday_close'] = this.wednesdayClose;
    data['wednesday_open'] = this.wednesdayOpen;
    return data;
  }
}
