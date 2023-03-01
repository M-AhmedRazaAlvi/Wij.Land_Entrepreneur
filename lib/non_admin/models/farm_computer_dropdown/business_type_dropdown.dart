

class BusinessTypeDropDown {
  List<String>? data=[];
  String? message;
  int? status;
  dynamic error;

  BusinessTypeDropDown({this.data, this.message, this.status,this.error});

  BusinessTypeDropDown.fromJson(Map<String, dynamic> json) {
    if(json.containsKey("data")) {
      data = json['data'].cast<String>();
    }
      if (json.containsKey("message")) {
        message = json['message'];
      }

      if (json.containsKey("status")) {
        status = json['status'];
      }

      if (json['error'] != null) {
        error = json['error'];
      }
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['message'] = message;
    data['status'] = status;
    data['error'] = error;
    return data;
  }
}
