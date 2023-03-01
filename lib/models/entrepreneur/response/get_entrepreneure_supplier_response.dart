// To parse this JSON data, do
//
//     final getEntrepreneurSupplierResponse = getEntrepreneurSupplierResponseFromJson(jsonString);

import 'dart:convert';

GetEntrepreneurSupplierResponse getEntrepreneurSupplierResponseFromJson(
        String str) =>
    GetEntrepreneurSupplierResponse.fromJson(json.decode(str));

String getEntrepreneurSupplierResponseToJson(
        GetEntrepreneurSupplierResponse data) =>
    json.encode(data.toJson());

class GetEntrepreneurSupplierResponse {
  GetEntrepreneurSupplierResponse({
    this.data,
    this.message,
    this.status,
  });

  List<Datum>? data;
  String? message;
  int? status;

  factory GetEntrepreneurSupplierResponse.fromJson(Map<String, dynamic> json) =>
      GetEntrepreneurSupplierResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Datum {
  Datum({
    this.connectSince,
    this.farmAutoName,
    this.farmId,
    this.farmRepresentativeName,
    this.id,
    this.insertedAt,
    this.organization,
    this.organizationId,
    this.updatedAt,
    this.wiRelationType,
  });

  DateTime? connectSince;
  String? farmAutoName;
  int? farmId;
  String? farmRepresentativeName;
  int? id;
  DateTime? insertedAt;
  Organization? organization;
  int? organizationId;
  DateTime? updatedAt;
  String? wiRelationType;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        connectSince: json["connect_since"] == null
            ? null
            : DateTime.parse(json["connect_since"]),
        farmAutoName: json["farm_auto_name"],
        farmId: json["farm_id"],
        farmRepresentativeName: json["farm_representative_name"],
        id: json["id"],
        insertedAt: DateTime.parse(json["inserted_at"]),
        organization: Organization.fromJson(json["organization"]),
        organizationId: json["organization_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        wiRelationType: json["wi_relation_type"],
      );

  Map<String, dynamic> toJson() => {
        "connect_since": connectSince == null
            ? null
            : "${connectSince!.year.toString().padLeft(4, '0')}-${connectSince!.month.toString().padLeft(2, '0')}-${connectSince!.day.toString().padLeft(2, '0')}",
        "farm_auto_name": farmAutoName,
        "farm_id": farmId,
        "farm_representative_name": farmRepresentativeName,
        "id": id,
        "inserted_at": insertedAt!.toIso8601String(),
        "organization": organization!.toJson(),
        "organization_id": organizationId,
        "updated_at": updatedAt!.toIso8601String(),
        "wi_relation_type": wiRelationType,
      };
}

class Organization {
  Organization({
    this.id,
    this.imagePath,
    this.insertedAt,
    this.organizationName,
    this.organizationType,
    this.registrationDate,
    this.updatedAt,
  });

  int? id;
  dynamic imagePath;
  DateTime? insertedAt;
  String? organizationName;
  List<String>? organizationType;
  DateTime? registrationDate;
  DateTime? updatedAt;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["id"],
        imagePath: json["image_path"],
        insertedAt: DateTime.parse(json["inserted_at"]),
        organizationName: json["organization_name"],
        organizationType:
            List<String>.from(json["organization_type"].map((x) => x)),
        registrationDate: DateTime.parse(json["registration_date"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_path": imagePath,
        "inserted_at": insertedAt!.toIso8601String(),
        "organization_name": organizationName,
        "organization_type":
            List<dynamic>.from(organizationType!.map((x) => x)),
        "registration_date": registrationDate!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
