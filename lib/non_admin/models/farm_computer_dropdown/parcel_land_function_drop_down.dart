class ParcelLandFunctionDropDown {
  List<LandFunctionData>? data;
  String? message;
  int? status;

  ParcelLandFunctionDropDown({this.data, this.message, this.status});

  ParcelLandFunctionDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LandFunctionData>[];
      json['data'].forEach((v) {
        data!.add(new LandFunctionData.fromJson(v));
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

class LandFunctionData {
  String? id;
  String? name;

  LandFunctionData({this.id, this.name});

  LandFunctionData.fromJson(Map<String, dynamic> json) {
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
