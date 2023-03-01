class GetFarmComputerFarmNameResponse {
  Data? data;
  String? message;
  int? status;

  GetFarmComputerFarmNameResponse({this.data, this.message, this.status});

  GetFarmComputerFarmNameResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? nameAuto;

  Data({this.nameAuto});

  Data.fromJson(Map<String, dynamic> json) {
    nameAuto = json['name_auto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_auto'] = this.nameAuto;
    return data;
  }
}
