class GetEntrepreneurResponse {
  List<GetEntrepreneurResponseData>? data;
  String? message;
  int? status;

  GetEntrepreneurResponse({this.data, this.message, this.status});

  GetEntrepreneurResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetEntrepreneurResponseData>[];
      json['data'].forEach((v) {
        data!.add(new GetEntrepreneurResponseData.fromJson(v));
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

class GetEntrepreneurResponseData {
  EntrepreneurInfo? entrepreneurInfo;
  int? farms;
  int? id;
  String? insertedAt;
  double? latitude;
  String? logo;
  int? logoId;
  double? longitude;
  String? name;
  List<String>? organizationType;
  String? postalAddress;
  List<String>? relationToWijLand;
  int? sellingLocations;
  String? updatedAt;

  GetEntrepreneurResponseData(
      {this.entrepreneurInfo,
      this.farms,
      this.id,
      this.insertedAt,
      this.latitude,
      this.logo,
      this.logoId,
      this.longitude,
      this.name,
      this.organizationType,
      this.postalAddress,
      this.relationToWijLand,
      this.sellingLocations,
      this.updatedAt});

  GetEntrepreneurResponseData.fromJson(Map<String, dynamic> json) {
    entrepreneurInfo = json['entrepreneur_info'] != null ? new EntrepreneurInfo.fromJson(json['entrepreneur_info']) : null;
    farms = json['farms'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    latitude = json['latitude'];
    logo = json['logo'];
    logoId = json['logo_id'];
    longitude = json['longitude'];
    name = json['name'];
    organizationType = json['organization_type'].cast<String>();
    postalAddress = json['postal_address'];
    relationToWijLand = json['relation_to_wij_land'].cast<String>();
    sellingLocations = json['selling_locations'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entrepreneurInfo != null) {
      data['entrepreneur_info'] = this.entrepreneurInfo!.toJson();
    }
    data['farms'] = this.farms;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['latitude'] = this.latitude;
    data['logo'] = this.logo;
    data['logo_id'] = this.logoId;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['organization_type'] = this.organizationType;
    data['postal_address'] = this.postalAddress;
    data['relation_to_wij_land'] = this.relationToWijLand;
    data['selling_locations'] = this.sellingLocations;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EntrepreneurInfo {
  int? amount;
  int? entrepreneurID;
  String? connectedToWijlandSince;
  String? facebook;
  int? facebookFollower;
  String? focusArea;
  String? helpRequest;
  String? instagram;
  int? instagramFollowers;
  String? legalStructure;
  String? linkedin;
  int? linkedinFollower;
  List<Products>? products;
  List<String>? relationToWijLand;
  String? twitter;
  int? twitterFollower;
  String? visitingAddress;
  String? website;
  int? year;

  EntrepreneurInfo(
      {this.amount,
      this.entrepreneurID,
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
    amount = json['amount'];
    entrepreneurID = json["entrepreneur_id"];
    connectedToWijlandSince = json['connected_to_wijland_since'];
    facebook = json['facebook'];
    facebookFollower = json['facebook_follower'];
    focusArea = json['focus_area'];
    helpRequest = json['help_request'];
    instagram = json['instagram'];
    instagramFollowers = json['instagram_followers'];
    legalStructure = json['legal_structure'];
    linkedin = json['linkedin'];
    linkedinFollower = json['linkedin_follower'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    relationToWijLand = json['relation_to_wij_land'].cast<String>();
    twitter = json['twitter'];
    twitterFollower = json['twitter_follower'];
    visitingAddress = json['visiting_address'];
    website = json['website'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data["entrepreneur_id"] = this.entrepreneurID;
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
    data['products'] = this.products;
    data['relation_to_wij_land'] = this.relationToWijLand;
    data['twitter'] = this.twitter;
    data['twitter_follower'] = this.twitterFollower;
    data['visiting_address'] = this.visitingAddress;
    data['website'] = this.website;
    data['year'] = this.year;
    return data;
  }
}

class Products {
  String? icon;
  String? name;

  Products({this.icon, this.name});

  Products.fromJson(Map<String, dynamic> json) {
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
