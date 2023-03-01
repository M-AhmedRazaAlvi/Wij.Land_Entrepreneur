class GetFarmComputerMyProjectFileResponse {
  List<Data>? data;
  String? message;
  int? status;
  Error? error;

  GetFarmComputerMyProjectFileResponse({this.data, this.message, this.status, this.error});

  GetFarmComputerMyProjectFileResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;

    message = json['message'];
    status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (error != null) {
      data['error'] = this.error!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? addedBy;
  String? addedOn;
  String? fileType;
  int? id;
  String? insertedAt;
  String? isBookmark;
  String? isContract;
  String? isFavourite;
  String? name;
  List<Parcels>? parcels;
  String? path;
  String? type;
  String? updatedAt;

  Data(
      {this.addedBy,
        this.addedOn,
        this.fileType,
        this.id,
        this.insertedAt,
        this.isBookmark,
        this.isContract,
        this.isFavourite,
        this.name,
        this.parcels,
        this.path,
        this.type,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'];
    addedOn = json['added_on'];
    fileType = json['file_type'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    isBookmark = json['is_bookmark'];
    isContract = json['is_contract'];
    isFavourite = json['is_favourite'];
    name = json['name'];
    if (json['parcels'] != null) {
      parcels = <Parcels>[];
      json['parcels'].forEach((v) {
        parcels!.add(new Parcels.fromJson(v));
      });
    }
    path = json['path'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['added_on'] = this.addedOn;
    data['file_type'] = this.fileType;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['is_bookmark'] = this.isBookmark;
    data['is_contract'] = this.isContract;
    data['is_favourite'] = this.isFavourite;
    data['name'] = this.name;
    if (this.parcels != null) {
      data['parcels'] = this.parcels!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Parcels {
  int? parcelId;
  String? parcelName;

  Parcels({this.parcelId, this.parcelName});

  Parcels.fromJson(Map<String, dynamic> json) {
    parcelId = json['parcel_id'];
    parcelName = json['parcel_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parcel_id'] = this.parcelId;
    data['parcel_name'] = this.parcelName;
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
