class GetFarmComputerFiles {
  List<Data>? data;
  String? message;
  int? status;

  GetFarmComputerFiles({this.data, this.message, this.status});

  GetFarmComputerFiles.fromJson(Map<String, dynamic> json) {
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
  Favourite? favourite;
  File? file;
  FileTags? fileTags;

  Data({this.favourite, this.file, this.fileTags});

  Data.fromJson(Map<String, dynamic> json) {
    favourite = json['favourite'] != null
        ? new Favourite.fromJson(json['favourite'])
        : json['favourite'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    fileTags = json['file_tags'] != null
        ? new FileTags.fromJson(json['file_tags'])
        : null;
    /*if (json['file_tags'] != null) {
      fileTags = <FileTags>[];
       debugprint'value of data'+json['file_tags'].forEach((v){ debugprint'v is '+v);}));
      json['file_tags'].forEach((v) {
        fileTags!.add(new FileTags.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favourite != null) {
      data['favourite'] = this.favourite!.toJson();
    }
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    if (this.fileTags != null) {
      data['file_tags'] = this.fileTags!.toJson();
    }
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

class File {
  String? comments;
  String? date;
  String? description;
  Files? file;
  List<String>? fileType;
  int? id;
  String? insertedAt;
  String? mime;
  String? path;
  String? title;
  String? type;
  String? updatedAt;

  File(
      {this.comments,
      this.date,
      this.description,
      this.file,
      this.fileType,
      this.id,
      this.insertedAt,
      this.mime,
      this.path,
      this.title,
      this.type,
      this.updatedAt});

  File.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    date = json['date'];
    description = json['description'] ?? "";
    file = json['file'] != null ? new Files.fromJson(json['file']) : null;
    fileType = json['file_type'] != null
        ? json['file_type'].cast<String>()
        : json['file_type'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['date'] = this.date;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['file_type'] = this.fileType;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Files {
  String? large;
  String? mini;
  String? original;
  String? thumb;

  Files({this.large, this.mini, this.original, this.thumb});

  Files.fromJson(Map<String, dynamic> json) {
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

class FileTags {
  List<Parcels>? parcels;
  List<Projects>? projects;

  FileTags({this.parcels, this.projects});

  FileTags.fromJson(Map<String, dynamic> json) {
    if (json['parcels'] != null) {
      parcels = <Parcels>[];
      json['parcels'].forEach((v) {
        parcels!.add(new Parcels.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parcels != null) {
      data['parcels'] = this.parcels!.map((v) => v.toJson()).toList();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parcels {
  int? id;
  String? nameAuto;

  Parcels({this.id, this.nameAuto});

  Parcels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAuto = json['name_auto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_auto'] = this.nameAuto;
    return data;
  }
}

class Projects {
  int? id;
  String? name;

  Projects({this.id, this.name});

  Projects.fromJson(Map<String, dynamic> json) {
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
