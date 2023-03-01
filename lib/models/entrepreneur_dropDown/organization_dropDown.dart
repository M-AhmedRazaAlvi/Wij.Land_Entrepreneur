class OrganizationDropdown {
  List<OrganizationData>? data = [];
  String? message;
  int? status;

  OrganizationDropdown({this.data, this.message, this.status});

  OrganizationDropdown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrganizationData>[];
      json['data'].forEach((v) {
        data!.add(new OrganizationData.fromJson(v));
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

class OrganizationData {
  String? address;
  int? id;
  double? latitude;
  String? logo;
  int? logoId;
  double? longitude;
  String? name;
  List<String>? organizationType;
  List<String>? relationToWijland;

  OrganizationData(
      {this.address, this.id, this.latitude, this.logo, this.logoId, this.longitude, this.name, this.organizationType, this.relationToWijland});

  OrganizationData.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    id = json['id'];
    latitude = json['latitude'];
    logo = json['logo'];
    logoId = json['logo_id'];
    longitude = json['longitude'];
    name = json['name'];
    organizationType = json['organization_type'].cast<String>();
    relationToWijland = json['relation_to_wijland'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['logo'] = this.logo;
    data['logo_id'] = this.logoId;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['organization_type'] = this.organizationType;
    data['relation_to_wijland'] = this.relationToWijland;
    return data;
  }
}
