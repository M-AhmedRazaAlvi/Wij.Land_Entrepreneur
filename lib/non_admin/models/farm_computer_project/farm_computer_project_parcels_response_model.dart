import 'package:wij_land/non_admin/models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';

class GetFarmComputerProjectParcelsResponse {
  Data? data;
  String? message;
  int? statusCode;
  Error? error;

  GetFarmComputerProjectParcelsResponse(
      {this.data, this.message, this.statusCode, this.error});

  GetFarmComputerProjectParcelsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;

    if (error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  List<Parcels>? parcels;
  int? totalCount;

  Data({this.parcels, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['parcels'] != null) {
      parcels = <Parcels>[];
      json['parcels'].forEach((v) {
        parcels!.add(new Parcels.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parcels != null) {
      data['parcels'] = this.parcels!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Parcels {
  Object? file;
  int? id;
  String? insertedAt;
  String? parcelName;
  String? participatingDate;
  ParcelMapInformation? polygonCoordinates;
  double? size;
  String? updatedAt;

  Parcels(
      {this.file,
      this.id,
      this.insertedAt,
      this.parcelName,
      this.participatingDate,
      this.polygonCoordinates,
      this.size,
      this.updatedAt});

  Parcels.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    parcelName = json['parcel_name'];
    participatingDate = json['participating_date'];
    if (json['polygon_coordinates'] != null) {
      polygonCoordinates = ParcelMapInformation.fromJson(
          json['polygon_coordinates']['features'][0]);
    }
    size = json['size'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['parcel_name'] = this.parcelName;
    data['participating_date'] = this.participatingDate;
    data['polygon_coordinates'] = this.polygonCoordinates;
    data['size'] = this.size;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Error {
  String? message;
  int? status;

  Error({this.message, this.status});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
