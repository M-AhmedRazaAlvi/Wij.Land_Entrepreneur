// To parse this JSON data, do
//
//     final farmComputerFilesDropdown = farmComputerFilesDropdownFromJson(jsonString);

import 'dart:convert';

FarmComputerFilesDropdown farmComputerFilesDropdownFromJson(String str) =>
    FarmComputerFilesDropdown.fromJson(json.decode(str));

String farmComputerFilesDropdownToJson(FarmComputerFilesDropdown data) =>
    json.encode(data.toJson());

class FarmComputerFilesDropdown {
  FarmComputerFilesDropdown({
    this.data,
    this.message,
    this.status,
  });

  List<FarmFilesData>? data;
  String? message;
  int? status;

  factory FarmComputerFilesDropdown.fromJson(Map<String, dynamic> json) =>
      FarmComputerFilesDropdown(
        data: List<FarmFilesData>.from(
            json["data"].map((x) => FarmFilesData.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class FarmFilesData {
  FarmFilesData({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory FarmFilesData.fromJson(Map<String, dynamic> json) => FarmFilesData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
