class Role {
    Role({
      required  this.data,
      required  this.message,
      required  this.statusCode,
    });

    RoleData data;
    String message;
    int statusCode;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        data: RoleData.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status_code": statusCode,
    };
}

class RoleData {
    RoleData({
      required  this.id,
       required this.role,
    });

    int id;
    List<String> role;

    factory RoleData.fromJson(Map<String, dynamic> json) => RoleData(
        id: json["id"],
        role: List<String>.from(json["role"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": List<dynamic>.from(role.map((x) => x)),
    };
}
