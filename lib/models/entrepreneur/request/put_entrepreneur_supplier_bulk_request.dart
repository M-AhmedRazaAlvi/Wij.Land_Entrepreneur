


import 'dart:convert';

PutEntrepreneurSupplierBulkRequest putEntrepreneurSupplierBulkRequestFromJson(String str) => PutEntrepreneurSupplierBulkRequest.fromJson(json.decode(str));

String putEntrepreneurSupplierBulkRequestToJson(PutEntrepreneurSupplierBulkRequest data) => json.encode(data.toJson());



class PutEntrepreneurSupplierBulkRequest {
  String? connectSince;
  List<dynamic>? suppliersIds;
  String? wiRelationType;

  PutEntrepreneurSupplierBulkRequest(
      {this.connectSince, this.suppliersIds, this.wiRelationType});

  PutEntrepreneurSupplierBulkRequest.fromJson(Map<String, dynamic> json) {
    connectSince = json['connect_since'];
    suppliersIds = json['suppliers_ids'].cast<dynamic>();
    wiRelationType = json['wi_relation_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['connect_since'] = connectSince;
    data['suppliers_ids'] = suppliersIds;
    data['wi_relation_type'] = wiRelationType;
    return data;
  }
}