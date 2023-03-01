class GetFCWaterBoardDropDown {
  List<dynamic>? data;
  String? message;
  int? status;
  Error? error;
  String? errors;
  GetFCWaterBoardDropDown({this.data, this.message, this.status});

  GetFCWaterBoardDropDown.fromJson(Map<String, dynamic> json) {
    if(json.containsKey("data")) {
      data = json['data'].cast<String>();
    }

    if (json.containsKey("message")) {
      message = json['message'];
    }

    if (json.containsKey("status")) {
      status = json['status'];
    }

    if (json['error'] != null && json['error']=="Unauthorized") {
      errors = json['error'];
    }else{
      error = json['error'] != null ? Error.fromJson(json['error']) : null;
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['status'] = this.status;
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
