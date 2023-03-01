// To parse this JSON data, do
//
//     final postUploadEntrepreneurPersonFileResponse = postUploadEntrepreneurPersonFileResponseFromJson(jsonString);

import 'dart:convert';

import 'package:wij_land/models/entrepreneur/role.dart';

PostUploadEntrepreneurPersonFileResponse postUploadEntrepreneurPersonFileResponseFromJson(String str) => PostUploadEntrepreneurPersonFileResponse.fromJson(json.decode(str));

String postUploadEntrepreneurPersonFileResponseToJson(PostUploadEntrepreneurPersonFileResponse data) => json.encode(data.toJson());

class PostUploadEntrepreneurPersonFileResponse {
    PostUploadEntrepreneurPersonFileResponse({
        this.data,
    required    this.message,
     required   this.status,
    });

    PostUploadEntrepreneurPersonFileResponseData? data;
    String message;
    int status;

    factory PostUploadEntrepreneurPersonFileResponse.fromJson(Map<String, dynamic> json) => PostUploadEntrepreneurPersonFileResponse(
        data: PostUploadEntrepreneurPersonFileResponseData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data":data==null?null: data!.toJson(),
        "message": message,
        "status": status,
    };
}

class PostUploadEntrepreneurPersonFileResponseData {
    PostUploadEntrepreneurPersonFileResponseData({
    required    this.email,
    required    this.id,
    required    this.imagePath,
    required    this.name,
    required    this.phone,
    required    this.role,
    });

    String email;
    int id;
    String imagePath;
    String name;
    String phone;
    List<Role> role;

    factory PostUploadEntrepreneurPersonFileResponseData.fromJson(Map<String, dynamic> json) => PostUploadEntrepreneurPersonFileResponseData(
        email: json["email"],
        id: json["id"],
        imagePath: json["image_path"],
        name: json["name"],
        phone: json["phone"],
        role: List<Role>.from(json["role"].map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "image_path": imagePath,
        "name": name,
        "phone": phone,
        "role": List<dynamic>.from(role.map((x) => x.toJson())),
    };
}

