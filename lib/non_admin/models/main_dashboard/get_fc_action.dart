

class GetFCAction {
  List<Data>? data;
  String? message;
  int? status;

  GetFCAction({this.data, this.message, this.status});

  GetFCAction.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? actionName;
  List<DoneBy>? doneBy;
  String? doneOnDate;
  int? id;

  Data({this.actionName, this.doneBy, this.doneOnDate, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    actionName = json['action_name'];
    if (json['done_by'] != null) {
      doneBy = <DoneBy>[];
      json['done_by'].forEach((v) {
        doneBy!.add(DoneBy.fromJson(v));
      });
    }
    doneOnDate = json['done_on_date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action_name'] = actionName;
    if (doneBy != null) {
      data['done_by'] = doneBy!.map((v) => v.toJson()).toList();
    }
    data['done_on_date'] = doneOnDate;
    data['id'] = id;
    return data;
  }
}

class DoneBy {
  int? id;
  String? insertedAt;
  String? name;
  String? updatedAt;

  DoneBy({this.id, this.insertedAt, this.name, this.updatedAt});

  DoneBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['inserted_at'] = insertedAt;
    data['name'] = name;
    data['updated_at'] = updatedAt;
    return data;
  }
}
