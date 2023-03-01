class PutFCBoerenwijzer {
  List<Data>? data;
  String? message;
  int? status;

  PutFCBoerenwijzer({this.data, this.message, this.status});

  PutFCBoerenwijzer.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? bcolor;
  String? bname;
  String? color;
  String? name;
  String? status;
  int? value;

  Data(
      {this.bcolor,
        this.bname,
        this.color,
        this.name,
        this.status,
        this.value});

  Data.fromJson(Map<String, dynamic> json) {
    bcolor = json['bcolor'];
    bname = json['bname'];
    color = json['color'];
    name = json['name'];
    status = json['status'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bcolor'] = this.bcolor;
    data['bname'] = this.bname;
    data['color'] = this.color;
    data['name'] = this.name;
    data['status'] = this.status;
    data['value'] = this.value;
    return data;
  }
}
