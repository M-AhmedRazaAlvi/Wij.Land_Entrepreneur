class GetEntrepreneurOverviewResponse {
  Data? data;
  String? message;
  int? statusCode;

  GetEntrepreneurOverviewResponse({this.data, this.message, this.statusCode});

  GetEntrepreneurOverviewResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  Entrepreneur? entrepreneur;
  List<EntrepreneurPersons>? persons;

  Data({this.entrepreneur, this.persons});

  Data.fromJson(Map<String, dynamic> json) {
    entrepreneur = json['entrepreneur'] != null ? new Entrepreneur.fromJson(json['entrepreneur']) : null;
    if (json['persons'] != null) {
      persons = <EntrepreneurPersons>[];
      json['persons'].forEach((v) {
        persons!.add(new EntrepreneurPersons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entrepreneur != null) {
      data['entrepreneur'] = this.entrepreneur!.toJson();
    }
    if (this.persons != null) {
      data['persons'] = this.persons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entrepreneur {
  String? facebook;
  String? facebookFollower;
  String? helpRequest;
  String? id;
  String? insertedAt;
  String? instagram;
  String? instagramFollowers;
  double? latitude;
  String? linkedin;
  String? linkedinFollower;
  double? longitude;
  String? twitter;
  String? twitterFollower;
  String? updatedAt;
  String? noofSupplier;
  String? noofRetailer;

  Entrepreneur(
      {this.facebook,
      this.facebookFollower,
      this.helpRequest,
      this.id,
      this.insertedAt,
      this.instagram,
      this.instagramFollowers,
      this.latitude,
      this.linkedin,
      this.linkedinFollower,
      this.longitude,
      this.twitter,
      this.noofRetailer,
      this.noofSupplier,
      this.twitterFollower,
      this.updatedAt});

  Entrepreneur.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'].toString();
    facebookFollower = json['facebook_follower'].toString();
    helpRequest = json['help_request'].toString();
    id = json['id'].toString();
    insertedAt = json['inserted_at'].toString();
    instagram = json['instagram'].toString();
    instagramFollowers = json['instagram_followers'].toString();
    latitude = json['latitude'];
    linkedin = json['linkedin'].toString();
    linkedinFollower = json['linkedin_follower'].toString();
    longitude = json['longitude'];
    twitter = json['twitter'].toString();
    twitterFollower = json['twitter_follower'].toString();
    updatedAt = json['updated_at'].toString();
    noofRetailer = json['retailers_count'].toString();
    noofSupplier = json['suppliers_count'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['facebook_follower'] = this.facebookFollower;
    data['help_request'] = this.helpRequest;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['instagram'] = this.instagram;
    data['instagram_followers'] = this.instagramFollowers;
    data['latitude'] = this.latitude;
    data['linkedin'] = this.linkedin;
    data['linkedin_follower'] = this.linkedinFollower;
    data['longitude'] = this.longitude;
    data['twitter'] = this.twitter;
    data['twitter_follower'] = this.twitterFollower;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EntrepreneurPersons {
  String? email;
  String? id;

  ImageInfo? imageInfo;
  String? insertedAt;
  String? name;
  String? phone;
  String? mobile;
  List<Position>? positions;
  String? updatedAt;

  EntrepreneurPersons({this.email, this.id, this.imageInfo, this.insertedAt, this.name, this.mobile, this.phone, this.positions, this.updatedAt});

  EntrepreneurPersons.fromJson(Map<String, dynamic> json) {
    email = json['email'].toString();
    id = json['id'].toString();
    imageInfo = json['image_info'] != null ? new ImageInfo.fromJson(json['image_info']) : null;
    insertedAt = json['inserted_at'].toString();
    name = json['name'].toString();
    phone = json['phone'].toString();
    phone = json['mobile_number'].toString();
    if (json['positions'] != null) {
      positions = <Position>[];
      json['positions'].forEach((v) {
        positions!.add(Position.fromJson(v));
      });
    }
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;

    if (imageInfo != null) {
      data['image_info'] = imageInfo!.toJson();
    }
    data['inserted_at'] = insertedAt;
    data['name'] = name;
    data['phone'] = phone;
    data['mobile_number'] = phone;
    if (positions != null) {
      data['positions'] = positions!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ImageInfo {
  String? id;
  String? path;

  ImageInfo({this.id, this.path});

  ImageInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}
class Position {
  String? comment;
  String? date;
  int? id;
  String? insertedAt;
  String? position;
  Role? role;
  String? updatedAt;

  Position(
      {this.comment,
        this.date,
        this.id,
        this.insertedAt,
        this.position,
        this.role,
        this.updatedAt});

  Position.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    date = json['date'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    position = json['position'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['date'] = this.date;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['position'] = this.position;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Role {
  String? personInOrganizationId;
  List<String>? role;

  Role({this.personInOrganizationId, this.role});

  Role.fromJson(Map<String, dynamic> json) {
    personInOrganizationId = json['person_in_organization_id'].toString();
    role = json['role'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person_in_organization_id'] = personInOrganizationId;
    data['role'] = role;
    return data;
  }
}
