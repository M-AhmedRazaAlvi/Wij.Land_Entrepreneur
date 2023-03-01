import 'package:wij_land/models/entrepreneur/role.dart';

class Person {
  Person({
    required this.email,
    required this.id,
    this.imagePath,
    required this.name,
    required this.phone,
    required this.role,
  });

  String email;
  int id;
  dynamic imagePath;
  String name;
  String phone;
  List<Role> role;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        email: json["email"],
        id: json["id"],
        imagePath: json["image_path"],
        name: json["name"],
        phone: json["phone"],
        role: List<Role>.from(json["role"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "image_path": imagePath,
        "name": name,
        "phone": phone,
        "role": List<dynamic>.from(role.map((x) => x.toJson())),
      };
}
