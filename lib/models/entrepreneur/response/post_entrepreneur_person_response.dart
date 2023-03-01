
class PostEntrepreneurPersonResponse {
  Data? data;
  String? message;
  int? status;

  PostEntrepreneurPersonResponse({this.data, this.message, this.status});

  PostEntrepreneurPersonResponse.fromJson(Map<String, dynamic> json) {
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
  String? email;
  int? id;
  String? imagePath;
  String? insertedAt;
  String? name;
  String? phone;
  List<Role>? role;
  String? updatedAt;

  Data(
      {this.email,
        this.id,
        this.imagePath,
        this.insertedAt,
        this.name,
        this.phone,
        this.role,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    imagePath = json['image_path'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    phone = json['phone'];
    if (json['role'] != null) {
      role = <Role>[];
      json['role'].forEach((v) {
        role!.add(new Role.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['phone'] = this.phone;
    if (this.role != null) {
      data['role'] = this.role!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Role {
  String? role;
  int? id;
  String? insertedAt;
  String? updatedAt;

  Role({this.role, this.id, this.insertedAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    role = json['Role'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Role'] = this.role;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}