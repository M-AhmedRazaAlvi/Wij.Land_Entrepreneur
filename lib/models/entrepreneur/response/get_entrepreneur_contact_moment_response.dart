class GetEntrepreneurContactMomentResponse {
  List<ContactMomentsModel>? data;
  String? message;
  int? status;

  GetEntrepreneurContactMomentResponse({this.data, this.message, this.status});

  GetEntrepreneurContactMomentResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ContactMomentsModel>[];
      json['data'].forEach((v) {
        data!.add(new ContactMomentsModel.fromJson(v));
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

class ContactMomentsModel {
  String? attendeeNote;
  List<Attendees>? attendees;
  String? contactMomentDate;
  String? contactMomentType;
  String? contactNotes;
  String? contactSubject;
  List<ContactSubjects>? contactSubjects;
  int? farmId;
  int? id;
  int? projectId;
  List<Tasks>? tasks;

  ContactMomentsModel(
      {this.attendeeNote,
        this.attendees,
        this.contactMomentDate,
        this.contactMomentType,
        this.contactNotes,
        this.contactSubject,
        this.contactSubjects,
        this.farmId,
        this.id,
        this.projectId,
        this.tasks});

  ContactMomentsModel.fromJson(Map<String, dynamic> json) {
    attendeeNote = json['attendee_note'];
    if (json['attendees'] != null) {
      attendees = <Attendees>[];
      json['attendees'].forEach((v) {
        attendees!.add(new Attendees.fromJson(v));
      });
    }
    contactMomentDate = json['contact_moment_date'];
    contactMomentType = json['contact_moment_type'];
    contactNotes = json['contact_notes'];
    contactSubject = json['contact_subject'];
    if (json['contact_subjects'] != null) {
      contactSubjects = <ContactSubjects>[];
      json['contact_subjects'].forEach((v) {
        contactSubjects!.add(new ContactSubjects.fromJson(v));
      });
    }
    farmId = json['farm_id'];
    id = json['id'];
    projectId = json['project_id'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendee_note'] = this.attendeeNote;
    if (this.attendees != null) {
      data['attendees'] = this.attendees!.map((v) => v.toJson()).toList();
    }
    data['contact_moment_date'] = this.contactMomentDate;
    data['contact_moment_type'] = this.contactMomentType;
    data['contact_notes'] = this.contactNotes;
    data['contact_subject'] = this.contactSubject;
    if (this.contactSubjects != null) {
      data['contact_subjects'] =
          this.contactSubjects!.map((v) => v.toJson()).toList();
    }
    data['farm_id'] = this.farmId;
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
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

class ContactSubjects {
  String? description;
  int? id;
  String? insertedAt;
  List<String>? subject;
  String? updatedAt;
  Object? writtenBy;
  int? writtenById;

  ContactSubjects(
      {this.description,
        this.id,
        this.insertedAt,
        this.subject,
        this.updatedAt,
        this.writtenBy,
        this.writtenById});

  ContactSubjects.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    subject = json['subject'].cast<String>();
    updatedAt = json['updated_at'];
    writtenBy = json['written_by'];
    writtenById = json['written_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['subject'] = this.subject;
    data['updated_at'] = this.updatedAt;
    data['written_by'] = this.writtenBy;
    data['written_by_id'] = this.writtenById;
    return data;
  }
}

class Tasks {
  AssignedTo? assignedTo;
  Object? contactMoment;
  Object? contactSubject;
  Object? farm;
  int? id;
  Object? project;
  String? taskDescription;
  String? taskDueDate;
  List<String>? taskStatus;

  Tasks(
      {this.assignedTo,
        this.contactMoment,
        this.contactSubject,
        this.farm,
        this.id,
        this.project,
        this.taskDescription,
        this.taskDueDate,
        this.taskStatus});

  Tasks.fromJson(Map<String, dynamic> json) {
    assignedTo = json['assigned_to'] != null
        ? new AssignedTo.fromJson(json['assigned_to'])
        : null;
    contactMoment = json['contact_moment'];
    contactSubject = json['contact_subject'];
    farm = json['farm'];
    id = json['id'];
    project = json['project'];
    taskDescription = json['task_description'];
    taskDueDate = json['task_due_date'];
    taskStatus = json['task_status'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assignedTo != null) {
      data['assigned_to'] = this.assignedTo!.toJson();
    }
    data['contact_moment'] = this.contactMoment;
    data['contact_subject'] = this.contactSubject;
    data['farm'] = this.farm;
    data['id'] = this.id;
    data['project'] = this.project;
    data['task_description'] = this.taskDescription;
    data['task_due_date'] = this.taskDueDate;
    data['task_status'] = this.taskStatus;
    return data;
  }
}

class AssignedTo {
  String? firstName;
  int? id;
  String? lastName;

  AssignedTo({this.firstName, this.id, this.lastName});

  AssignedTo.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    return data;
  }
}