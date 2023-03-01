class GetFCFiles {
  List<Data>? data;
  String? message;
  int? status;

  GetFCFiles({this.data, this.message, this.status});

  GetFCFiles.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? mime;
  String? path;
  String? title;

  Data({this.id, this.mime, this.path, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mime'] = mime;
    data['path'] = path;
    data['title'] = title;
    return data;
  }
}
