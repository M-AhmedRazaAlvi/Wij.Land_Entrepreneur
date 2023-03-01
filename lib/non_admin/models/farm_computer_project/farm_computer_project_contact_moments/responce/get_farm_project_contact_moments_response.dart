class GetFarmProjectContactMomentsResponse {
  List<Data>? data;
  String? message;
  int? status;
  Error? error;

  GetFarmProjectContactMomentsResponse(
      {this.data, this.message, this.status, this.error});

  GetFarmProjectContactMomentsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  String? attendeeNote;
  List<Attendees>? attendees;
  String? contactMomentDate;
  List<ContactMomentsType>? contactMomentsType;
  String? contactNotes;
  String? contactSubject;
  Farm? farm;
  int? id;
  String? insertedAt;
  //Attendees? organization;
  Project? project;
  String? updatedAt;

  Data(
      {this.attendeeNote,
      this.attendees,
      this.contactMomentDate,
      this.contactMomentsType,
      this.contactNotes,
      this.contactSubject,
      this.farm,
      this.id,
      this.insertedAt,

      //this.organization,
      this.project,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    attendeeNote = json['attendee_note'];
    if (json['attendees'] != null) {
      attendees = <Attendees>[];
      json['attendees'].forEach((v) {
        attendees!.add(new Attendees.fromJson(v));
      });
    }
    contactMomentDate = json['contact_moment_date'];
    if (json['contact_moments_type'] != null) {
      contactMomentsType = <ContactMomentsType>[];
      json['contact_moments_type'].forEach((v) {
        contactMomentsType!.add(new ContactMomentsType.fromJson(v));
      });
    }
    contactNotes = json['contact_notes'];
    contactSubject = json['contact_subject'];
    farm = json['farm'] != null ? new Farm.fromJson(json['farm']) : null;
    id = json['id'];
    insertedAt = json['inserted_at'];
    // organization = json['organization'] != null
    //     ? new Attendees.fromJson(json['organization'])
    //     : null;
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendee_note'] = this.attendeeNote;
    if (this.attendees != null) {
      data['attendees'] = this.attendees!.map((v) => v.toJson()).toList();
    }
    data['contact_moment_date'] = this.contactMomentDate;
    if (this.contactMomentsType != null) {
      data['contact_moments_type'] =
          this.contactMomentsType!.map((v) => v.toJson()).toList();
    }
    data['contact_notes'] = this.contactNotes;
    data['contact_subject'] = this.contactSubject;
    if (this.farm != null) {
      data['farm'] = this.farm!.toJson();
    }
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    // if (this.organization != null) {
    //   data['organization'] = this.organization!.toJson();
    // }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Attendees {
  int? id;
  String? insertedAt;
  String? name;
  String? updatedAt;

  Attendees({this.id, this.insertedAt, this.name, this.updatedAt});

  Attendees.fromJson(Map<String, dynamic> json) {
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

class ContactMomentsType {
  String? icon;
  String? name;

  ContactMomentsType({this.icon, this.name});

  ContactMomentsType.fromJson(Map<String, dynamic> json) {
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

class Farm {
  String? farmName;
  int? id;

  Farm({this.farmName, this.id});

  Farm.fromJson(Map<String, dynamic> json) {
    farmName = json['farm_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farm_name'] = this.farmName;
    data['id'] = this.id;
    return data;
  }
}

class Project {
  String? description;
  bool? internalProject;
  int? projectId;
  String? projectName;
  List<String>? projectStatus;
  String? startDate;

  Project(
      {this.description,
      this.internalProject,
      this.projectId,
      this.projectName,
      this.projectStatus,
      this.startDate});

  Project.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    internalProject = json['internal_project'];
    projectId = json['project_id'];
    projectName = json['project_name'];
    projectStatus = json['project_status'].cast<String>();
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['internal_project'] = this.internalProject;
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    data['project_status'] = this.projectStatus;
    data['start_date'] = this.startDate;
    return data;
  }
}



class Error {
  String? message;
  int? status;

  Error({this.message, this.status});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
