class ProductsDropDownModel {
  List<String>? data;
  String? message;
  int? status;

  ProductsDropDownModel({this.data, this.message, this.status});

  ProductsDropDownModel.fromJson(Map<String, dynamic> json) {
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