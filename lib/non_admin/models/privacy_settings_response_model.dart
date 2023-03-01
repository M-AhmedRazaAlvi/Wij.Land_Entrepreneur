// To parse this JSON data, do
//
//     final privacySettingsResponseModel = privacySettingsResponseModelFromJson(jsonString);

import 'dart:convert';

PrivacySettingsResponseModel privacySettingsResponseModelFromJson(String str) => PrivacySettingsResponseModel.fromJson(json.decode(str));

String privacySettingsResponseModelToJson(PrivacySettingsResponseModel data) => json.encode(data.toJson());

class PrivacySettingsResponseModel {
  PrivacySettingsResponseModel({
    this.dateMapUpdated,
    this.isPublic,
    this.latitude,
    this.longitude,
    this.updatedBy,
  });

  String? dateMapUpdated;
  bool? isPublic;
  double? latitude;
  double? longitude;
  String? updatedBy;

  factory PrivacySettingsResponseModel.fromJson(Map<String, dynamic> json) => PrivacySettingsResponseModel(
    dateMapUpdated: json["date_map_updated"],
    isPublic: json["is_public"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "date_map_updated": dateMapUpdated,
    "is_public": isPublic,
    "latitude": latitude,
    "longitude": longitude,
    "updated_by": updatedBy,
  };
}
