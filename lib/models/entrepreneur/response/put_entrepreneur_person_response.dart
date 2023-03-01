class PutEntrepreneurPersonResponse {
  Data? data;
  String? message;
  int? status;
  Error? error;

  PutEntrepreneurPersonResponse({this.data, this.message, this.status,this.error});

  PutEntrepreneurPersonResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? email;
  int? id;
  ImagePath? imagePath;
  String? insertedAt;
  String? name;
  String? phone;
  List<Positions>? positions;
  String? updatedAt;

  Data(
      {this.email,
        this.id,
        this.imagePath,
        this.insertedAt,
        this.name,
        this.phone,
        this.positions,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    imagePath = json['image_path'] != null
        ? ImagePath.fromJson(json['image_path'])
        : null;
    insertedAt = json['inserted_at'];
    name = json['name'];
    phone = json['phone'];
    if (json['positions'] != null) {
      positions = <Positions>[];
      json['positions'].forEach((v) {
        positions!.add(Positions.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    if (imagePath != null) {
      data['image_path'] = this.imagePath!.toJson();
    }
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['phone'] = this.phone;
    if (this.positions != null) {
      data['positions'] = this.positions!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ImagePath {
  String? date;
  String? description;
  File? file;

  ImagePath({this.date, this.description, this.file});

  ImagePath.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class File {
  String? large;
  String? mini;
  String? original;
  String? thumb;

  File({this.large, this.mini, this.original, this.thumb});

  File.fromJson(Map<String, dynamic> json) {
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


class Positions {
  String? comment;
  String? date;
  int? id;
  String? insertedAt;
  String? position;
  String? role;
  String? updatedAt;

  Positions(
      {this.comment,
        this.date,
        this.id,
        this.insertedAt,
        this.position,
        this.role,
        this.updatedAt});

  Positions.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    date = json['date'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    position = json['position'];
    role = json['role'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['date'] = this.date;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['position'] = this.position;
    data['role'] = this.role;
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
