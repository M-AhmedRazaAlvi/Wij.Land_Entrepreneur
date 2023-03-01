// To parse this JSON data, do
//
//     final deleteEntrepreneurSupplierResponse = deleteEntrepreneurSupplierResponseFromJson(jsonString);

import 'dart:convert';

DeleteEntrepreneurSupplierResponse deleteEntrepreneurSupplierResponseFromJson(
        String str) =>
    DeleteEntrepreneurSupplierResponse.fromJson(json.decode(str));

String deleteEntrepreneurSupplierResponseToJson(
        DeleteEntrepreneurSupplierResponse data) =>
    json.encode(data.toJson());

class DeleteEntrepreneurSupplierResponse {
  DeleteEntrepreneurSupplierResponse({
    this.data,
    this.message,
    this.status,
  });

  Data? data;
  String? message;
  int? status;

  factory DeleteEntrepreneurSupplierResponse.fromJson(
          Map<String, dynamic> json) =>
      DeleteEntrepreneurSupplierResponse(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
