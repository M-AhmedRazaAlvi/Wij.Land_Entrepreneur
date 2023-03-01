// To parse this JSON data, do
//
//     final getFarmComputerProjectEventsResponce = getFarmComputerProjectEventsResponceFromJson(jsonString);

import 'dart:convert';

GetFarmComputerProjectEventsResponce
    getFarmComputerProjectEventsResponceFromJson(String str) =>
        GetFarmComputerProjectEventsResponce.fromJson(json.decode(str));

String getFarmComputerProjectEventsResponceToJson(
        GetFarmComputerProjectEventsResponce data) =>
    json.encode(data.toJson());

class GetFarmComputerProjectEventsResponce {
  GetFarmComputerProjectEventsResponce({
    this.data,
    this.message,
    this.status,
  });

  Data? data;
  String? message;
  int? status;

  factory GetFarmComputerProjectEventsResponce.fromJson(
          Map<String, dynamic> json) =>
      GetFarmComputerProjectEventsResponce(
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
  Data({
    this.pastEvents,
    this.upcomingEvents,
  });

  List<Event>? pastEvents;
  List<Event>? upcomingEvents;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pastEvents:
            List<Event>.from(json["past_events"].map((x) => Event.fromJson(x))),
        upcomingEvents: List<Event>.from(
            json["upcoming_events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "past_events": List<dynamic>.from(pastEvents!.map((x) => x.toJson())),
        "upcoming_events":
            List<dynamic>.from(upcomingEvents!.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.date,
    this.desctiption,
    this.eventPicture,
    this.id,
    this.insertedAt,
    this.location,
    this.name,
    this.rsvpAnswer,
    this.updatedAt,
  });

  dynamic date;
  String? desctiption;
  EventPicture? eventPicture;
  int? id;
  dynamic insertedAt;
  String? location;
  String? name;
  List<dynamic>? rsvpAnswer;
  dynamic updatedAt;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        desctiption: json["desctiption"] == null ? null : json["desctiption"],
        eventPicture: json["event_picture"] == null
            ? null
            : EventPicture.fromJson(json["event_picture"]),
        id: json["id"],
        insertedAt: DateTime.parse(json["inserted_at"]),
        location: json["location"] == null ? null : json["location"],
        name: json["name"],
        rsvpAnswer: List<dynamic>.from(json["rsvp_answer"].map((x) => x)),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "desctiption": desctiption == null ? null : desctiption,
        "event_picture": eventPicture == null ? null : eventPicture!.toJson(),
        "id": id,
        "inserted_at": insertedAt!.toIso8601String(),
        "location": location == null ? null : location,
        "name": name,
        "rsvp_answer": List<dynamic>.from(rsvpAnswer!.map((x) => x)),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class EventPicture {
  EventPicture({
    this.id,
    this.mime,
    this.path,
    this.title,
  });

  int? id;
  String? mime;
  String? path;
  String? title;

  factory EventPicture.fromJson(Map<String, dynamic> json) => EventPicture(
        id: json["id"],
        mime: json["mime"],
        path: json["path"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mime": mime,
        "path": path,
        "title": title,
      };
}
