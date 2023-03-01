class AttendeesDropdown {
  List<AttendeesData>? data=[];
  String? message;
  int? status;

  AttendeesDropdown({this.data, this.message, this.status});

  AttendeesDropdown.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AttendeesData>[];
      json['data'].forEach((v) {
        data!.add(new AttendeesData.fromJson(v));
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

class AttendeesData {
  int? id;
  String? name;

  AttendeesData({this.id, this.name});

  AttendeesData.fromJson(Map<String, dynamic> json) {
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
