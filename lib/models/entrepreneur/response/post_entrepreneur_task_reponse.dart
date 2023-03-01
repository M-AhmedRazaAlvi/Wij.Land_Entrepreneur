class PostEntrepreneurTaskResponse {
  Data? data;
  String? message;
  int? status;

  PostEntrepreneurTaskResponse({this.data, this.message, this.status});

  PostEntrepreneurTaskResponse.fromJson(Map<String, dynamic> json) {
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
  AssignedTo? assignedTo;
  Object? contactSubject;
  String? dueDate;
  int? id;
  String? insertedAt;
  String? taskDescription;
  String? taskStatus;
  String? updatedAt;

  Data(
      {this.assignedTo,
        this.contactSubject,
        this.dueDate,
        this.id,
        this.insertedAt,
        this.taskDescription,
        this.taskStatus,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    assignedTo = json['assigned_to'] != null
        ? new AssignedTo.fromJson(json['assigned_to'])
        : null;
    contactSubject = json['contact_subject'];
    dueDate = json['due_date'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    taskDescription = json['task_description'];
    taskStatus = json['task_status'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assignedTo != null) {
      data['assigned_to'] = this.assignedTo!.toJson();
    }
    data['contact_subject'] = this.contactSubject;
    data['due_date'] = this.dueDate;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['task_description'] = this.taskDescription;
    data['task_status'] = this.taskStatus;
    data['updated_at'] = this.updatedAt;
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