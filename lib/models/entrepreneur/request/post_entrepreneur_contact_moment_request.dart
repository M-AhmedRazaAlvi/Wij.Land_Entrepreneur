class PostEntrepreneurContactMomentRequest {
  String? attendeeNotes;
  List<String>? attendees;
  String? contactMomentDate;
  List<String>? contactMomentType;
  String? contactNotes;
  String? contactSubject;
  List<ContactSubjectsPost>? contactSubjects;
  String? farmId;
  String? projectId;
  List<TasksPost>? tasks;

  PostEntrepreneurContactMomentRequest(
      {this.attendeeNotes,
        this.attendees,
        this.contactMomentDate,
        this.contactMomentType,
        this.contactNotes,
        this.contactSubject,
        this.contactSubjects,
        this.farmId,
        this.projectId,
        this.tasks});

  PostEntrepreneurContactMomentRequest.fromJson(Map<String, dynamic> json) {
    attendeeNotes = json['attendee_notes'];
    attendees = json['attendees'].cast<String>();
    contactMomentDate = json['contact_moment_date'];
    contactMomentType = json['contact_moment_type'].cast<String>();
    contactNotes = json['contact_notes'];
    contactSubject = json['contact_subject'];
    if (json['contact_subjects'] != null) {
      contactSubjects = <ContactSubjectsPost>[];
      json['contact_subjects'].forEach((v) {
        contactSubjects!.add(new ContactSubjectsPost.fromJson(v));
      });
    }
    farmId = json['farm_id'];
    projectId = json['project_id'];
    if (json['tasks'] != null) {
      tasks = <TasksPost>[];
      json['tasks'].forEach((v) {
        tasks!.add(new TasksPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendee_notes'] = this.attendeeNotes;
    data['attendees'] = this.attendees;
    data['contact_moment_date'] = this.contactMomentDate;
    data['contact_moment_type'] = this.contactMomentType;
    data['contact_notes'] = this.contactNotes;
    data['contact_subject'] = this.contactSubject;
    if (this.contactSubjects != null) {
      data['contact_subjects'] =
          this.contactSubjects!.map((v) => v.toJson()).toList();
    }
    data['farm_id'] = this.farmId;
    data['project_id'] = this.projectId;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactSubjectsPost {
  List<String>? contactSubject;
  String? description;

  ContactSubjectsPost({this.contactSubject, this.description});

  ContactSubjectsPost.fromJson(Map<String, dynamic> json) {
    contactSubject = json['contact_subject'].cast<String>();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_subject'] = this.contactSubject;
    data['description'] = this.description;
    return data;
  }
}

class TasksPost {
  String? assignedById;
  String? assignedToId;
  String? farmId;
  String? projectId;
  String? taskDescription;
  String? taskDueDate;
  List<String>? taskStatus;

  TasksPost(
      {this.assignedById,
        this.assignedToId,
        this.farmId,
        this.projectId,
        this.taskDescription,
        this.taskDueDate,
        this.taskStatus});

  TasksPost.fromJson(Map<String, dynamic> json) {
    assignedById = json['assigned_by_id'];
    assignedToId = json['assigned_to_id'];
    farmId = json['farm_id'];
    projectId = json['project_id'];
    taskDescription = json['task_description'];
    taskDueDate = json['task_due_date'];
    taskStatus = json['task_status'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assigned_by_id'] = this.assignedById;
    data['assigned_to_id'] = this.assignedToId;
    data['farm_id'] = this.farmId;
    data['project_id'] = this.projectId;
    data['task_description'] = this.taskDescription;
    data['task_due_date'] = this.taskDueDate;
    data['task_status'] = this.taskStatus;
    return data;
  }
}