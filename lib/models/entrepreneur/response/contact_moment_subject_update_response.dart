class ContactMomentSubjectUpdateResponse {
  Data? data;
  String? message;
  int? status;

  ContactMomentSubjectUpdateResponse({this.data, this.message, this.status});

  ContactMomentSubjectUpdateResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? description;
  int? id;
  String? insertedAt;
  List<String>? subject;
  String? updatedAt;
  dynamic? writtenBy;
  int? writtenById;

  Data({this.description, this.id, this.insertedAt, this.subject, this.updatedAt, this.writtenBy, this.writtenById});

  Data.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    subject = json['subject'].cast<String>();
    updatedAt = json['updated_at'];
    writtenBy = json['written_by'];
    writtenById = json['written_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['subject'] = this.subject;
    data['updated_at'] = this.updatedAt;
    data['written_by'] = this.writtenBy;
    data['written_by_id'] = this.writtenById;
    return data;
  }
}
