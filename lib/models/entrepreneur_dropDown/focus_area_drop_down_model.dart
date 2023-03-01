class FocusAreaDropDownModel {
  List<String>? data;
  String? message;
  int? status;

  FocusAreaDropDownModel({this.data, this.message, this.status});

  FocusAreaDropDownModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<String>();
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}