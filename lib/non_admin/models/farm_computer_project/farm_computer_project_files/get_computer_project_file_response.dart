class GetFarmComputerProjectFilesResponse {
    List<Data>? data;
    String? message;
    int? status;
    Error? error;
    GetFarmComputerProjectFilesResponse({this.data, this.message, this.status, this.error});

    GetFarmComputerProjectFilesResponse.fromJson(Map<String, dynamic> json) {
        if (json['data'] != null) {
            data = <Data>[];
            json['data'].forEach((v) {
                data!.add(new Data.fromJson(v));
            });
        }
        message = json['message'];
        status = json['status'];
        error = json['error'] != null ? new Error.fromJson(json['error']) : null;

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
    String? fileType;
    int? id;
    String? insertedAt;
    String? isBookmark;
    String? isContract;
    String? isFavourite;
    String? name;
    List<String>? parcels;
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
        parcels = json['parcels'].cast<String>();
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
        data['parcels'] = this.parcels;
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
