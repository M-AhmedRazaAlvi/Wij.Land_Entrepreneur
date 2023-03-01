// To parse this JSON data, do
//
//     final postEntrepreneurContactSubjectResponse = postEntrepreneurContactSubjectResponseFromJson(jsonString);

import 'dart:convert';

PostEntrepreneurContactSubjectResponse
    postEntrepreneurContactSubjectResponseFromJson(String str) =>
        PostEntrepreneurContactSubjectResponse.fromJson(json.decode(str));

String postEntrepreneurContactSubjectResponseToJson(
        PostEntrepreneurContactSubjectResponse data) =>
    json.encode(data.toJson());

class PostEntrepreneurContactSubjectResponse {
  PostEntrepreneurContactSubjectResponse({
    this.data,
    this.message,
    this.status,
  });

  PostEntrepreneurContactSubjectResponseData? data;
  String? message;
  int? status;

  factory PostEntrepreneurContactSubjectResponse.fromJson(
          Map<String, dynamic> json) =>
      PostEntrepreneurContactSubjectResponse(
        data: PostEntrepreneurContactSubjectResponseData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message,
        "status": status,
      };
}

class PostEntrepreneurContactSubjectResponseData {
  PostEntrepreneurContactSubjectResponseData({
    required this.description,
    required this.id,
    required this.subject,
  });

  String description;
  int id;
  List<String> subject;

  factory PostEntrepreneurContactSubjectResponseData.fromJson(
          Map<String, dynamic> json) =>
      PostEntrepreneurContactSubjectResponseData(
        description: json["description"],
        id: json["id"],
        subject: List<String>.from(json["subject"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "subject": List<dynamic>.from(subject.map((x) => x)),
      };
}
