class FarmComputersProjectDetailResponseModel {
  ProjectDetailsData? data;
  String? message;
  int? status;

  FarmComputersProjectDetailResponseModel(
      {this.data, this.message, this.status});

  FarmComputersProjectDetailResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProjectDetailsData.fromJson(json['data']) : null;
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

class ProjectDetailsData {
  BannerImage? bannerImage;
  String? description;
  List<String>? interestStatus;
  List<String>? participationStatus;
  List<PersonResponsibles>? personResponsibles;
  int? projectId;
  String? projectName;

  ProjectDetailsData(
      {this.bannerImage,
        this.description,
        this.interestStatus,
        this.participationStatus,
        this.personResponsibles,
        this.projectId,
        this.projectName});

  ProjectDetailsData.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'] != null
        ? new BannerImage.fromJson(json['banner_image'])
        : null;
    description = json['description'];
    interestStatus = json['interest_status'].cast<String>();
    participationStatus = json['participation_status'].cast<String>();
    if (json['person_responsibles'] != null) {
      personResponsibles = <PersonResponsibles>[];
      json['person_responsibles'].forEach((v) {
        personResponsibles!.add(new PersonResponsibles.fromJson(v));
      });
    }
    projectId = json['project_id'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerImage != null) {
      data['banner_image'] = this.bannerImage!.toJson();
    }
    data['description'] = this.description;
    data['interest_status'] = this.interestStatus;
    data['participation_status'] = this.participationStatus;
    if (this.personResponsibles != null) {
      data['person_responsibles'] =
          this.personResponsibles!.map((v) => v.toJson()).toList();
    }
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
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

class PersonResponsibles {
  String? emailAddress;
  File? file;
  String? firstName;
  int? id;
  String? lastName;
  String? path;

  PersonResponsibles(
      {this.emailAddress,
        this.file,
        this.firstName,
        this.id,
        this.lastName,
        this.path});

  PersonResponsibles.fromJson(Map<String, dynamic> json) {
    emailAddress = json['email_address'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email_address'] = this.emailAddress;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    data['path'] = this.path;
    return data;
  }
}