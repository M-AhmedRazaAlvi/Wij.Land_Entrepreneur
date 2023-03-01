class Entrepreneur {
  Entrepreneur({
    required this.connectedToWijlandSince,
    this.facebook,
    this.facebookFollower,
    required this.focusArea,
    required this.helpRequest,
    this.instagram,
    this.instagramFollower,
    required this.legalStructure,
    this.linkedin,
    this.linkedinFollower,
    required this.products,
    required this.relationToWijland,
    this.twitter,
    this.twitterFollower,
    required this.visitingAddress,
    this.website,
  });

  DateTime connectedToWijlandSince;
  String? facebook;
  int? facebookFollower;
  String focusArea;
  String helpRequest;
  String? instagram;
  int? instagramFollower;
  String legalStructure;
  String? linkedin;
  int? linkedinFollower;
  List<String> products;
  List<String> relationToWijland;
  String? twitter;
  int? twitterFollower;
  String visitingAddress;
  String? website;

  factory Entrepreneur.fromJson(Map<String, dynamic> json) => Entrepreneur(
        connectedToWijlandSince:
            DateTime.parse(json["connected_to_wijland_since"]),
        facebook: json["facebook"],
        facebookFollower: json["facebook_follower"],
        focusArea: json["focus_area"],
        helpRequest: json["help_request"],
        instagram: json["instagram"],
        instagramFollower: json["instagram_follower"],
        legalStructure: json["legal_structure"],
        linkedin: json["linkedin"],
        linkedinFollower: json["linkedin_follower"],
        products: List<String>.from(json["products"].map((x) => x)),
        relationToWijland:
            List<String>.from(json["relation_to_wijland"].map((x) => x)),
        twitter: json["twitter"],
        twitterFollower: json["twitter_follower"],
        visitingAddress: json["visiting_address"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "connected_to_wijland_since":
            "${connectedToWijlandSince.year.toString().padLeft(4, '0')}-${connectedToWijlandSince.month.toString().padLeft(2, '0')}-${connectedToWijlandSince.day.toString().padLeft(2, '0')}",
        "facebook": facebook,
        "facebook_follower": facebookFollower,
        "focus_area": focusArea,
        "help_request": helpRequest,
        "instagram": instagram,
        "instagram_follower": instagramFollower,
        "legal_structure": legalStructure,
        "linkedin": linkedin,
        "linkedin_follower": linkedinFollower,
        "products": List<dynamic>.from(products.map((x) => x)),
        "relation_to_wijland":
            List<dynamic>.from(relationToWijland.map((x) => x)),
        "twitter": twitter,
        "twitter_follower": twitterFollower,
        "visiting_address": visitingAddress,
        "website": website,
      };
}
