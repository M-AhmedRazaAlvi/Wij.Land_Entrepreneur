class GetFarmComputerProjectParticipantResponse {
  Data? data;
  String? message;
  int? statusCode;

  GetFarmComputerProjectParticipantResponse(
      {this.data, this.message, this.statusCode});

  GetFarmComputerProjectParticipantResponse.fromJson(
      Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  List<Farms>? farms;
  int? totalCount;

  Data({this.farms, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['farms'] != null) {
      farms = <Farms>[];
      json['farms'].forEach((v) {
        farms!.add(new Farms.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.farms != null) {
      data['farms'] = this.farms!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Farms {
  String? farmName;
  int? id;
  String? insertedAt;
  String? participatingDate;
  String? updatedAt;

  Farms(
      {this.farmName,
      this.id,
      this.insertedAt,
      this.participatingDate,
      this.updatedAt});

  Farms.fromJson(Map<String, dynamic> json) {
    farmName = json['farm_name'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    participatingDate = json['participating_date'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farm_name'] = this.farmName;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['participating_date'] = this.participatingDate;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
