class FarmComputersProjectsResponseModel {
  List<ProjectsData>? data;
  String? message;
  int? status;

  FarmComputersProjectsResponseModel({this.data, this.message, this.status});

  FarmComputersProjectsResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? activeFarms;
  BannerImage? bannerImage;
  String? description;
  bool? internalProject;
  List<Links>? links;
  String? projectHectares;
  int? projectId;
  String? projectName;
  List<String>? projectStatus;
  String? startDate;

  ProjectsData(
      {this.activeFarms,
        this.bannerImage,
        this.description,
        this.internalProject,
        this.links,
        this.projectHectares,
        this.projectId,
        this.projectName,
        this.projectStatus,
        this.startDate});

  ProjectsData.fromJson(Map<String, dynamic> json) {
    activeFarms = json['active_farms'];
    bannerImage = json['banner_image'] != null
        ? new BannerImage.fromJson(json['banner_image'])
        : null;
    description = json['description'];
    internalProject = json['internal_project'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    projectHectares = json['project_hectares'].toString();
    projectId = json['project_id'];
    projectName = json['project_name'];
    projectStatus = json['project_status'].cast<String>();
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active_farms'] = this.activeFarms;
    if (this.bannerImage != null) {
      data['banner_image'] = this.bannerImage!.toJson();
    }
    data['description'] = this.description;
    data['internal_project'] = this.internalProject;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['project_hectares'] = this.projectHectares;
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    data['project_status'] = this.projectStatus;
    data['start_date'] = this.startDate;
    return data;
  }
}

class BannerImage {
  File? file;
  String? path;

  BannerImage({this.file, this.path});

  BannerImage.fromJson(Map<String, dynamic> json) {
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['path'] = this.path;
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

class Links {
  LinksData? data;

  Links({this.data});

  Links.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LinksData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LinksData {
  String? link;
  String? title;

  LinksData({this.link, this.title});

  LinksData.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['title'] = this.title;
    return data;
  }
}