class GetFarmComputerBookMarkFileResponse {
  List<Data>? data;
  String? message;
  int? status;

  GetFarmComputerBookMarkFileResponse({this.data, this.message, this.status});

  GetFarmComputerBookMarkFileResponse.fromJson(Map<String, dynamic> json) {
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
  String? addedOn;
  Favourite? favourite;
  String? fileDescription;
  String? fileInsertedDate;
  List<FileTags>? fileTags;
  String? fileTitle;
  String? fileType;
  int? id;
  String? path;

  Data(
      {this.addedOn,
        this.favourite,
        this.fileDescription,
        this.fileInsertedDate,
        this.fileTags,
        this.fileTitle,
        this.fileType,
        this.id,
        this.path});

  Data.fromJson(Map<String, dynamic> json) {
    addedOn = json['added_on'];
    favourite = json['favourite'] != null
        ? new Favourite.fromJson(json['favourite'])
        : null;
    fileDescription = json['file_description'];
    fileInsertedDate = json['file_inserted_date'];
    if (json['file_tags'] != null) {
      fileTags = <FileTags>[];
      json['file_tags'].forEach((v) {
        fileTags!.add(new FileTags.fromJson(v));
      });
    }
    fileTitle = json['file_title'];
    fileType = json['file_type'];
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_on'] = this.addedOn;
    if (this.favourite != null) {
      data['favourite'] = this.favourite!.toJson();
    }
    data['file_description'] = this.fileDescription;
    data['file_inserted_date'] = this.fileInsertedDate;
    if (this.fileTags != null) {
      data['file_tags'] = this.fileTags!.map((v) => v.toJson()).toList();
    }
    data['file_title'] = this.fileTitle;
    data['file_type'] = this.fileType;
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}

class Favourite {
  int? id;
  bool? isBookmark;
  String? isFavourite;

  Favourite({this.id, this.isBookmark, this.isFavourite});

  Favourite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isBookmark = json['is_bookmark'];
    isFavourite = json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_bookmark'] = this.isBookmark;
    data['is_favourite'] = this.isFavourite;
    return data;
  }
}

class FileTags {
  Null? parcel;
  Project? project;

  FileTags({this.parcel, this.project});

  FileTags.fromJson(Map<String, dynamic> json) {
    parcel = json['parcel'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parcel'] = this.parcel;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? name;

  Project({this.id, this.name});

  Project.fromJson(Map<String, dynamic> json) {
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
