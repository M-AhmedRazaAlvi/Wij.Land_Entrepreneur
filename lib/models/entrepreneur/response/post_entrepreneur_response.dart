class PostEntrepreneurResponse {
  Data? data;
  String? message;
  int? status;

  PostEntrepreneurResponse({this.data, this.message, this.status});

  PostEntrepreneurResponse.fromJson(Map<String, dynamic> json) {
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
  double? amount;
  String? connectedToWijlandSince;
  String? entrepreneurName;
  String? focusArea;
  int? id;
  ImagePath? imagePath;
  String? insertedAt;
  String? legalStructure;
  String? postalAddress;
  String? project;
  String? relationToWijLand;
  String? updatedAt;
  String? visitingAddress;
  String? year;

  Data(
      {this.amount,
        this.connectedToWijlandSince,
        this.entrepreneurName,
        this.focusArea,
        this.id,
        this.imagePath,
        this.insertedAt,
        this.legalStructure,
        this.postalAddress,
        this.project,
        this.relationToWijLand,
        this.updatedAt,
        this.visitingAddress,
        this.year});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    connectedToWijlandSince = json['connected_to_wijland_since'];
    entrepreneurName = json['entrepreneur_name'];
    focusArea = json['focus_area'];
    id = json['id'];
    imagePath = json['image_path'] != null
        ? new ImagePath.fromJson(json['image_path'])
        : null;
    insertedAt = json['inserted_at'];
    legalStructure = json['legal_structure'];
    postalAddress = json['postal_address'];
    project = json['project'];
    relationToWijLand = json['relation_to_wij_land'];
    updatedAt = json['updated_at'];
    visitingAddress = json['visiting_address'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['connected_to_wijland_since'] = this.connectedToWijlandSince;
    data['entrepreneur_name'] = this.entrepreneurName;
    data['focus_area'] = this.focusArea;
    data['id'] = this.id;
    if (this.imagePath != null) {
      data['image_path'] = this.imagePath!.toJson();
    }
    data['inserted_at'] = this.insertedAt;
    data['legal_structure'] = this.legalStructure;
    data['postal_address'] = this.postalAddress;
    data['project'] = this.project;
    data['relation_to_wij_land'] = this.relationToWijLand;
    data['updated_at'] = this.updatedAt;
    data['visiting_address'] = this.visitingAddress;
    data['year'] = this.year;
    return data;
  }
}

class ImagePath {
  int? id;
  String? insertedAt;
  String? name;
  String? path;
  String? updatedAt;

  ImagePath({this.id, this.insertedAt, this.name, this.path, this.updatedAt});

  ImagePath.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    path = json['path'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['path'] = this.path;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}