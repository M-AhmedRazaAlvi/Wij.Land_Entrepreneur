// To parse this JSON data, do
//
//     final postEntrepreneurContactSubjectRequest = postEntrepreneurContactSubjectRequestFromJson(jsonString);

import 'dart:convert';

PostEntrepreneurContactSubjectRequest postEntrepreneurContactSubjectRequestFromJson(String str) => PostEntrepreneurContactSubjectRequest.fromJson(json.decode(str));

String postEntrepreneurContactSubjectRequestToJson(PostEntrepreneurContactSubjectRequest data) => json.encode(data.toJson());

class PostEntrepreneurContactSubjectRequest {
    PostEntrepreneurContactSubjectRequest({
      required  this.contactSubject,
      required  this.description,
    });

    List<String> contactSubject;
    String description;

    factory PostEntrepreneurContactSubjectRequest.fromJson(Map<String, dynamic> json) => PostEntrepreneurContactSubjectRequest(
        contactSubject: List<String>.from(json["contact_subject"].map((x) => x)),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "contact_subject": List<dynamic>.from(contactSubject.map((x) => x)),
        "description": description,
    };
}
