class ParcelOrganizationsDropDown {
  List<LandOrganizationData>? data;
  String? message;
  int? status;

  ParcelOrganizationsDropDown({this.data, this.message, this.status});

  ParcelOrganizationsDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LandOrganizationData>[];
      json['data'].forEach((v) {
        data!.add(new LandOrganizationData.fromJson(v));
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

class LandOrganizationData {
  int? id;
  String? name;

  LandOrganizationData({this.id, this.name});

  LandOrganizationData.fromJson(Map<String, dynamic> json) {
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
