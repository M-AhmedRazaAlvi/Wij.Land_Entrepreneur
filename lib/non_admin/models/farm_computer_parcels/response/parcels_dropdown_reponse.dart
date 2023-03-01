class ParcelDropDownResponse {
  List<ParcelDropDownData>? data;
  String? message;
  int? status;

  ParcelDropDownResponse({this.data, this.message, this.status});

  ParcelDropDownResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ParcelDropDownData>[];
      json['data'].forEach((v) {
        data!.add(new ParcelDropDownData.fromJson(v));
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

class ParcelDropDownData {
  int? id;
  String? name;

  ParcelDropDownData({this.id, this.name});

  ParcelDropDownData.fromJson(Map<String, dynamic> json) {
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
