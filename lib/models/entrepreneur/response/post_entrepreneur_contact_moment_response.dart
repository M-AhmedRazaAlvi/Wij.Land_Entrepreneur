// To parse this JSON data, do
//
//     final postEntrepreneurContactMomentResponse = postEntrepreneurContactMomentResponseFromJson(jsonString);

import 'dart:convert';

PostEntrepreneurContactMomentResponse
    postEntrepreneurContactMomentResponseFromJson(String str) =>
        PostEntrepreneurContactMomentResponse.fromJson(json.decode(str));

String postEntrepreneurContactMomentResponseToJson(
        PostEntrepreneurContactMomentResponse data) =>
    json.encode(data.toJson());

class PostEntrepreneurContactMomentResponse {
  PostEntrepreneurContactMomentResponse({
    this.data,
    this.message,
    this.status,
  });

  PostEntrepreneurContactMomentResponseData? data;
  String? message;
  int? status;

  factory PostEntrepreneurContactMomentResponse.fromJson(
          Map<String, dynamic> json) =>
      PostEntrepreneurContactMomentResponse(
        data: PostEntrepreneurContactMomentResponseData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? {} : data!.toJson(),
        "message": message,
        "status": status,
      };
}

class PostEntrepreneurContactMomentResponseData {
  PostEntrepreneurContactMomentResponseData({
    required this.attendees,
    required this.contactMomentDate,
    required this.contactMomentType,
    required this.contactNotes,
    required this.contactSubject,
    required this.farmName,
    required this.id,
    required this.projectName,
  });

  List<Attendee> attendees;
  String contactMomentDate;
  List<String> contactMomentType;
  String contactNotes;
  String contactSubject;
  dynamic farmName;
  int id;
  dynamic projectName;

  factory PostEntrepreneurContactMomentResponseData.fromJson(
          Map<String, dynamic> json) =>
      PostEntrepreneurContactMomentResponseData(
        attendees: json["attendees"] == null
            ? []
            : List<Attendee>.from(
                json["attendees"].map((x) => Attendee.fromJson(x))),
        contactMomentDate: json["contact_moment_date"],
        contactMomentType: json["contact_moment_type"] == null
            ? []
            : List<String>.from(json["contact_moment_type"].map((x) => x)),
        contactNotes: json["contact_notes"],
        contactSubject: json["contact_subject"],
        farmName: json["farm_name"],
        id: json["id"],
        projectName: json["project_name"],
      );

  Map<String, dynamic> toJson() => {
        "attendees": List<dynamic>.from(attendees.map((x) => x.toJson())),
        "contact_moment_date": contactMomentDate,
        "contact_moment_type":
            List<dynamic>.from(contactMomentType.map((x) => x)),
        "contact_notes": contactNotes,
        "contact_subject": contactSubject,
        "farm_name": farmName,
        "id": id,
        "project_name": projectName,
      };
}

class Attendee {
  Attendee({
    this.data,
    required this.message,
    required this.statusCode,
  });

  AttendeeData? data;
  String message;
  int statusCode;

  factory Attendee.fromJson(Map<String, dynamic> json) => Attendee(
        data: AttendeeData.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? {} : data!.toJson(),
        "message": message,
        "status_code": statusCode,
      };
}

class AttendeeData {
  AttendeeData({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory AttendeeData.fromJson(Map<String, dynamic> json) => AttendeeData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
