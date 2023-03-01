class ParcelPurposesDropDown {
  List<PurposeData>? data;
  String? message;
  int? status;

  ParcelPurposesDropDown({this.data, this.message, this.status});

  ParcelPurposesDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PurposeData>[];
      json['data'].forEach((v) {
        data!.add(new PurposeData.fromJson(v));
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

class PurposeData {
  String? id;
  String? name;

  PurposeData({this.id, this.name});

  PurposeData.fromJson(Map<String, dynamic> json) {
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
