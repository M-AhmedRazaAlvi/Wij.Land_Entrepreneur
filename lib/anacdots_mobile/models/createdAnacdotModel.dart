import 'dart:convert';

CreatedAnacdotRequest createdAnacdotRequestFromJson(String str) =>
    CreatedAnacdotRequest.fromJson(json.decode(str));

String createdAnacdotRequestToJson(CreatedAnacdotRequest data) =>
    json.encode(data.toJson());

class CreatedAnacdotRequest {
  CreatedAnacdotRequest({
    this.data,
    this.message,
    this.status,
  });

  CreatedData? data;
  String? message;
  int? status;

  factory CreatedAnacdotRequest.fromJson(Map<String, dynamic> json) =>
      CreatedAnacdotRequest(
        data: CreatedData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "status": status,
      };
}

class CreatedData {
  CreatedData({
    this.anecOrgs,
    this.anecPersons,
    this.anecProjects,
    this.anecdoteFiles,
    this.anecdoteTags,
    this.createdById,
    this.date,
    this.description,
    this.id,
    this.isShared,
    this.locations,
    this.title,
  });

  List<AnecOrg>? anecOrgs;
  List<AnecPerson>? anecPersons;
  List<AnecProject>? anecProjects;
  List<dynamic>? anecdoteFiles;
  List<AnecdoteTag>? anecdoteTags;
  int? createdById;
  dynamic date;
  String? description;
  int? id;
  bool? isShared;
  Locations? locations;
  String? title;

  factory CreatedData.fromJson(Map<String, dynamic> json) => CreatedData(
        anecOrgs: List<AnecOrg>.from(
            json["anec_orgs"].map((x) => AnecOrg.fromJson(x))),
        anecPersons: List<AnecPerson>.from(
            json["anec_persons"].map((x) => AnecPerson.fromJson(x))),
        anecProjects: List<AnecProject>.from(
            json["anec_projects"].map((x) => AnecProject.fromJson(x))),
        anecdoteFiles: List<dynamic>.from(json["anecdote_files"].map((x) => x)),
        anecdoteTags: List<AnecdoteTag>.from(
            json["anecdote_tags"].map((x) => AnecdoteTag.fromJson(x))),
        createdById: json["created_by_id"],
        date: DateTime.parse(json["date"]),
        description: json["description"],
        id: json["id"],
        isShared: json["is_shared"],
        locations: Locations.fromJson(json["locations"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "anec_orgs": List<dynamic>.from(anecOrgs!.map((x) => x.toJson())),
        "anec_persons": List<dynamic>.from(anecPersons!.map((x) => x.toJson())),
        "anec_projects":
            List<dynamic>.from(anecProjects!.map((x) => x.toJson())),
        "anecdote_files": List<dynamic>.from(anecdoteFiles!.map((x) => x)),
        "anecdote_tags":
            List<dynamic>.from(anecdoteTags!.map((x) => x.toJson())),
        "created_by_id": createdById,
        "date": date,
        "description": description,
        "id": id,
        "is_shared": isShared,
        "locations": locations!.toJson(),
        "title": title,
      };
}

class AnecOrg {
  AnecOrg({
    this.orgId,
    this.orgName,
  });

  int? orgId;
  String? orgName;

  factory AnecOrg.fromJson(Map<String, dynamic> json) => AnecOrg(
        orgId: json["org_id"],
        orgName: json["org_name"],
      );

  Map<String, dynamic> toJson() => {
        "org_id": orgId,
        "org_name": orgName,
      };
}

class AnecPerson {
  AnecPerson({
    this.personId,
    this.personName,
  });

  int? personId;
  String? personName;

  factory AnecPerson.fromJson(Map<String, dynamic> json) => AnecPerson(
        personId: json["person_id"],
        personName: json["person_name"],
      );

  Map<String, dynamic> toJson() => {
        "person_id": personId,
        "person_name": personName,
      };
}

class AnecProject {
  AnecProject({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory AnecProject.fromJson(Map<String, dynamic> json) => AnecProject(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class AnecdoteTag {
  AnecdoteTag({
    this.id,
    this.tag,
  });

  int? id;
  String? tag;

  factory AnecdoteTag.fromJson(Map<String, dynamic> json) => AnecdoteTag(
        id: json["id"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
      };
}

class Locations {
  Locations({
    this.address,
    this.city,
    this.country,
    this.houseNumber,
    this.lat,
    this.long,
    this.municipality,
    this.province,
    this.zipCodeNumber,
  });

  String? address;
  String? city;
  String? country;
  String? houseNumber;
  String? lat;
  String? long;
  String? municipality;
  String? province;
  String? zipCodeNumber;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        address: json["address"],
        city: json["city"],
        country: json["country"],
        houseNumber: json["house_number"],
        lat: json["lat"],
        long: json["long"],
        municipality: json["municipality"],
        province: json["province"],
        zipCodeNumber: json["zip_code_number"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "country": country,
        "house_number": houseNumber,
        "lat": lat,
        "long": long,
        "municipality": municipality,
        "province": province,
        "zip_code_number": zipCodeNumber,
      };
}
