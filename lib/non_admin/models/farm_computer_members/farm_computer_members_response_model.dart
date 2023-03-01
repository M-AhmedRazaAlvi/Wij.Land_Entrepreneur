class GetFarmComputerMembersResponseModel {
  List<Data>? data;
  String? message;
  int? status;

  GetFarmComputerMembersResponseModel({this.data, this.message, this.status});

  GetFarmComputerMembersResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? comment;
  String? emailAddress;
  int? id;
  String? joinDate;
  String? name;
  String? phoneNumberMobile;
  List<String>? role;

  Data(
      {this.comment,
        this.emailAddress,
        this.id,
        this.joinDate,
        this.name,
        this.phoneNumberMobile,
        this.role});

  Data.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    emailAddress = json['email_address'];
    id = json['id'];
    joinDate = json['join_date'];
    name = json['name'];
    phoneNumberMobile = json['phone_number_mobile'];
    role = json['role'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['email_address'] = this.emailAddress;
    data['id'] = this.id;
    data['join_date'] = this.joinDate;
    data['name'] = this.name;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    data['role'] = this.role;
    return data;
  }
}
