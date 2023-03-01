class PostEntrepreneurRequest {
  String? address;
  Entrepreneur? entrepreneur;
  String? latitude;
  String? logoId;
  String? longitude;
  String? name;
  String? organizationId;
  List<String>? organizationType;
  List<String>? relationToWijland;

  PostEntrepreneurRequest(
      {this.address,
        this.entrepreneur,
        this.latitude,
        this.logoId,
        this.longitude,
        this.name,
        this.organizationId,
        this.organizationType,
        this.relationToWijland});

  PostEntrepreneurRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    entrepreneur = json['entrepreneur'] != null
        ? new Entrepreneur.fromJson(json['entrepreneur'])
        : null;
    latitude = json['latitude'];
    logoId = json['logo_id'];
    longitude = json['longitude'];
    name = json['name'];
    organizationId = json['organization_id'];
    organizationType = json['organization_type'].cast<String>();
    relationToWijland = json['relation_to_wijland'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    if (this.entrepreneur != null) {
      data['entrepreneur'] = this.entrepreneur!.toJson();
    }
    data['latitude'] = this.latitude;
    data['logo_id'] = this.logoId;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['organization_id'] = this.organizationId;
    data['organization_type'] = this.organizationType;
    data['relation_to_wijland'] = this.relationToWijland;
    return data;
  }
}

class Entrepreneur {
  String? amount;
  String? connectedToWijlandSince;
  String? facebook;
  int? facebookFollower;
  String? focusArea;
  String? helpRequest;
  String? instagram;
  int? instagramFollower;
  String? legalStructure;
  String? linkedin;
  int? linkedinFollower;
  List<String>? products;
  String? projectId;
  List<String>? relationToWijland;
  String? twitter;
  int? twitterFollower;
  String? visitingAddress;
  String? website;
  String? year;

  Entrepreneur(
      {this.amount,
        this.connectedToWijlandSince,
        this.facebook,
        this.facebookFollower,
        this.focusArea,
        this.helpRequest,
        this.instagram,
        this.instagramFollower,
        this.legalStructure,
        this.linkedin,
        this.linkedinFollower,
        this.products,
        this.projectId,
        this.relationToWijland,
        this.twitter,
        this.twitterFollower,
        this.visitingAddress,
        this.website,
        this.year});

  Entrepreneur.fromJson(Map<String, dynamic> json) {
    amount = json['amount'].toString();
    connectedToWijlandSince = json['connected_to_wijland_since'];
    facebook = json['facebook'];
    facebookFollower = json['facebook_follower'];
    focusArea = json['focus_area'];
    helpRequest = json['help_request'];
    instagram = json['instagram'];
    instagramFollower = json['instagram_follower'];
    legalStructure = json['legal_structure'];
    linkedin = json['linkedin'];
    linkedinFollower = json['linkedin_follower'];
    products = json['products'].cast<String>();
    projectId = json['project_id'];
    relationToWijland = json['relation_to_wijland'].cast<String>();
    twitter = json['twitter'];
    twitterFollower = json['twitter_follower'];
    visitingAddress = json['visiting_address'];
    website = json['website'];
    year = json['year'];
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
    data['instagram_follower'] = this.instagramFollower;
    data['legal_structure'] = this.legalStructure;
    data['linkedin'] = this.linkedin;
    data['linkedin_follower'] = this.linkedinFollower;
    data['products'] = this.products;
    data['project_id'] = this.projectId;
    data['relation_to_wijland'] = this.relationToWijland;
    data['twitter'] = this.twitter;
    data['twitter_follower'] = this.twitterFollower;
    data['visiting_address'] = this.visitingAddress;
    data['website'] = this.website;
    data['year'] = this.year;
    return data;
  }
}