// class GetFarmComputerEventsResponce {
//   Data? data;
//   String? message;
//   int? status;
//   GetFarmComputerEventsResponce({this.data, this.message, this.status});

//   GetFarmComputerEventsResponce.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json["message"];
//     status = json["status"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data["message"] = this.message;
//     data["status"] = this.status;
//     return data;
//   }
// }

// class Data {
//   List<PastEvents>? pastEvents;
//   List<UpcomingEvents>? upcomingEvents;

//   Data({this.pastEvents, this.upcomingEvents});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['past_events'] != null) {
//       pastEvents = <PastEvents>[];
//       json['past_events'].forEach((v) {
//         pastEvents!.add(new PastEvents.fromJson(v));
//       });
//     }
//     if (json['upcoming_events'] != null) {
//       upcomingEvents = <UpcomingEvents>[];
//       json['upcoming_events'].forEach((v) {
//         upcomingEvents!.add(new UpcomingEvents.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.pastEvents != null) {
//       data['past_events'] = this.pastEvents!.map((v) => v.toJson()).toList();
//     }
//     if (this.upcomingEvents != null) {
//       data['upcoming_events'] =
//           this.upcomingEvents!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class PastEvents {
//   String? eventDate;
//   String? eventDescription;
//   String? eventName;
//   String? eventStartTime;
//   String? eventStatus;
//   String? eventsEndsTime;
//   int? id;
//   String? location;
//   List<String>? rsvpAnswer;

//   PastEvents(
//       {this.eventDate,
//       this.eventDescription,
//       this.eventName,
//       this.eventStartTime,
//       this.eventStatus,
//       this.eventsEndsTime,
//       this.id,
//       this.location,
//       this.rsvpAnswer});

//   PastEvents.fromJson(Map<String, dynamic> json) {
//     eventDate = json['event_date'];
//     eventDescription = json['event_description'];
//     eventName = json['event_name'];
//     eventStartTime = json['event_start_time'];
//     eventStatus = json['event_status'];
//     eventsEndsTime = json['events_ends_time'];
//     id = json['id'];
//     location = json['location'];
//     rsvpAnswer = json['rsvp_answer'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['event_date'] = this.eventDate;
//     data['event_description'] = this.eventDescription;
//     data['event_name'] = this.eventName;
//     data['event_start_time'] = this.eventStartTime;
//     data['event_status'] = this.eventStatus;
//     data['events_ends_time'] = this.eventsEndsTime;
//     data['id'] = this.id;
//     data['location'] = this.location;
//     data['rsvp_answer'] = this.rsvpAnswer;
//     return data;
//   }
// }

// class UpcomingEvents {
//   Null? eventDate;
//   String? eventDescription;
//   String? eventName;
//   String? eventStartTime;
//   String? eventStatus;
//   String? eventsEndsTime;
//   Null? farmDetail;
//   int? id;
//   String? location;
//   List<String>? rsvpAnswer;

//   UpcomingEvents(
//       {this.eventDate,
//       this.eventDescription,
//       this.eventName,
//       this.eventStartTime,
//       this.eventStatus,
//       this.eventsEndsTime,
//       this.farmDetail,
//       this.id,
//       this.location,
//       this.rsvpAnswer});

//   UpcomingEvents.fromJson(Map<String, dynamic> json) {
//     eventDate = json['event_date'];
//     eventDescription = json['event_description'];
//     eventName = json['event_name'];
//     eventStartTime = json['event_start_time'];
//     eventStatus = json['event_status'];
//     eventsEndsTime = json['events_ends_time'];
//     farmDetail = json['farm_detail'];
//     id = json['id'];
//     location = json['location'];
//     rsvpAnswer = json['rsvp_answer'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['event_date'] = this.eventDate;
//     data['event_description'] = this.eventDescription;
//     data['event_name'] = this.eventName;
//     data['event_start_time'] = this.eventStartTime;
//     data['event_status'] = this.eventStatus;
//     data['events_ends_time'] = this.eventsEndsTime;
//     data['farm_detail'] = this.farmDetail;
//     data['id'] = this.id;
//     data['location'] = this.location;
//     data['rsvp_answer'] = this.rsvpAnswer;
//     return data;
//   }
// }
