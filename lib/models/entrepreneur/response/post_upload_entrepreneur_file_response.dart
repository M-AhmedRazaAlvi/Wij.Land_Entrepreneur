// To parse this JSON data, do
//
//     final getEntrepreneurResponse = getEntrepreneurResponseFromJson(jsonString);

import 'dart:convert';

PostUploadEntrepreneurFileResponse postUploadEntrepreneurFileResponseFromJson(String str) => PostUploadEntrepreneurFileResponse.fromJson(json.decode(str));

String postUploadEntrepreneurFileResponseToJson(PostUploadEntrepreneurFileResponse data) => json.encode(data.toJson());

class PostUploadEntrepreneurFileResponse {
    PostUploadEntrepreneurFileResponse({
        this.data,
      required  this.message,
      required  this.status,
    });

    PostUploadEntrepreneurFileResponseData? data;
    String message;
    int status;

    factory PostUploadEntrepreneurFileResponse.fromJson(Map<String, dynamic> json) => PostUploadEntrepreneurFileResponse(
        data: PostUploadEntrepreneurFileResponseData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data":data==null?null: data!.toJson(),
        "message": message,
        "status": status,
    };
}

class PostUploadEntrepreneurFileResponseData {
    PostUploadEntrepreneurFileResponseData({
        this.amount,
      required  this.connectedToWijlandSince,
      required  this.entrepreneurName,
      required  this.focusArea,
      required  this.id,
      required  this.imagePath,
      required  this.legalStructure,
      required  this.postalAddress,
        this.project,
      required  this.relationToWijLand,
      required  this.visitingAddress,
        this.year,
    });

    dynamic amount;
    String connectedToWijlandSince;
    String entrepreneurName;
    String focusArea;
    int id;
    String imagePath;
    String legalStructure;
    String postalAddress;
    dynamic project;
    String relationToWijLand;
    String visitingAddress;
    int? year;

    factory PostUploadEntrepreneurFileResponseData.fromJson(Map<String, dynamic> json) => PostUploadEntrepreneurFileResponseData(
        amount: json["amount"],
        connectedToWijlandSince: json["connected_to_wijland_since"],
        entrepreneurName: json["entrepreneur_name"],
        focusArea: json["focus_area"],
        id: json["id"],
        imagePath: json["image_path"],
        legalStructure: json["legal_structure"],
        postalAddress: json["postal_address"],
        project: json["project"],
        relationToWijLand: json["relation_to_wij_land"],
        visitingAddress: json["visiting_address"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "connected_to_wijland_since": connectedToWijlandSince,
        "entrepreneur_name": entrepreneurName,
        "focus_area": focusArea,
        "id": id,
        "image_path": imagePath,
        "legal_structure": legalStructure,
        "postal_address": postalAddress,
        "project": project,
        "relation_to_wij_land": relationToWijLand,
        "visiting_address": visitingAddress,
        "year": year,
    };
}
