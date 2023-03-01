class ParcelProjectsDropDown {
  List<ProjectData>? data;
  String? message;
  int? status;

  ParcelProjectsDropDown({this.data, this.message, this.status});

  ParcelProjectsDropDown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProjectData>[];
      json['data'].forEach((v) {
        data!.add(new ProjectData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class ProjectData {
  int? id;
  String? name;

  ProjectData({this.id, this.name});

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
