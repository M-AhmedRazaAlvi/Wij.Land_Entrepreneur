class GetFarmComputerEventParticipatingResponse {
  List<Data>? data;
  String? message;
  int? status;
  Error? error;

  GetFarmComputerEventParticipatingResponse(
      {this.data, this.message, this.status, this.error});

  GetFarmComputerEventParticipatingResponse.fromJson(
      Map<String, dynamic> json) {
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
  int? attendeeId;
  String? name;
  List<String>? rsvpAnswer;

  Data({this.attendedMode, this.attendeeId, this.name, this.rsvpAnswer});

  Data.fromJson(Map<String, dynamic> json) {
    attendedMode = json['attended_mode'];
    attendeeId = json['attendee_id'];
    name = json['name'];
    if (json['rsvp_answer'] != null) {
      rsvpAnswer = json['rsvp_answer'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attended_mode'] = this.attendedMode;
    data['attendee_id'] = this.attendeeId;
    data['name'] = this.name;
    data['rsvp_answer'] = this.rsvpAnswer;

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
