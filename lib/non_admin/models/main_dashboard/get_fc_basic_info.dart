class GetFCBasicInfo {
  Data? data;
  String? message;
  int? status;

  GetFCBasicInfo({this.data, this.message, this.status});

  GetFCBasicInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? address;
  List<String>? businessType;
  String? connectedToWijlandSince;
  String? farmAddress;
  String? farmName;
  String? farmPhoto;
  int? farmPhotoId;
  double? hectares;
  int? id;
  double? latitude;
  double? longitude;
  String? municipality;
  String? province;
  String? waterBody;

  Data(
      {this.address,
        this.businessType,
        this.connectedToWijlandSince,
        this.farmAddress,
        this.farmName,
        this.farmPhoto,
        this.farmPhotoId,
        this.hectares,
        this.id,
        this.latitude,
        this.longitude,
        this.municipality,
        this.province,
        this.waterBody});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    businessType = json['business_type'].cast<String>();
    connectedToWijlandSince = json['connected_to_wijland_since'];
    farmAddress = json['farm_address'];
    farmName = json['farm_name'];
    farmPhoto = json['farm_photo'];
    farmPhotoId = json['farm_photo_id'];
    hectares = json['hectares'];
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    municipality = json['municipality'];
    province = json['province'];
    waterBody = json['water_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['business_type'] = this.businessType;
    data['connected_to_wijland_since'] = this.connectedToWijlandSince;
    data['farm_address'] = this.farmAddress;
    data['farm_name'] = this.farmName;
    data['farm_photo'] = this.farmPhoto;
    data['farm_photo_id'] = this.farmPhotoId;
    data['hectares'] = this.hectares;
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['municipality'] = this.municipality;
    data['province'] = this.province;
    data['water_body'] = this.waterBody;
    return data;
  }
}
