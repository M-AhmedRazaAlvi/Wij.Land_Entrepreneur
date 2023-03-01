import 'dart:convert';

MediaRequestModel mediarequestmodelFromJson(String str) =>
    MediaRequestModel.fromJson(json.decode(str));

String mediarequestmodelToJson(MediaRequestModel data) =>
    json.encode(data.toJson());

class MediaRequestModel {
  MediaRequestModel({
    this.data,
    this.message,
    this.status,
  });

  List<Datum>? data;
  String? message;
  int? status;

  factory MediaRequestModel.fromJson(Map<String, dynamic> json) =>
      MediaRequestModel(
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
    this.id,
    this.path,
    this.title,
  });

  int? id;
  String? path;
  String? title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        path: json["path"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "title": title,
      };
}
