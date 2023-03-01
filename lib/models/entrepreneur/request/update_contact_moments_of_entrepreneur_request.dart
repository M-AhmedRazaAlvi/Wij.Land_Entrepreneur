class UpdateContactMomentOfEntrepreneur {
  List? attendees;
  String? contactMomentDate;
  List? contactMomentType;
  String? contactNotes;
  String? contactSubject;
  String? farmId;
  String? projectId;

  UpdateContactMomentOfEntrepreneur(
      {this.attendees,
      this.contactMomentDate,
      this.contactMomentType,
      this.contactNotes,
      this.contactSubject,
      this.farmId,
      this.projectId});

  UpdateContactMomentOfEntrepreneur.fromJson(Map<String, dynamic> json) {
    attendees = json['attendees'].cast<String>();
    contactMomentDate = json['contact_moment_date'];
    contactMomentType = json['contact_moment_type'].cast<String>();
    contactNotes = json['contact_notes'];
    contactSubject = json['contact_subject'];
    farmId = json['farm_id'];
    projectId = json['project_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendees'] = this.attendees;
    data['contact_moment_date'] = this.contactMomentDate;
    data['contact_moment_type'] = this.contactMomentType;
    data['contact_notes'] = this.contactNotes;
    data['contact_subject'] = this.contactSubject;
    data['farm_id'] = this.farmId;
    data['project_id'] = this.projectId;
    return data;
  }
}
