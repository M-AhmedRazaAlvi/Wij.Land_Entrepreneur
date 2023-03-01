class GetFarmComputerActionsDropdown {
  List<ActionData>? data;
  String? message;
  int? status;

  GetFarmComputerActionsDropdown({this.data, this.message, this.status});

  GetFarmComputerActionsDropdown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ActionData>[];
      json['data'].forEach((v) {
        data!.add(new ActionData.fromJson(v));
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

class ActionData {
  int? id;
  String? name;

  ActionData({this.id, this.name});

  ActionData.fromJson(Map<String, dynamic> json) {
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
