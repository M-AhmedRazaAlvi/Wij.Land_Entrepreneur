class UpdateTaskContactMomentOfEntrepreneur {
  String? assignedToId;
  String? farmId;
  String? projectId;
  String? taskDescription;
  String? taskDueDate;
  List<String>? taskStatus;

  UpdateTaskContactMomentOfEntrepreneur(
      {this.assignedToId,
        this.farmId,
        this.projectId,
        this.taskDescription,
        this.taskDueDate,
        this.taskStatus});

  UpdateTaskContactMomentOfEntrepreneur.fromJson(Map<String, dynamic> json) {
    assignedToId = json['assigned_to_id'];
    farmId = json['farm_id'];
    projectId = json['project_id'];
    taskDescription = json['task_description'];
    taskDueDate = json['task_due_date'];
    taskStatus = json['task_status'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assigned_to_id'] = this.assignedToId;
    data['farm_id'] = this.farmId;
    data['project_id'] = this.projectId;
    data['task_description'] = this.taskDescription;
    data['task_due_date'] = this.taskDueDate;
    data['task_status'] = this.taskStatus;
    return data;
  }
}