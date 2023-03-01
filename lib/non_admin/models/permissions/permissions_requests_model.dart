class PermissionsRequestsModel {
  List<PermissionRequestData>? data;
  String? message;
  int? status;

  PermissionsRequestsModel({this.data, this.message, this.status});

  PermissionsRequestsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PermissionRequestData>[];
      json['data'].forEach((v) {
        data!.add(new PermissionRequestData.fromJson(v));
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

class PermissionRequestData {
  int? id;
  String? insertedAt;
  PermissionOrganization? organization;
  PermissionsProject? project;
  String? requestEndDate;
  String? requestStartDate;
  String? requestType;
  List<Status>? status;
  String? title;
  String? updatedAt;

  PermissionRequestData(
      {this.id,
      this.insertedAt,
      this.organization,
      this.project,
      this.requestEndDate,
      this.requestStartDate,
      this.requestType,
      this.status,
      this.title,
      this.updatedAt});

  PermissionRequestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insertedAt = json['inserted_at'];
    organization = json['organization'] != null ? new PermissionOrganization.fromJson(json['organization']) : null;
    project = json['project'] != null ? new PermissionsProject.fromJson(json['project']) : null;
    requestEndDate = json['request_end_date'];
    requestStartDate = json['request_start_date'];
    requestType = json['request_type'];
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['request_end_date'] = this.requestEndDate;
    data['request_start_date'] = this.requestStartDate;
    data['request_type'] = this.requestType;
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PermissionOrganization {
  int? id;
  String? organizationName;

  PermissionOrganization({this.id, this.organizationName});

  PermissionOrganization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationName = json['organization_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization_name'] = this.organizationName;
    return data;
  }
}

class PermissionsProject {
  int? projectId;
  String? projectName;

  PermissionsProject({this.projectId, this.projectName});

  PermissionsProject.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    return data;
  }
}

class Status {
  int? id;
  String? status;
  String? color;

  Status({this.id, this.status, this.color});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['color'] = this.color;
    return data;
  }
}
