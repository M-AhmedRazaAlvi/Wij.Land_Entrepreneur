class FileUploadResponse {
  Data? data;
  String? message;
  int? status;

  FileUploadResponse({this.data, this.message, this.status});

  FileUploadResponse.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? description;
  FileClass? file;
  int? id;
  String? insertedAt;
  String? path;
  String? title;
  String? updatedAt;

  Data(
      {this.date,
        this.description,
        this.file,
        this.id,
        this.insertedAt,
        this.path,
        this.title,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    file = json['file'] != null ? new FileClass.fromJson(json['file']) : null;
    id = json['id'];
    insertedAt = json['inserted_at'];
    path = json['path'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['path'] = this.path;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FileClass {
  String? large;
  String? mini;
  String? original;
  String? thumb;

  FileClass({this.large, this.mini, this.original, this.thumb});

  FileClass.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    mini = json['mini'];
    original = json['original'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['mini'] = this.mini;
    data['original'] = this.original;
    data['thumb'] = this.thumb;
    return data;
  }
}