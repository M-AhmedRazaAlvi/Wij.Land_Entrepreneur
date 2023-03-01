class AnecdotPostModel {
  Anecdote? anecdote;

  AnecdotPostModel({this.anecdote});

  AnecdotPostModel.fromJson(Map<String, dynamic> json) {
    anecdote = json['anecdote'] != null
        ? new Anecdote.fromJson(json['anecdote'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.anecdote != null) {
      data['anecdote'] = this.anecdote!.toJson();
    }
    return data;
  }
}

class Anecdote {
  AnecdoteTags? anecdoteTags;
  String? date;
  String? description;
  List<int>? fileIds;
  bool? isShared;
  String? locationDescription;
  AnecdotLocation? locations;
  String? title;

  Anecdote(
      {this.anecdoteTags,
      this.date,
      this.description,
      this.fileIds,
      this.isShared,
      this.locationDescription,
      this.locations,
      this.title});

  Anecdote.fromJson(Map<String, dynamic> json) {
    anecdoteTags = json['anecdote_tags'] != null
        ? new AnecdoteTags.fromJson(json['anecdote_tags'])
        : null;
    date = json['date'];
    description = json['description'];
    fileIds = json['file_ids'].cast<int>();
    isShared = json['is_shared'];
    locationDescription = json['location_description'];
    locations = json['locations'] != null
        ? new AnecdotLocation.fromJson(json['locations'])
        : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.anecdoteTags != null) {
      data['anecdote_tags'] = this.anecdoteTags!.toJson();
    }
    data['date'] = this.date;
    data['description'] = this.description;
    data['file_ids'] = this.fileIds;
    data['is_shared'] = this.isShared;
    data['location_description'] = this.locationDescription;
    if (this.locations != null) {
      data['locations'] = this.locations!.toJson();
    }
    data['title'] = this.title;
    return data;
  }
}

class AnecdoteTags {
  List<int>? organizationId;
  List<int>? personId;
  List<int>? projectId;
  List<String>? tag;

  AnecdoteTags({this.organizationId, this.personId, this.projectId, this.tag});

  AnecdoteTags.fromJson(Map<String, dynamic> json) {
    organizationId = json['organization_id'].cast<int>();
    personId = json['person_id'].cast<int>();
    projectId = json['project_id'].cast<int>();
    tag = json['tag'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization_id'] = this.organizationId;
    data['person_id'] = this.personId;
    data['project_id'] = this.projectId;
    data['tag'] = this.tag;
    return data;
  }
}

class AnecdotLocation {
  String? address;
  String? city;
  String? country;
  String? houseNumber;
  String? lat;
  String? long;
  String? municipality;
  String? province;
  String? zipCodeNumber;

  AnecdotLocation(
      {this.address,
      this.city,
      this.country,
      this.houseNumber,
      this.lat,
      this.long,
      this.municipality,
      this.province,
      this.zipCodeNumber});

  AnecdotLocation.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    country = json['country'];
    houseNumber = json['house_number'];
    lat = json['lat'];
    long = json['long'];
    municipality = json['municipality'];
    province = json['province'];
    zipCodeNumber = json['zip_code_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['house_number'] = this.houseNumber;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['municipality'] = this.municipality;
    data['province'] = this.province;
    data['zip_code_number'] = this.zipCodeNumber;
    return data;
  }
}
