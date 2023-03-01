

class RetailerDropDown {
  List<RetailerData>? data;
  String? message;
  int? status;

  RetailerDropDown({this.data, this.message, this.status});

  RetailerDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RetailerData>[];
      json['data'].forEach((v) {
        data!.add(RetailerData.fromJson(v));
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

class RetailerData {
  int? id;
  String? name;

  RetailerData({this.id, this.name});

  RetailerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
