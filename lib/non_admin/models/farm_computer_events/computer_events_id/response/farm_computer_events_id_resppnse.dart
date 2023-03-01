// class GetFarmComputerEventsIdResponse {
//   Data? data;
//   String? message;
//   int? status;
//   Error? error;
//   GetFarmComputerEventsIdResponse({this.data, this.message, this.status, this.error});
//
//   GetFarmComputerEventsIdResponse.fromJson(Map<String, dynamic> json) {
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
//   String? attendedMode;
//   String? eventDate;
//   String? eventDescription;
//   List<String>? eventMode;
//   String? eventName;
//   EventPicture? eventPicture;
//   String? eventStartTime;
//   String? eventsEndsTime;
//   int? id;
//   double? latitude;
//   String? location;
//   dynamic locationDescription;
//   double? longitude;
//   List<String>? rsvpAnswer;
//
//   Data(
//       {this.attendedMode,
//         this.eventDate,
//         this.eventDescription,
//         this.eventMode,
//         this.eventName,
//         this.eventPicture,
//         this.eventStartTime,
//         this.eventsEndsTime,
//         this.id,
//         this.latitude,
//         this.location,
//         this.locationDescription,
//         this.longitude,
//         this.rsvpAnswer});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     attendedMode = json['attended_mode'];
//     eventDate = json['event_date'];
//     eventDescription = json['event_description'];
//     eventMode = json['event_mode'].cast<String>();
//     eventName = json['event_name'];
//     eventPicture = json['event_picture'] != null
//         ? new EventPicture.fromJson(json['event_picture'])
//         : null;
//     eventStartTime = json['event_start_time'];
//     eventsEndsTime = json['events_ends_time'];
//     id = json['id'];
//     latitude = json['latitude'];
//     location = json['location'];
//     locationDescription = json['location_description'];
//     longitude = json['longitude'];
//     rsvpAnswer = json['rsvp_answer'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['attended_mode'] = this.attendedMode;
//     data['event_date'] = this.eventDate;
//     data['event_description'] = this.eventDescription;
//     data['event_mode'] = this.eventMode;
//     data['event_name'] = this.eventName;
//     if (this.eventPicture != null) {
//       data['event_picture'] = this.eventPicture!.toJson();
//     }
//     data['event_start_time'] = this.eventStartTime;
//     data['events_ends_time'] = this.eventsEndsTime;
//     data['id'] = this.id;
//     data['latitude'] = this.latitude;
//     data['location'] = this.location;
//     data['location_description'] = this.locationDescription;
//     data['longitude'] = this.longitude;
//     data['rsvp_answer'] = this.rsvpAnswer;
//     return data;
//   }
// }
//
// class EventPicture {
//   int? id;
//   String? mime;
//   String? path;
//   String? title;
//
//   EventPicture({this.id, this.mime, this.path, this.title});
//
//   EventPicture.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     mime = json['mime'];
//     path = json['path'];
//     title = json['title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['mime'] = this.mime;
//     data['path'] = this.path;
//     data['title'] = this.title;
//     return data;
//   }
// }
///
///
///
///
///
///
///
///
///
///
///
class GetFarmComputerEventsIdResponse {
  Data? data;
  String? message;
  int? status;
  Error? error;
  GetFarmComputerEventsIdResponse({this.data, this.message, this.status, this.error});

  GetFarmComputerEventsIdResponse.fromJson(Map<String, dynamic> json) {
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
  String? address;
  String? attendedMode;
  String? eventDate;
  String? eventDescription;
  List<String>? eventMode;
  String? eventName;
  EventPicture? eventPicture;
  String? eventStartTime;
  List<String>? eventType;
  String? eventsEndsTime;
  int? id;
  double? latitude;
  String? location;
  dynamic locationDescription;
  double? longitude;
  List<ProjectConnection>? projectConnection;
  List<String>? rsvpAnswer;

  Data(
      {this.address,
        this.attendedMode,
        this.eventDate,
        this.eventDescription,
        this.eventMode,
        this.eventName,
        this.eventPicture,
        this.eventStartTime,
        this.eventType,
        this.eventsEndsTime,
        this.id,
        this.latitude,
        this.location,
        this.locationDescription,
        this.longitude,
        this.projectConnection,
        this.rsvpAnswer});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    attendedMode = json['attended_mode'];
    eventDate = json['event_date'];
    eventDescription = json['event_description'];
    eventMode = json['event_mode'].cast<String>();
    eventName = json['event_name'];
    eventPicture = json['event_picture'] != null
        ? new EventPicture.fromJson(json['event_picture'])
        : null;
    eventStartTime = json['event_start_time'];
    eventType = json['event_type'].cast<String>();
    eventsEndsTime = json['events_ends_time'];
    id = json['id'];
    latitude = json['latitude'];
    location = json['location'];
    locationDescription = json['location_description'];
    longitude = json['longitude'];
    if (json['project_connection'] != null) {
      projectConnection = <ProjectConnection>[];
      json['project_connection'].forEach((v) {
        projectConnection!.add(new ProjectConnection.fromJson(v));
      });
    }
    rsvpAnswer = json['rsvp_answer'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['attended_mode'] = this.attendedMode;
    data['event_date'] = this.eventDate;
    data['event_description'] = this.eventDescription;
    data['event_mode'] = this.eventMode;
    data['event_name'] = this.eventName;
    if (this.eventPicture != null) {
      data['event_picture'] = this.eventPicture!.toJson();
    }
    data['event_start_time'] = this.eventStartTime;
    data['event_type'] = this.eventType;
    data['events_ends_time'] = this.eventsEndsTime;
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['location'] = this.location;
    data['location_description'] = this.locationDescription;
    data['longitude'] = this.longitude;
    if (this.projectConnection != null) {
      data['project_connection'] =
          this.projectConnection!.map((v) => v.toJson()).toList();
    }
    data['rsvp_answer'] = this.rsvpAnswer;
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

class ProjectConnection {
  int? id;
  String? name;

  ProjectConnection({this.id, this.name});

  ProjectConnection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
