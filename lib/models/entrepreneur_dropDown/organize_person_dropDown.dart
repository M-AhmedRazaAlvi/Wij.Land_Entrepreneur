



import 'dart:convert';

OrganizePersonDropDown organizePersonDropDownFromJson(String str) => OrganizePersonDropDown.fromJson(json.decode(str));

String organizePersonDropDownToJson(OrganizePersonDropDown data) => json.encode(data.toJson());

class OrganizePersonDropDown {
  List<OrganizePerson>? data;
  String? message;
  int? status;

  OrganizePersonDropDown({this.data, this.message, this.status});

  OrganizePersonDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrganizePerson>[];
      json['data'].forEach((v) {
        data!.add(OrganizePerson.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class OrganizePerson {
  String? comment;
  String? date;
  int? id;
  String? organizationName;
  String? personName;
  String? position;
  String? role;

  OrganizePerson(
      {this.comment,
        this.date,
        this.id,
        this.organizationName,
        this.personName,
        this.position,
        this.role});

  OrganizePerson.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    date = json['date'];
    id = json['id'];
    organizationName = json['organization_name'];
    personName = json['name'];
    position = json['position'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['date'] = date;
    data['id'] = id;
    data['organization_name'] = organizationName;
    data['name'] = personName;
    data['position'] = position;
    data['role'] = role;
    return data;
  }
}