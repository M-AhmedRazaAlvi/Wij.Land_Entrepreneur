class FarmDropDown {
  List<FarmsList>? data;
  String? message;
  int? status;

  FarmDropDown({this.data, this.message, this.status});

  FarmDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FarmsList>[];
      json['data'].forEach((v) {
        data!.add(new FarmsList.fromJson(v));
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

class FarmsList {
  int? id;
  String? name;

  FarmsList({this.id, this.name});

  FarmsList.fromJson(Map<String, dynamic> json) {
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
