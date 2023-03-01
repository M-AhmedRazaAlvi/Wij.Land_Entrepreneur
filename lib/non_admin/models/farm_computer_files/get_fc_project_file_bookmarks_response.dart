class GetFCProjectFileBookmarksResponse {
  List<Data>? data;
  String? message;
  int? status;
  Error? error;


  GetFCProjectFileBookmarksResponse({this.data, this.message, this.status,this.error});

  GetFCProjectFileBookmarksResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    error = json['error'] != null ?  Error.fromJson(json['error']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  String? addedBy;
  String? addedOn;
  int? id;
  String? insertedAt;
  String? isBookmark;
  String? isContract;
  String? isFavourite;
  String? name;
  int? parcelId;
  String? parcelName;
  String? path;
  String? type;
  String? updatedAt;

  Data(
      {this.addedBy,
        this.addedOn,
        this.id,
        this.insertedAt,
        this.isBookmark,
        this.isContract,
        this.isFavourite,
        this.name,
        this.parcelId,
        this.parcelName,
        this.path,
        this.type,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'];
    addedOn = json['added_on'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    isBookmark = json['is_bookmark'];
    isContract = json['is_contract'];
    isFavourite = json['is_favourite'];
    name = json['name'];
    parcelId = json['parcel_id'];
    parcelName = json['parcel_name'];
    path = json['path'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['added_on'] = this.addedOn;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['is_bookmark'] = this.isBookmark;
    data['is_contract'] = this.isContract;
    data['is_favourite'] = this.isFavourite;
    data['name'] = this.name;
    data['parcel_id'] = this.parcelId;
    data['parcel_name'] = this.parcelName;
    data['path'] = this.path;
    data['type'] = this.type;
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