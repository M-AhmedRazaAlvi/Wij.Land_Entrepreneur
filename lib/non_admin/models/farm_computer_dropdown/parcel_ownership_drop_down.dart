class ParcelOwnershipDropDown {
  List<OwnerShipData>? data;
  String? message;
  int? status;

  ParcelOwnershipDropDown({this.data, this.message, this.status});

  ParcelOwnershipDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OwnerShipData>[];
      json['data'].forEach((v) {
        data!.add(new OwnerShipData.fromJson(v));
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

class OwnerShipData {
  String? id;
  String? name;

  OwnerShipData({this.id, this.name});

  OwnerShipData.fromJson(Map<String, dynamic> json) {
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
