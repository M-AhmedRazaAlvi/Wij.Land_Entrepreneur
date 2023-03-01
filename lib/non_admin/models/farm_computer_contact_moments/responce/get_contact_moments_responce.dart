class GetFarmComputerContactMomentsResponse {
  List<Data>? data;
  String? message;
  int? status;
  Error? error;


  GetFarmComputerContactMomentsResponse({this.data, this.message, this.status, this.error});

  GetFarmComputerContactMomentsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;

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
  String? attendeeNote;
  List<String>? attendees;
  String? contactMomentDate;
  List<ContactMomentsType>? contactMomentsType;
  String? contactNotes;
  String? contactSubject;
  String? farm;
  int? id;
  String? insertedAt;
  String? organization;
  String? project;
  String? updatedAt;

  Data(
      {this.attendeeNote,
        this.attendees,
        this.contactMomentDate,
        this.contactMomentsType,
        this.contactNotes,
        this.contactSubject,
        this.farm,
        this.id,
        this.insertedAt,
        this.organization,
        this.project,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    attendeeNote = json['attendee_note'];
    attendees = json['attendees'].cast<String>();
    contactMomentDate = json['contact_moment_date'];
    if (json['contact_moments_type'] != null) {
      contactMomentsType = <ContactMomentsType>[];
      json['contact_moments_type'].forEach((v) {
        contactMomentsType!.add(new ContactMomentsType.fromJson(v));
      });
    }
    contactNotes = json['contact_notes'];
    contactSubject = json['contact_subject'];
    farm = json['farm'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    organization = json['organization'];
    project = json['project'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendee_note'] = this.attendeeNote;
    data['attendees'] = this.attendees;
    data['contact_moment_date'] = this.contactMomentDate;
    if (this.contactMomentsType != null) {
      data['contact_moments_type'] =
          this.contactMomentsType!.map((v) => v.toJson()).toList();
    }
    data['contact_notes'] = this.contactNotes;
    data['contact_subject'] = this.contactSubject;
    data['farm'] = this.farm;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['organization'] = this.organization;
    data['project'] = this.project;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ContactMomentsType {
  String? icon;
  String? name;

  ContactMomentsType({this.icon, this.name});

  ContactMomentsType.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
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