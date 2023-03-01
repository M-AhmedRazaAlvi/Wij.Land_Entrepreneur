class PostEntrepreneurRetailerRequest {
  String? address;
  OpeningHours? openingHours;
  String? phoneNumber;
  String? retailerName;
  String? shop;
  String? website;

  PostEntrepreneurRetailerRequest(
      {this.address = '',
      this.openingHours,
      this.phoneNumber = '',
      this.retailerName = '',
      this.shop = '',
      this.website = ''});

  PostEntrepreneurRetailerRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    openingHours = json['opening_hours'] != null
        ? OpeningHours.fromJson(json['opening_hours'])
        : null;
    phoneNumber = json['phone_number'];
    retailerName = json['retailer_name'];
    shop = json['shop'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    if (openingHours != null) {
      data['opening_hours'] = openingHours!.toJson();
    }
    data['phone_number'] = phoneNumber;
    data['retailer_name'] = retailerName;
    data['shop'] = shop;
    data['website'] = website;
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
  bool? isactive;

  OpeningHours(
      {this.fridayClose = '',
      this.fridayOpen = '',
      this.mondayClose = '',
      this.mondayOpen = '',
      this.saturdayClose = '',
      this.saturdayOpen = '',
      this.sundayClose = '',
      this.sundayOpen = '',
      this.thursdayClose = '',
      this.thursdayOpen = '',
      this.tuesdayClose = '',
      this.tuesdayOpen = '',
      this.wednesdayClose = '',
      this.wednesdayOpen = ''
      });

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['friday_close'] = fridayClose;
    data['friday_open'] = fridayOpen;
    data['monday_close'] = mondayClose;
    data['monday_open'] = mondayOpen;
    data['saturday_close'] = saturdayClose;
    data['saturday_open'] = saturdayOpen;
    data['sunday_close'] = sundayClose;
    data['sunday_open'] = sundayOpen;
    data['thursday_close'] = thursdayClose;
    data['thursday_open'] = thursdayOpen;
    data['tuesday_close'] = tuesdayClose;
    data['tuesday_open'] = tuesdayOpen;
    data['wednesday_close'] = wednesdayClose;
    data['wednesday_open'] = wednesdayOpen;
    return data;
  }
}
