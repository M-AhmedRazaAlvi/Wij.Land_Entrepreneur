
import 'dart:convert';

PostEntrepreneurSupplierRequest postEntrepreneurSupplierRequestFromJson(String str) => PostEntrepreneurSupplierRequest.fromJson(json.decode(str));

String postEntrepreneurSupplierRequestToJson(PostEntrepreneurSupplierRequest data) => json.encode(data.toJson());

class PostEntrepreneurSupplierRequest {
  PostEntrepreneurSupplierRequest({
    this.connectSince,
  required  this.farmId,
  required  this.phoneNumber,
  required  this.wiRelationType,
  });

  String? connectSince;
  int? farmId;
  String? wiRelationType;
  String? phoneNumber;

  factory PostEntrepreneurSupplierRequest.fromJson(Map<String, dynamic> json) => PostEntrepreneurSupplierRequest(
    connectSince: json["connect_since"],
    farmId: json["farm_id"],
    wiRelationType: json["wi_relation_type"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "connect_since": connectSince,
    "farm_id": farmId,
    "phone_number": phoneNumber,
    "wi_relation_type": wiRelationType,
  };
}
