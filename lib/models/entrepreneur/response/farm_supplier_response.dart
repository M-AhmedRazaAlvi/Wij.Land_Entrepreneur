class GetFarmSupplierResponse {
  List<Data>? data;
  String? message;
  int? status;

  GetFarmSupplierResponse({this.data, this.message, this.status});

  GetFarmSupplierResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? entrepreneursCount;
  String? farmAutoName;
  int? farmId;
  double? farmLatitude;
  double? farmLongitude;
  String? farmRepresentativeName;

  Data(
      {this.entrepreneursCount,
        this.farmAutoName,
        this.farmId,
        this.farmLatitude,
        this.farmLongitude,
        this.farmRepresentativeName});

  Data.fromJson(Map<String, dynamic> json) {
    entrepreneursCount = json['entrepreneurs_count'];
    farmAutoName = json['farm_auto_name'];
    farmId = json['farm_id'];
    farmLatitude = json['farm_latitude'];
    farmLongitude = json['farm_longitude'];
    farmRepresentativeName = json['farm_representative_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entrepreneurs_count'] = this.entrepreneursCount;
    data['farm_auto_name'] = this.farmAutoName;
    data['farm_id'] = this.farmId;
    data['farm_latitude'] = this.farmLatitude;
    data['farm_longitude'] = this.farmLongitude;
    data['farm_representative_name'] = this.farmRepresentativeName;
    return data;
  }
}
