class GetFCEvents {
  List<Data>? data;
  String? message;
  int? status;

  GetFCEvents({this.data, this.message, this.status});

  GetFCEvents.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? eventDate;
  String? eventDescription;
  String? eventName;
  String? eventPic;
  int? id;
  String? location;

  Data(
      {this.eventDate,
      this.eventDescription,
      this.eventName,
      this.eventPic,
      this.id,
      this.location});

  Data.fromJson(Map<String, dynamic> json) {
    eventDate = json['event_date'];
    eventDescription = json['event_description'];
    eventName = json['event_name'];
    eventPic = json['event_pic'];
    id = json['id'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_date'] = this.eventDate;
    data['event_description'] = this.eventDescription;
    data['event_name'] = this.eventName;
    data['event_pic'] = this.eventPic;
    data['id'] = this.id;
    data['location'] = this.location;
    return data;
  }
}
