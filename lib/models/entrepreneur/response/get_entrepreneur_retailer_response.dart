class GetentrepreneurRetailerResponse {
  List<Data>? data;
  String? message;
  int? status;

  GetentrepreneurRetailerResponse({this.data, this.message, this.status});

  GetentrepreneurRetailerResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        print('data response is $v');
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? address;
  int? id;
  String? insertedAt;
  OpeningHours? openingHours;
  List<Organizations>? organizations;
  String? phoneNumber;
  String? retailerName;
  String? shop;
  String? updatedAt;
  String? website;
  double? lat, lng;

  Data(
      {this.address,
      this.id,
      this.insertedAt,
      this.openingHours,
      this.organizations,
      this.phoneNumber,
      this.retailerName,
      this.shop,
      this.lat,
      this.lng,
      this.updatedAt,
      this.website});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    lat = json['latitude'];
    lng = json['longitude'];
    openingHours = json['opening_hours'] != null
        ? new OpeningHours.fromJson(json['opening_hours'])
        : null;
    if (json['organizations'] != null) {
      organizations = <Organizations>[];
      json['organizations'].forEach((v) {
        organizations!.add(new Organizations.fromJson(v));
      });
    }
    phoneNumber = json['phone_number'];
    retailerName = json['retailer_name'];
    shop = json['shop'];
    updatedAt = json['updated_at'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['latitude'] = this.lat;
    data['longitude'] = this.lng;
    data['inserted_at'] = this.insertedAt;
    if (this.openingHours != null) {
      data['opening_hours'] = this.openingHours!.toJson();
    }
    if (this.organizations != null) {
      data['organizations'] =
          this.organizations!.map((v) => v.toJson()).toList();
    }
    data['phone_number'] = this.phoneNumber;
    data['retailer_name'] = this.retailerName;
    data['shop'] = this.shop;
    data['updated_at'] = this.updatedAt;
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

class Organizations {
  int? id;
  ImagePath? imagePath;
  String? insertedAt;
  double? latitude;
  double? longitude;
  String? organizationName;
  List<String>? organizationType;
  String? registrationDate;
  String? updatedAt;

  Organizations(
      {this.id,
      this.imagePath,
      this.insertedAt,
      this.latitude,
      this.longitude,
      this.organizationName,
      this.organizationType,
      this.registrationDate,
      this.updatedAt});

  Organizations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'] != null
        ? ImagePath.fromJson(json['image_path'])
        : null;
    insertedAt = json['inserted_at'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    organizationName = json['organization_name'];
    organizationType = json['organization_type'].cast<String>();
    registrationDate = json['registration_date'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (imagePath != null) {
      data['image_path'] = this.imagePath!.toJson();
    }
    data['inserted_at'] = this.insertedAt;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['organization_name'] = this.organizationName;
    data['organization_type'] = this.organizationType;
    data['registration_date'] = this.registrationDate;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ImagePath {
  String? date;
  String? description;
  File? file;
  int? id;
  String? insertedAt;
  String? mime;
  String? path;
  String? title;
  String? updatedAt;

  ImagePath(
      {this.date,
      this.description,
      this.file,
      this.id,
      this.insertedAt,
      this.mime,
      this.path,
      this.title,
      this.updatedAt});

  ImagePath.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    id = json['id'];
    insertedAt = json['inserted_at'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class File {
  String? large;
  String? mini;
  String? original;
  String? thumb;

  File({this.large, this.mini, this.original, this.thumb});

  File.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    mini = json['mini'];
    original = json['original'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['mini'] = this.mini;
    data['original'] = this.original;
    data['thumb'] = this.thumb;
    return data;
  }
}
