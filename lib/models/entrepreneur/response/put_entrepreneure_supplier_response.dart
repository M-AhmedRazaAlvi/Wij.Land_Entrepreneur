import 'dart:convert';

PutEntrepreneurSupplierResponse putEntrepreneurSupplierResponseFromJson(
        String str) =>
    PutEntrepreneurSupplierResponse.fromJson(json.decode(str));

String putEntrepreneurSupplierResponseToJson(
        PutEntrepreneurSupplierResponse request) =>
    json.encode(request.toJson());

class PutEntrepreneurSupplierResponse {
  Data? data;
  String? message;
  int? status;

  PutEntrepreneurSupplierResponse({this.data, this.message, this.status});

  PutEntrepreneurSupplierResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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

  Data(
      {this.connectSince,
      this.farmAutoName,
      this.farmId,
      this.farmRepresentativeName,
      this.id,
      this.insertedAt,
      this.organization,
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
    organization = json['organization'] != null
        ? Organization.fromJson(json['organization'])
        : null;
    organizationId = json['organization_id'];
    updatedAt = json['updated_at'];
    wiRelationType = json['wi_relation_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['connect_since'] = connectSince;
    data['farm_auto_name'] = farmAutoName;
    data['farm_id'] = farmId;
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
  String? imagePath;
  String? insertedAt;
  String? organizationName;
  List<String>? organizationType;
  String? registrationDate;
  String? updatedAt;

  Organization(
      {this.id,
      this.imagePath,
      this.insertedAt,
      this.organizationName,
      this.organizationType,
      this.registrationDate,
      this.updatedAt});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    insertedAt = json['inserted_at'];
    organizationName = json['organization_name'];
    organizationType = json['organization_type'].cast<String>();
    registrationDate = json['registration_date'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_path'] = imagePath;
    data['inserted_at'] = insertedAt;
    data['organization_name'] = organizationName;
    data['organization_type'] = organizationType;
    data['registration_date'] = registrationDate;
    data['updated_at'] = updatedAt;
    return data;
  }
}
