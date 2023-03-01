class GetFarmComputerEventsFileMediaResponse {
  List<Data>? data;
  String? message;
  int? status;
  Error? error;

  GetFarmComputerEventsFileMediaResponse({this.data, this.message, this.status, this.error});

  GetFarmComputerEventsFileMediaResponse.fromJson(Map<String, dynamic> json) {
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
  String? dateUploaded;
  int? fileId;
  String? path;
  String? title;
  String? type;

  Data({this.addedBy, this.dateUploaded, this.fileId, this.path, this.title, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'];
    dateUploaded = json['date_uploaded'];
    fileId = json['file_id'];
    path = json['path'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['date_uploaded'] = this.dateUploaded;
    data['file_id'] = this.fileId;
    data['path'] = this.path;
    data['title'] = this.title;
    data['type'] = this.type;
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
