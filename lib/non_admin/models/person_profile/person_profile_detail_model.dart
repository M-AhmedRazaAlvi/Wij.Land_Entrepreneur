class PersonProfileDetailResponseModel {
  PersonProfileData? data;
  String? message;
  int? status;

  PersonProfileDetailResponseModel({this.data, this.message, this.status});

  PersonProfileDetailResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new PersonProfileData.fromJson(json['data']) : null;
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

class PersonProfileData {
  String? addressMail;
  String? dateAdded;
  String? emailAddress;
  List<FarmOrganization>? farmOrganization;
  String? firstName;
  bool? focusGroupMember;
  ImagePath? imagePath;
  bool? interestedToRentNatureGrounds;
  String? lastName;
  String? organizationType;
  int? personId;
  String? phoneNumberHome;
  String? phoneNumberMobile;
  String? role;

  PersonProfileData(
      {this.addressMail,
        this.dateAdded,
        this.emailAddress,
        this.farmOrganization,
        this.firstName,
        this.focusGroupMember,
        this.imagePath,
        this.interestedToRentNatureGrounds,
        this.lastName,
        this.organizationType,
        this.personId,
        this.phoneNumberHome,
        this.phoneNumberMobile,
        this.role});

  PersonProfileData.fromJson(Map<String, dynamic> json) {
    addressMail = json['address_mail'];
    dateAdded = json['date_added'];
    emailAddress = json['email_address'];
    if (json['farm_organization'] != null) {
      farmOrganization = <FarmOrganization>[];
      json['farm_organization'].forEach((v) {
        farmOrganization!.add(new FarmOrganization.fromJson(v));
      });
    }
    firstName = json['first_name'];
    focusGroupMember = json['focus_group_member'];
    imagePath = json['image_path'] != null
        ? new ImagePath.fromJson(json['image_path'])
        : null;
    interestedToRentNatureGrounds = json['interested_to_rent_nature_grounds'];
    lastName = json['last_name'];
    organizationType = json['organization_type'];
    personId = json['person_id'];
    phoneNumberHome = json['phone_number_home'];
    phoneNumberMobile = json['phone_number_mobile'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_mail'] = this.addressMail;
    data['date_added'] = this.dateAdded;
    data['email_address'] = this.emailAddress;
    if (this.farmOrganization != null) {
      data['farm_organization'] =
          this.farmOrganization!.map((v) => v.toJson()).toList();
    }
    data['first_name'] = this.firstName;
    data['focus_group_member'] = this.focusGroupMember;
    if (this.imagePath != null) {
      data['image_path'] = this.imagePath!.toJson();
    }
    data['interested_to_rent_nature_grounds'] =
        this.interestedToRentNatureGrounds;
    data['last_name'] = this.lastName;
    data['organization_type'] = this.organizationType;
    data['person_id'] = this.personId;
    data['phone_number_home'] = this.phoneNumberHome;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    data['role'] = this.role;
    return data;
  }
}

class FarmOrganization {
  String? id;
  String? name;

  FarmOrganization({this.id, this.name});

  FarmOrganization.fromJson(Map<String, dynamic> json) {
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

  ImagePath(
      {this.date,
        this.description,
        this.file,
        this.id,
        this.insertedAt,
        this.mime,
        this.path,
        this.title,
        this.updatedAt});

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