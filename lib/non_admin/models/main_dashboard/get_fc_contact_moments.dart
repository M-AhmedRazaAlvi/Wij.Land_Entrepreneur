class GetFCContactMoments {
  Data? data;
  String? message;
  int? status;

  GetFCContactMoments({this.data, this.message, this.status});

  GetFCContactMoments.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? contactMomentDate;
  String? contactMomentType;
  String? contactNotes;
  String? contactSubject;
  int? id;

  Data(
      {this.contactMomentDate,
        this.contactMomentType,
        this.contactNotes,
        this.contactSubject,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    contactMomentDate = json['contact_moment_date'];
    contactMomentType = json['contact_moment_type'];
    contactNotes = json['contact_notes'];
    contactSubject = json['contact_subject'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_moment_date'] = contactMomentDate;
    data['contact_moment_type'] = contactMomentType;
    data['contact_notes'] = contactNotes;
    data['contact_subject'] = contactSubject;
    data['id'] = id;
    return data;
  }
}
