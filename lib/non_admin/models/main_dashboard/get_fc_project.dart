

class GetFCProjects {
  List<Data>? data;
  String? message;
  int? status;

  GetFCProjects({this.data, this.message, this.status});

  GetFCProjects.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? description;
  ImagePath? imagePath;
  int? projectId;
  String? projectName;

  Data({this.description, this.imagePath, this.projectId, this.projectName});

  Data.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    imagePath = json['image_path'] != null
        ? ImagePath.fromJson(json['image_path'])
        : null;
    projectId = json['project_id'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    if (imagePath != null) {
      data['image_path'] = imagePath!.toJson();
    }
    data['project_id'] = projectId;
    data['project_name'] = projectName;
    return data;
  }
}

class ImagePath {
  int? id;
  String? path;

  ImagePath({this.id, this.path});

  ImagePath.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['path'] = path;
    return data;
  }
}
