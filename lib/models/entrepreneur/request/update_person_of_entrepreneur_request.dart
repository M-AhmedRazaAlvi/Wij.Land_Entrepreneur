


class UpdatePersonOfEntrepreneur {
  String? comment;
  String? date;
  String? personId;
  String? position;
  List<String>? role;
  Error? error;

  UpdatePersonOfEntrepreneur(
      {this.comment, this.date, this.personId, this.position, this.role});

  UpdatePersonOfEntrepreneur.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    date = json['date'];
    personId = json['person_id'].cast<String>();
    position = json['position'];
    role = json['role'].cast<String>();
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['date'] = date;
    data['person_id'] = personId;
    data['position'] = position;
    data['role'] = role;
    if (error != null) {
      data['error'] = this.error!.toJson();
    }
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
