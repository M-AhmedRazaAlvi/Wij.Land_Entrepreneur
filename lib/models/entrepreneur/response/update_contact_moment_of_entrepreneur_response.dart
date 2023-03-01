class UpdateContactMomentOfEntrepreneurResponse {
  Data? data;
  String? message;
  int? status;

  UpdateContactMomentOfEntrepreneurResponse(
      {this.data, this.message, this.status});

  UpdateContactMomentOfEntrepreneurResponse.fromJson(
      Map<String, dynamic> json) {
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
  String? comment;
  String? contactDate;
  List<String>? contactType;
  int? id;
  String? insertedAt;
  List<PeopleInvolved>? peopleInvolved;
  String? updatedAt;

  Data(
      {this.comment,
        this.contactDate,
        this.contactType,
        this.id,
        this.insertedAt,
        this.peopleInvolved,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    contactDate = json['contact_date'];
    contactType = json['contact_type'].cast<String>();
    id = json['id'];
    insertedAt = json['inserted_at'];
    if (json['people_involved'] != null) {
      peopleInvolved = <PeopleInvolved>[];
      json['people_involved'].forEach((v) {
        peopleInvolved!.add(new PeopleInvolved.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['contact_date'] = this.contactDate;
    data['contact_type'] = this.contactType;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    if (this.peopleInvolved != null) {
      data['people_involved'] =
          this.peopleInvolved!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PeopleInvolved {
  int? id;
  String? insertedAt;
  String? name;
  String? updatedAt;

  PeopleInvolved({this.id, this.insertedAt, this.name, this.updatedAt});

  PeopleInvolved.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}