// class GetFarmComputerProjectEventsResponse {
//   Data? data;
//   String? message;
//   int? status;
//   Error? error;
//
//   GetFarmComputerProjectEventsResponse({this.data, this.message, this.status, this.error});
//
//   GetFarmComputerProjectEventsResponse.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//     status = json['status'];
//     error = json['error'] != null ? new Error.fromJson(json['error']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['status'] = this.status;
//     if (error != null) {
//       data['error'] = this.error!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   Data({
//     this.pastEvents,
//     this.upcomingEvents,
//   });
//
//   List<Event>? pastEvents;
//   List<Event>? upcomingEvents;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         pastEvents:
//             json["past_events"].toString().isNotEmpty ? List<Event>.from(json["past_events"].map((x) => Event.fromJson(x))) : json["past_events"],
//         upcomingEvents: json["upcoming_events"].toString().isNotEmpty
//             ? List<Event>.from(json["upcoming_events"].map((x) => Event.fromJson(x)))
//             : json["upcoming_events"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "past_events": List<dynamic>.from(pastEvents!.map((x) => x.toJson())),
//         "upcoming_events": List<dynamic>.from(upcomingEvents!.map((x) => x.toJson())),
//       };
// }
//
// class Event {
//   Event({
//     this.date,
//     this.desctiption,
//     this.eventPicture,
//     this.id,
//     this.insertedAt,
//     this.location,
//     this.name,
//     this.rsvpAnswer,
//     this.updatedAt,
//   });
//
//   DateTime? date;
//   String? desctiption;
//   EventPicture? eventPicture;
//   int? id;
//   DateTime? insertedAt;
//   String? location;
//   String? name;
//   List<dynamic>? rsvpAnswer;
//   DateTime? updatedAt;
//
//   factory Event.fromJson(Map<String, dynamic> json) => Event(
//         date: json["date"] == null ? null : DateTime.parse(json["date"]),
//         desctiption: json["desctiption"] == null ? null : json["desctiption"],
//         eventPicture: json["event_picture"] == null ? null : EventPicture.fromJson(json["event_picture"]),
//         id: json["id"],
//         insertedAt: DateTime.parse(json["inserted_at"]),
//         location: json["location"] == null ? null : json["location"],
//         name: json["name"],
//         rsvpAnswer: List<dynamic>.from(json["rsvp_answer"].map((x) => x)),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "date": date == null
//             ? null
//             : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//         "desctiption": desctiption == null ? null : desctiption,
//         "event_picture": eventPicture == null ? null : eventPicture!.toJson(),
//         "id": id,
//         "inserted_at": insertedAt!.toIso8601String(),
//         "location": location == null ? null : location,
//         "name": name,
//         "rsvp_answer": List<dynamic>.from(rsvpAnswer!.map((x) => x)),
//         "updated_at": updatedAt!.toIso8601String(),
//       };
// }
//
// class EventPicture {
//   EventPicture({
//     this.id,
//     this.mime,
//     this.path,
//     this.title,
//   });
//
//   int? id;
//   String? mime;
//   String? path;
//   String? title;
//
//   factory EventPicture.fromJson(Map<String, dynamic> json) => EventPicture(
//         id: json["id"],
//         mime: json["mime"],
//         path: json["path"],
//         title: json["title"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "mime": mime,
//         "path": path,
//         "title": title,
//       };
// }
class GetFarmComputerProjectEventsResponse {
  Data? data;
  String? message;
  int? status;
  Error? error;

  GetFarmComputerProjectEventsResponse(
      {this.data, this.message, this.status, this.error});

  GetFarmComputerProjectEventsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  List<PastEvents>? pastEvents;
  List<UpcomingEvents>? upcomingEvents;

