import 'dart:convert';

PutEntrepreneurSupplierRequest putEntrepreneurSupplierRequestFromJson(String str) => PutEntrepreneurSupplierRequest.fromJson(json.decode(str));

String putEntrepreneurSupplierRequestToJson(PutEntrepreneurSupplierRequest data) => json.encode(data.toJson());

class PutEntrepreneurSupplierRequest {
  String? message;

  PutEntrepreneurSupplierRequest({this.connectSince, this.farmId, this.wiRelationType, this.message, this.phoneNum});

  String? connectSince;
  String? farmId;
  String? phoneNum;
  String? wiRelationType;

  factory PutEntrepreneurSupplierRequest.fromJson(Map<String, dynamic> json) => PutEntrepreneurSupplierRequest(
        connectSince: json["connect_since"],
        farmId: json["farm_id"],
        phoneNum: json["phone_number"],
        wiRelationType: json["wi_relation_type"],
      );

  Map<String, dynamic> toJson() => {
        "connect_since": connectSince,
        "farm_id": farmId,
        "wi_relation_type": wiRelationType,
        "phone_number": phoneNum,
      };
}
