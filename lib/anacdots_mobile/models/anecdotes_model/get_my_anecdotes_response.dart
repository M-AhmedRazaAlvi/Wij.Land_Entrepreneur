class GetMyAnecdotesResponse {
  List<DataModel>? data;
  String? message;
  int? status;

  GetMyAnecdotesResponse({this.data, this.message, this.status});

  GetMyAnecdotesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(new DataModel.fromJson(v));
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

class DataModel {
  List<AnecOrgs>? anecOrgs;
  List<AnecPersons>? anecPersons;
  List<AnecProjects>? anecProjects;
  List<AnecdoteFiles>? anecdoteFiles;
  List<String>? anecdoteTags;
  int? createdById;
  String? date;
  String? description;
  int? id;
  bool? isShared;
  String? locationDescription;
  Locations? locations;
  String? title;

  DataModel(
      {this.anecOrgs,
      this.anecPersons,
      this.anecProjects,
      this.anecdoteFiles,
      this.anecdoteTags,
      this.createdById,
      this.date,
      this.description,
      this.id,
      this.isShared,
      this.locationDescription,
      this.locations,
      this.title});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['anec_orgs'] != null) {
      anecOrgs = <AnecOrgs>[];
      json['anec_orgs'].forEach((v) {
        anecOrgs!.add(new AnecOrgs.fromJson(v));
      });
    }
    if (json['anec_persons'] != null) {
      anecPersons = <AnecPersons>[];
      json['anec_persons'].forEach((v) {
        anecPersons!.add(new AnecPersons.fromJson(v));
      });
    }
    if (json['anec_projects'] != null) {
      anecProjects = <AnecProjects>[];
      json['anec_projects'].forEach((v) {
        anecProjects!.add(new AnecProjects.fromJson(v));
      });
    }
    if (json['anecdote_files'] != null) {
      anecdoteFiles = <AnecdoteFiles>[];
      json['anecdote_files'].forEach((v) {
        anecdoteFiles!.add(new AnecdoteFiles.fromJson(v));
      });
    }
    anecdoteTags = json['anecdote_tags'].cast<String>();
    createdById = json['created_by_id'];
    date = json['date'];
    description = json['description'];
    id = json['id'];
    isShared = json['is_shared'];
    locationDescription = json['location_description'];
    locations = json['locations'] != null
        ? new Locations.fromJson(json['locations'])
        : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.anecOrgs != null) {
      data['anec_orgs'] = this.anecOrgs!.map((v) => v.toJson()).toList();
    }
    if (this.anecPersons != null) {
      data['anec_persons'] = this.anecPersons!.map((v) => v.toJson()).toList();
    }
    if (this.anecProjects != null) {
      data['anec_projects'] =
          this.anecProjects!.map((v) => v.toJson()).toList();
    }
    if (this.anecdoteFiles != null) {
      data['anecdote_files'] =
          this.anecdoteFiles!.map((v) => v.toJson()).toList();
    }
    data['anecdote_tags'] = this.anecdoteTags;
    data['created_by_id'] = this.createdById;
    data['date'] = this.date;
    data['description'] = this.description;
    data['id'] = this.id;
    data['is_shared'] = this.isShared;
    data['location_description'] = this.locationDescription;
    if (this.locations != null) {
      data['locations'] = this.locations!.toJson();
    }
    data['title'] = this.title;
    return data;
  }
}

class AnecOrgs {
  int? orgId;
  String? orgName;

  AnecOrgs({this.orgId, this.orgName});

  AnecOrgs.fromJson(Map<String, dynamic> json) {
    orgId = json['org_id'];
    orgName = json['org_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['org_id'] = this.orgId;
    data['org_name'] = this.orgName;
    return data;
  }
}

class AnecPersons {
  int? personId;
  String? personName;

  AnecPersons({this.personId, this.personName});

  AnecPersons.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    personName = json['person_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_id'] = this.personId;
    data['person_name'] = this.personName;
    return data;
  }
}

class AnecProjects {
  int? id;
  String? name;

  AnecProjects({this.id, this.name});

  AnecProjects.fromJson(Map<String, dynamic> json) {
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

class AnecdoteFiles {
  int? id;
  String? name;
  String? path;

  AnecdoteFiles({this.id, this.name, this.path});

  AnecdoteFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['path'] = this.path;
    return data;
  }
}

class Locations {
  String? address;
  String? city;
  String? country;
  String? houseNumber;
  String? lat;
  String? long;
  String? municipality;
  String? province;
  String? zipCodeNumber;

  Locations(
      {this.address,
      this.city,
      this.country,
      this.houseNumber,
      this.lat,
      this.long,
      this.municipality,
      this.province,
      this.zipCodeNumber});

  Locations.fromJson(Map<String, dynamic> json) {
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