  Data({this.pastEvents, this.upcomingEvents});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['past_events'] != null) {
      pastEvents = <PastEvents>[];
      json['past_events'].forEach((v) {
        pastEvents!.add(new PastEvents.fromJson(v));
      });
    }
    if (json['upcoming_events'] != null) {
      upcomingEvents = <UpcomingEvents>[];
      json['upcoming_events'].forEach((v) {
        upcomingEvents!.add(new UpcomingEvents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pastEvents != null) {
      data['past_events'] = this.pastEvents!.map((v) => v.toJson()).toList();
    }
    if (this.upcomingEvents != null) {
      data['upcoming_events'] =
          this.upcomingEvents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PastEvents {
  String? attendedMode;
  String? date;
  String? desctiption;
  List<String>? eventMode;
  EventPicture? eventPicture;
  String? eventStartTime;
  String? eventsEndsTime;
  int? id;
  String? insertedAt;
  String? location;
  String? name;
  List<String>? rsvpAnswer;
  String? updatedAt;

  PastEvents(
      {this.attendedMode,
      this.date,
      this.desctiption,
      this.eventMode,
      this.eventPicture,
      this.eventStartTime,
      this.eventsEndsTime,
      this.id,
      this.insertedAt,
      this.location,
      this.name,
      this.rsvpAnswer,
      this.updatedAt});

  PastEvents.fromJson(Map<String, dynamic> json) {
    attendedMode = json['attended_mode'];
    date = json['date'];
    desctiption = json['desctiption'];
    if (json['event_mode'] != null) {
      eventMode = json['event_mode'].cast<String>();
    }

    //eventMode = json['event_mode'].cast<String>();
    eventPicture = json['event_picture'] != null
        ? new EventPicture.fromJson(json['event_picture'])
        : null;
    eventStartTime = json['event_start_time'];
    eventsEndsTime = json['events_ends_time'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    location = json['location'];
    name = json['name'];
    rsvpAnswer = json['rsvp_answer'].cast<String>();
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attended_mode'] = this.attendedMode;
    data['date'] = this.date;
    data['desctiption'] = this.desctiption;
    data['event_mode'] = this.eventMode;
    if (this.eventPicture != null) {
      data['event_picture'] = this.eventPicture!.toJson();
    }
    data['event_start_time'] = this.eventStartTime;
    data['events_ends_time'] = this.eventsEndsTime;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['location'] = this.location;
    data['name'] = this.name;
    data['rsvp_answer'] = this.rsvpAnswer;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UpcomingEvents {
  String? attendedMode;
  String? date;
  String? desctiption;
  List<String>? eventMode;
  EventPicture? eventPicture;
  String? eventStartTime;
  String? eventsEndsTime;
  int? id;
  String? insertedAt;
  String? location;
  String? name;
  List<String>? rsvpAnswer;
  String? updatedAt;

  UpcomingEvents(
      {this.attendedMode,
      this.date,
      this.desctiption,
      this.eventMode,
      this.eventPicture,
      this.eventStartTime,
      this.eventsEndsTime,
      this.id,
      this.insertedAt,
      this.location,
      this.name,
      this.rsvpAnswer,
      this.updatedAt});

  UpcomingEvents.fromJson(Map<String, dynamic> json) {
    attendedMode = json['attended_mode'];
    date = json['date'];
    desctiption = json['desctiption'];
    if (json['event_mode'] != null) {
      eventMode = json['event_mode'].cast<String>();
    }

    //eventMode = json['event_mode'].cast<String>();
    eventPicture = json['event_picture'] != null
        ? new EventPicture.fromJson(json['event_picture'])
        : null;
    eventStartTime = json['event_start_time'];
    eventsEndsTime = json['events_ends_time'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    location = json['location'];
    name = json['name'];
    rsvpAnswer = json['rsvp_answer'].cast<String>();
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attended_mode'] = this.attendedMode;
    data['date'] = this.date;
    data['desctiption'] = this.desctiption;
    data['event_mode'] = this.eventMode;
    if (this.eventPicture != null) {
      data['event_picture'] = this.eventPicture!.toJson();
    }
    data['event_start_time'] = this.eventStartTime;
    data['events_ends_time'] = this.eventsEndsTime;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['location'] = this.location;
    data['name'] = this.name;
    data['rsvp_answer'] = this.rsvpAnswer;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EventPicture {
  int? id;
  String? mime;
  String? path;
  String? title;

  EventPicture({this.id, this.mime, this.path, this.title});

  EventPicture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    return data;
  }
}

class Error {
  String? message;
  int? status;

  Error({this.message, this.status});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
