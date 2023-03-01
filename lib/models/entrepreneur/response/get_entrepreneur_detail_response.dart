class GetEntrepreneurDetailsResponse {
  Data? data;
  String? message;
  int? status;

  GetEntrepreneurDetailsResponse({this.data, this.message, this.status});

  GetEntrepreneurDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? amount;
  String? connectedToWijlandSince;
  EntrepreneurInfo? entrepreneurInfo;
  String? entrepreneurName;
  String? focusArea;
  String? id;
  ImagePath? imagePath;
  String? insertedAt;
  double? latitude;
  String? legalStructure;
  double? longitude;
  String? postalAddress;
  Project? project;
  List<String>? relationToWijLand;
  String? updatedAt;
  String? visitingAddress;
  String? year;

  Data(
      {this.amount,
      this.connectedToWijlandSince,
      this.entrepreneurInfo,
      this.entrepreneurName,
      this.focusArea,
      this.id,
      this.imagePath,
      this.insertedAt,
      this.latitude,
      this.legalStructure,
      this.longitude,
      this.postalAddress,
      this.project,
      this.relationToWijLand,
      this.updatedAt,
      this.visitingAddress,
      this.year});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'].toString();
    connectedToWijlandSince = json['connected_to_wijland_since'];
    entrepreneurInfo = json['entrepreneur_info'] != null ? new EntrepreneurInfo.fromJson(json['entrepreneur_info']) : null;
    entrepreneurName = json['entrepreneur_name'];
    focusArea = json['focus_area'].toString();
    id = json['id'].toString();
    imagePath = json['image_path'] != null ? new ImagePath.fromJson(json['image_path']) : null;
    insertedAt = json['inserted_at'].toString();
    latitude = json['latitude'];
    legalStructure = json['legal_structure'].toString();
    longitude = json['longitude'];
    postalAddress = json['postal_address'].toString();
    project = json['project'] != null ? new Project.fromJson(json['project']) : null;
    relationToWijLand = json['relation_to_wij_land'].cast<String>();
    updatedAt = json['updated_at'].toString();
    visitingAddress = json['visiting_address'];
    year = json['year'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['connected_to_wijland_since'] = this.connectedToWijlandSince;
    if (this.entrepreneurInfo != null) {
      data['entrepreneur_info'] = this.entrepreneurInfo!.toJson();
    }
    data['entrepreneur_name'] = this.entrepreneurName;
    data['focus_area'] = this.focusArea;
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['inserted_at'] = this.insertedAt;
    data['latitude'] = this.latitude;
    data['legal_structure'] = this.legalStructure;
    data['longitude'] = this.longitude;
    data['postal_address'] = this.postalAddress;
    data['project'] = this.project;
    data['relation_to_wij_land'] = this.relationToWijLand;
    data['updated_at'] = this.updatedAt;
    data['visiting_address'] = this.visitingAddress;
    data['year'] = this.year;
    return data;
  }
}

class EntrepreneurInfo {
  String? amount;
  String? connectedToWijlandSince;
  String? facebook;
  String? facebookFollower;
  String? focusArea;
  String? helpRequest;
  String? instagram;
  String? instagramFollowers;
  String? legalStructure;
  String? linkedin;
  String? linkedinFollower;
  List<DetailProducts>? products;
  List<String>? relationToWijLand;
  String? twitter;
  String? twitterFollower;
  String? visitingAddress;
  String? website;
  String? year;

  EntrepreneurInfo(
      {this.amount,
      this.connectedToWijlandSince,
      this.facebook,
      this.facebookFollower,
      this.focusArea,
      this.helpRequest,
      this.instagram,
      this.instagramFollowers,
      this.legalStructure,
      this.linkedin,
      this.linkedinFollower,
      this.products,
      this.relationToWijLand,
      this.twitter,
      this.twitterFollower,
      this.visitingAddress,
      this.website,
      this.year});

  EntrepreneurInfo.fromJson(Map<String, dynamic> json) {
    amount = json['amount'].toString();
    connectedToWijlandSince = json['connected_to_wijland_since'].toString();
    facebook = json['facebook'].toString();
    facebookFollower = json['facebook_follower'].toString();
    focusArea = json['focus_area'].toString();
    helpRequest = json['help_request'].toString();
    instagram = json['instagram'].toString();
    instagramFollowers = json['instagram_followers'].toString();
    legalStructure = json['legal_structure'].toString();
    linkedin = json['linkedin'].toString();
    linkedinFollower = json['linkedin_follower'].toString();
    if (json['products'] != null) {
      products = <DetailProducts>[];
      json['products'].forEach((v) {
        products!.add(new DetailProducts.fromJson(v));
      });
    }
    relationToWijLand = json['relation_to_wij_land'].cast<String>();
    twitter = json['twitter'].toString();
    twitterFollower = json['twitter_follower'].toString();
    visitingAddress = json['visiting_address'].toString();
    website = json['website'].toString();
    year = json['year'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['connected_to_wijland_since'] = this.connectedToWijlandSince;
    data['facebook'] = this.facebook;
    data['facebook_follower'] = this.facebookFollower;
    data['focus_area'] = this.focusArea;
    data['help_request'] = this.helpRequest;
    data['instagram'] = this.instagram;
    data['instagram_followers'] = this.instagramFollowers;
    data['legal_structure'] = this.legalStructure;
    data['linkedin'] = this.linkedin;
    data['linkedin_follower'] = this.linkedinFollower;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['relation_to_wij_land'] = this.relationToWijLand;
    data['twitter'] = this.twitter;
    data['twitter_follower'] = this.twitterFollower;
    data['visiting_address'] = this.visitingAddress;
    data['website'] = this.website;
    data['year'] = this.year;
    return data;
  }
}

class DetailProducts {
  String? icon;
  String? name;

