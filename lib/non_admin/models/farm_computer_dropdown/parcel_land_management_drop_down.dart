class ParcelLandManagementDropDown {
  List<LandMangementData>? data;
  String? message;
  int? status;

  ParcelLandManagementDropDown({this.data, this.message, this.status});

  ParcelLandManagementDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LandMangementData>[];
      json['data'].forEach((v) {
        data!.add(new LandMangementData.fromJson(v));
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

class LandMangementData {
  String? id;
  String? name;

  LandMangementData({this.id, this.name});

  LandMangementData.fromJson(Map<String, dynamic> json) {
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
