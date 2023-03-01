class PutFCBasicInfo {
  String? activeInProjectsSince;
  String? address;
  String? farmName;
  String? farmPhotoId;
  String? latitude;
  String? longitude;
  String? municipality;
  String? province;
  List<String>? typeBusiness;
  String? waterBody;

  PutFCBasicInfo(
      {this.activeInProjectsSince,
        this.address,
        this.farmName,
        this.farmPhotoId,
        this.latitude,
        this.longitude,
        this.municipality,
        this.province,
        this.typeBusiness,
        this.waterBody});

  PutFCBasicInfo.fromJson(Map<String, dynamic> json) {
    activeInProjectsSince = json['active_in_projects_since'];
    address = json['address'];
    farmName = json['farm_name'];
    farmPhotoId = json['farm_photo_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    municipality = json['municipality'];
    province = json['province'];
    typeBusiness = json['type_business'].cast<String>();
    waterBody = json['water_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active_in_projects_since'] = this.activeInProjectsSince;
    data['address'] = this.address;
    data['farm_name'] = this.farmName;
    data['farm_photo_id'] = this.farmPhotoId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['municipality'] = this.municipality;
    data['province'] = this.province;
    data['type_business'] = this.typeBusiness;
    data['water_body'] = this.waterBody;
    return data;
  }
}
