class ProjectDropdown {
  List<ProjectsData>? data;
  String? message;
  int? status;

  ProjectDropdown({this.data, this.message, this.status});

  ProjectDropdown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProjectsData>[];
      json['data'].forEach((v) {
        data!.add(new ProjectsData.fromJson(v));
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

class ProjectsData {
  int? id;
  String? name;

  ProjectsData({this.id, this.name});

  ProjectsData.fromJson(Map<String, dynamic> json) {
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
