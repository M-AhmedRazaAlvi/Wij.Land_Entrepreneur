class GetFarmComputerEventsListResponse {
  List<Data>? data;
  String? message;
  int? status;
  Error? error;
  GetFarmComputerEventsListResponse(
      {this.data, this.message, this.status, this.error});

  GetFarmComputerEventsListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    attendedMode = json['attended_mode'];
    date = json['date'];
    desctiption = json['desctiption'];
    if (json['event_mode'] != null) {
      eventMode = json['event_mode'].cast<String>();
    }

    eventPicture = json['event_picture'] != null
        ? new EventPicture.fromJson(json['event_picture'])
        : null;
    eventStartTime = json['event_start_time'];
    eventsEndsTime = json['events_ends_time'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    location = json['location'];
    name = json['name'];
    if (json['rsvp_answer'] != null) {
      rsvpAnswer = json['rsvp_answer'].cast<String>();
    }
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