  DetailProducts({this.icon, this.name});

  DetailProducts.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['name'] = this.name;
    return data;
  }
}

class ImagePath {
  String? date;
  String? description;
  File? file;
  String? id;
  String? insertedAt;
  String? path;
  String? title;
  String? updatedAt;

  ImagePath({this.date, this.description, this.file, this.id, this.insertedAt, this.path, this.title, this.updatedAt});

  ImagePath.fromJson(Map<String, dynamic> json) {
    date = json['date'].toString();
    description = json['description'].toString();
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    id = json['id'].toString();
    insertedAt = json['inserted_at'].toString();
    path = json['path'].toString();
    title = json['title'].toString();
    updatedAt = json['updated_at'].toString();
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
    large = json['large'].toString();
    mini = json['mini'].toString();
    original = json['original'].toString();
    thumb = json['thumb'].toString();
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

class Project {
  int? id;
  String? insertedAt;
  String? name;
  String? updatedAt;

  Project({this.id, this.insertedAt, this.name, this.updatedAt});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// OLD RESPONSE

// class GetEntrepreneurDetailsResponse {
//   Data? data;
//   String? message;
//   int? status;
//
//   GetEntrepreneurDetailsResponse({this.data, this.message, this.status});
//
//   GetEntrepreneurDetailsResponse.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class Data {
//   String? amount;
//   String? connectedToWijlandSince;
//   String? entrepreneurName;
//   String? focusArea;
//   String? id;
//   ImagePath? imagePath;
//   String? insertedAt;
//   double? latitude;
//   String? legalStructure;
//   double? longitude;
//   String? postalAddress;
//   Project? project;
//   String? relationToWijLand;
//   String? updatedAt;
//   String? visitingAddress;
//   String? year;
//
//   Data(
//       {this.amount,
//         this.connectedToWijlandSince,
//         this.entrepreneurName,
//         this.focusArea,
//         this.id,
//         this.imagePath,
//         this.insertedAt,
//         this.latitude,
//         this.legalStructure,
//         this.longitude,
//         this.postalAddress,
//         this.project,
//         this.relationToWijLand,
//         this.updatedAt,
//         this.visitingAddress,
//         this.year});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     amount = json['amount'].toString();
//     connectedToWijlandSince = json['connected_to_wijland_since'].toString();
//     entrepreneurName = json['entrepreneur_name'].toString();
//     focusArea = json['focus_area'].toString();
//     id = json['id'].toString();
//     imagePath = json['image_path'] != null
//         ? ImagePath.fromJson(json['image_path'])
//         : null;
//     insertedAt = json['inserted_at'].toString();
//     latitude = json['latitude'];
//     legalStructure = json['legal_structure'].toString();
//     longitude = json['longitude'];
//     postalAddress = json['postal_address'].toString();
//     project = json['project'] != null
//         ? Project.fromJson(json['project'])
//         : null;
//     relationToWijLand = json['relation_to_wij_land'].toString();
//     updatedAt = json['updated_at'].toString();
//     visitingAddress = json['visiting_address'].toString();
//     year = json['year'].toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['amount'] = this.amount;
//     data['connected_to_wijland_since'] = this.connectedToWijlandSince;
//     data['entrepreneur_name'] = this.entrepreneurName;
//     data['focus_area'] = this.focusArea;
//     data['id'] = this.id;
//     if (this.imagePath != null) {
//       data['image_path'] = this.imagePath!.toJson();
//     }
//     data['inserted_at'] = this.insertedAt;
//     data['latitude'] = this.latitude;
//     data['legal_structure'] = this.legalStructure;
//     data['longitude'] = this.longitude;
//     data['postal_address'] = this.postalAddress;
//     data['project'] = this.project;
//     data['relation_to_wij_land'] = this.relationToWijLand;
//     data['updated_at'] = this.updatedAt;
//     data['visiting_address'] = this.visitingAddress;
//     data['year'] = this.year;
//     return data;
//   }
// }
// class Project {
//   int? id;
//   String? insertedAt;
//   String? name;
//   String? updatedAt;
//
//   Project({this.id, this.insertedAt, this.name, this.updatedAt});
//
//   Project.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     insertedAt = json['inserted_at'];
//     name = json['name'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['inserted_at'] = this.insertedAt;
//     data['name'] = this.name;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class ImagePath {
//   String? date;
//   String? description;
//   File? file;
//   int? id;
//   String? insertedAt;
//   String? path;
//   String? title;
//   String? updatedAt;
//
//   ImagePath(
//       {this.date,
//         this.description,
//         this.file,
//         this.id,
//         this.insertedAt,
//         this.path,
//         this.title,
//         this.updatedAt});
//
//   ImagePath.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     description = json['description'];
//     file = json['file'] != null ? new File.fromJson(json['file']) : null;
//     id = json['id'];
//     insertedAt = json['inserted_at'];
//     path = json['path'];
//     title = json['title'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['date'] = this.date;
//     data['description'] = this.description;
//     if (this.file != null) {
//       data['file'] = this.file!.toJson();
//     }
//     data['id'] = this.id;
//     data['inserted_at'] = this.insertedAt;
//     data['path'] = this.path;
//     data['title'] = this.title;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class File {
//   String? large;
//   String? mini;
//   String? original;
//   String? thumb;
//
//   File({this.large, this.mini, this.original, this.thumb});
//
//   File.fromJson(Map<String, dynamic> json) {
//     large = json['large'];
//     mini = json['mini'];
//     original = json['original'];
//     thumb = json['thumb'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['large'] = this.large;
//     data['mini'] = this.mini;
//     data['original'] = this.original;
//     data['thumb'] = this.thumb;
//     return data;
//   }
// }
