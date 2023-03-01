class GetFarmComputerFilesResponse {
  List<Data>? data;
  String? message;
  int? status;

  GetFarmComputerFilesResponse({this.data, this.message, this.status});

  GetFarmComputerFilesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  List<ActionFiles>? actionFiles;
  List<FarmComputerFiles>? farmComputerFiles;
  Project? project;

  Data({this.actionFiles, this.farmComputerFiles, this.project});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['action_files'] != null) {
      actionFiles = <ActionFiles>[];
      json['action_files'].forEach((v) {
        actionFiles!.add(new ActionFiles.fromJson(v));
      });
    }
    if (json['farm_computer_files'] != null) {
      farmComputerFiles = <FarmComputerFiles>[];
      json['farm_computer_files'].forEach((v) {
        farmComputerFiles!.add(new FarmComputerFiles.fromJson(v));
      });
    }
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.actionFiles != null) {
      data['action_files'] = this.actionFiles!.map((v) => v.toJson()).toList();
    }
    if (this.farmComputerFiles != null) {
      data['farm_computer_files'] =
          this.farmComputerFiles!.map((v) => v.toJson()).toList();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class ActionFiles {
  List<Files>? files;
  int? id;
  List<String>? type;

  ActionFiles({this.files, this.id, this.type});

  ActionFiles.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    id = json['id'];
    type = json['type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class Files {
  String? addedBy;
  String? addedOn;
  Null? contract;
  int? id;
  String? insertedAt;
  String? name;
  String? path;
  String? type;
  String? updatedAt;

  Files(
      {this.addedBy,
        this.addedOn,
        this.contract,
        this.id,
        this.insertedAt,
        this.name,
        this.path,
        this.type,
        this.updatedAt});

  Files.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'];
    addedOn = json['added_on'];
    contract = json['contract'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    path = json['path'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['added_on'] = this.addedOn;
    data['contract'] = this.contract;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['path'] = this.path;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FarmComputerFiles {
  String? addedBy;
  String? addedOn;
  Null? contract;
  int? id;
  String? insertedAt;
  String? name;
  Parcel? parcel;
  String? path;
  String? type;
  String? updatedAt;

  FarmComputerFiles(
      {this.addedBy,
        this.addedOn,
        this.contract,
        this.id,
        this.insertedAt,
        this.name,
        this.parcel,
        this.path,
        this.type,
        this.updatedAt});

  FarmComputerFiles.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'];
    addedOn = json['added_on'];
    contract = json['contract'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    parcel =
    json['parcel'] != null ? new Parcel.fromJson(json['parcel']) : null;
    path = json['path'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['added_on'] = this.addedOn;
    data['contract'] = this.contract;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    if (this.parcel != null) {
      data['parcel'] = this.parcel!.toJson();
    }
    data['path'] = this.path;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Parcel {
  Null? id;
  Null? nameLocation;

  Parcel({this.id, this.nameLocation});

  Parcel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameLocation = json['name_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_location'] = this.nameLocation;
    return data;
  }
}

class Project {
  int? projectId;
  String? projectName;

  Project({this.projectId, this.projectName});

  Project.fromJson(Map<String, dynamic> json) {
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
