class MyUser {
  bool? active;
  String? email;
  bool? farmComputer;
  int? id;
  String? insertedAt;
  String? locale;
  String? name;
  int? personId;
  PersonInfo? personInfo;
  String? token;
  String? updatedAt;
  String? message;
  int? status;

  MyUser(
      {this.active,
      this.email,
      this.farmComputer,
      this.id,
      this.insertedAt,
      this.locale,
      this.name,
      this.personId,
      this.personInfo,
      this.token,
      this.updatedAt,
      this.message,
      this.status});

  MyUser.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    email = json['email'];
    farmComputer = json['farm_computer'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    locale = json['locale'];
    name = json['name'];
    personId = json['person_id'];
    personInfo = json['person_info'] != null ? new PersonInfo.fromJson(json['person_info']) : null;
    token = json['token'];
    updatedAt = json['updated_at'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['email'] = this.email;
    data['farm_computer'] = this.farmComputer;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['person_id'] = this.personId;
    if (this.personInfo != null) {
      data['person_info'] = this.personInfo!.toJson();
    }
    data['token'] = this.token;
    data['updated_at'] = this.updatedAt;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class PersonInfo {
  String? emailAddress;
  String? firstName;
  int? id;
  ImagePath? imagePath;
  String? lastName;
  String? name;
  String? phoneNumberMobile;

  PersonInfo({this.emailAddress, this.firstName, this.id, this.imagePath, this.lastName, this.name, this.phoneNumberMobile});

  PersonInfo.fromJson(Map<String, dynamic> json) {
    emailAddress = json['email_address'];
    firstName = json['first_name'];
    id = json['id'];
    if(json['image_path'] is Map  ){
      imagePath = json['image_path'] != null ? new ImagePath.fromJson(json['image_path']) : null;
    }
    lastName = json['last_name'];
    name = json['name'];
    phoneNumberMobile = json['phone_number_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email_address'] = this.emailAddress;
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    if (this.imagePath != null) {
      data['image_path'] = this.imagePath!.toJson();
    }
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    return data;
  }
}

class ImagePath {
  String? date;
  String? description;
  File? file;
  int? id;
  String? insertedAt;
  String? mime;
  String? path;
  String? title;
  String? updatedAt;

  ImagePath({this.date, this.description, this.file, this.id, this.insertedAt, this.mime, this.path, this.title, this.updatedAt});

  ImagePath.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    id = json['id'];
    insertedAt = json['inserted_at'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
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
