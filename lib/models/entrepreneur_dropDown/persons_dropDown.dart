class PersonsDropdown {
  List<Persons>? data;
  String? message;
  int? status;

  PersonsDropdown({this.data, this.message, this.status});

  PersonsDropdown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Persons>[];
      json['data'].forEach((v) {
        data!.add(new Persons.fromJson(v));
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

class Persons {
  int? id;
  String? name;

  Persons({this.id, this.name});

  Persons.fromJson(Map<String, dynamic> json) {
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
