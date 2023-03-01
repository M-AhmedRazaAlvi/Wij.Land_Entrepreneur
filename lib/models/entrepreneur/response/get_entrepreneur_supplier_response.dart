import 'dart:convert';

GetEntrepreneurSupplierResponse getEntrepreneurSupplierResponseFromJson(String str) => GetEntrepreneurSupplierResponse.fromJson(json.decode(str));

String getEntrepreneurSupplierResponseToJson(GetEntrepreneurSupplierResponse data) => json.encode(data.toJson());

class GetEntrepreneurSupplierResponse {
  List<Data>? data=[];
  String? message;
  int? status;

  GetEntrepreneurSupplierResponse({this.data, this.message, this.status});

  GetEntrepreneurSupplierResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? connectSince;
  String? farmAutoName;
  int? farmId;
  String? farmRepresentativeName;
  int? id;
  String? insertedAt;
  Organization? organization;
  int? organizationId;
  String? updatedAt;
  String? wiRelationType;
  String? phoneNum;
  double? lat,lng;

  Data(
      {this.connectSince,
      this.farmAutoName,
      this.farmId,
      this.farmRepresentativeName,
      this.id,
      this.insertedAt,
      this.organization,
      this.phoneNum,
        this.lat,
        this.lng,
      this.organizationId,
      this.updatedAt,
      this.wiRelationType});

  Data.fromJson(Map<String, dynamic> json) {
    connectSince = json['connect_since'];
    farmAutoName = json['farm_auto_name'];
    farmId = json['farm_id'];
    farmRepresentativeName = json['farm_representative_name'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    phoneNum = json['phone_number'];
    organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
    organizationId = json['organization_id'];
    updatedAt = json['updated_at'];
    lat = json['latitude'];
    lng = json['longitude'];
    wiRelationType = json['wi_relation_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['connect_since'] = connectSince;
    data['farm_auto_name'] = farmAutoName;
    data['farm_id'] = farmId;
    data['latitude'] = lat;
    data['longitude'] = lng;
    data['phone_number'] = phoneNum;
    data['farm_representative_name'] = farmRepresentativeName;
    data['id'] = id;
    data['inserted_at'] = insertedAt;
    if (organization != null) {
      data['organization'] = organization!.toJson();
    }
    data['organization_id'] = organizationId;
    data['updated_at'] = updatedAt;
    data['wi_relation_type'] = wiRelationType;
    return data;
  }
}



class Organization {
  int? id;
  ImagePath? imagePath;
  String? insertedAt;
  String? organizationName;
  List<String>? organizationType;
  String? registrationDate;
  String? updatedAt;

  Organization({this.id, this.imagePath, this.insertedAt, this.organizationName, this.organizationType, this.registrationDate, this.updatedAt});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'] != null
        ? ImagePath.fromJson(json['image_path'])
        : null;
    insertedAt = json['inserted_at'];
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
    data['inserted_at'] = insertedAt;
    data['organization_name'] = organizationName;
    data['organization_type'] = organizationType;
    data['registration_date'] = registrationDate;
    data['updated_at'] = updatedAt;
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

