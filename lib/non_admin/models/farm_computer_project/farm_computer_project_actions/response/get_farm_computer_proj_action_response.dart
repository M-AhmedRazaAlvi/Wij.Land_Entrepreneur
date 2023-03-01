// To parse this JSON data, do
//
//     final getFarmComputerProjectActionResponse = getFarmComputerProjectActionResponseFromJson(jsonString);

import 'dart:convert';

GetFarmComputerProjectActionResponse getFarmComputerProjectActionResponseFromJson(String str) => GetFarmComputerProjectActionResponse.fromJson(json.decode(str));

String getFarmComputerProjectActionResponseToJson(GetFarmComputerProjectActionResponse data) => json.encode(data.toJson());

class GetFarmComputerProjectActionResponse {
  GetFarmComputerProjectActionResponse({
    this.data,
    this.message,
    this.status,
  });

  List<Datum>? data;
  String? message;
  int? status;

  factory GetFarmComputerProjectActionResponse.fromJson(Map<String, dynamic> json) => GetFarmComputerProjectActionResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class Datum {
  Datum({
    this.actionDoneBy,
    this.actionName,
    this.actionType,
    this.doneOnDate,
    this.id,
    this.insertedAt,
    this.parcels,
    this.subParcels,
    this.updatedAt,
  });

  List<ActionDoneBy>? actionDoneBy;
  String? actionName;
  List<String>? actionType;
  String? doneOnDate;
  int? id;
  dynamic insertedAt;
  List<Parcel>? parcels;
  List<dynamic>? subParcels;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    actionDoneBy: List<ActionDoneBy>.from(json["action_done_by"].map((x) => ActionDoneBy.fromJson(x))),
    actionName: json["action_name"],
    actionType: List<String>.from(json["action_type"].map((x) => x)),
    doneOnDate: json["done_on_date"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    parcels: List<Parcel>.from(json["parcels"].map((x) => Parcel.fromJson(x))),
    subParcels: List<dynamic>.from(json["sub_parcels"].map((x) => x)),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "action_done_by": List<dynamic>.from(actionDoneBy!.map((x) => x.toJson())),
    "action_name": actionName,
    "action_type": List<dynamic>.from(actionType!.map((x) => x)),
    "done_on_date": doneOnDate,
    "id": id,
    "inserted_at": insertedAt!.toIso8601String(),
    "parcels": List<dynamic>.from(parcels!.map((x) => x.toJson())),
    "sub_parcels": List<dynamic>.from(subParcels!.map((x) => x)),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class ActionDoneBy {
  ActionDoneBy({
    this.id,
    this.insertedAt,
    this.name,
    this.updatedAt,
  });

  int? id;
  DateTime? insertedAt;
  String? name;
  DateTime? updatedAt;

  factory ActionDoneBy.fromJson(Map<String, dynamic> json) => ActionDoneBy(
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    name: json["name"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "inserted_at": insertedAt!.toIso8601String(),
    "name": name,
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Parcel {
  Parcel({
    this.parcelName,
    this.id,
    this.insertedAt,
    this.polygonCoordinates,
    this.shapeFile,
    this.updatedAt,
  });

  String? parcelName;
  int? id;
  DateTime? insertedAt;
  PolygonCoordinates? polygonCoordinates;
  bool? shapeFile;
  DateTime? updatedAt;

  factory Parcel.fromJson(Map<String, dynamic> json) => Parcel(
    parcelName: json["Parcel_name"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    polygonCoordinates: PolygonCoordinates.fromJson(json["polygon_coordinates"]),
    shapeFile: json["shape_file"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "Parcel_name": parcelName,
    "id": id,
    "inserted_at": insertedAt!.toIso8601String(),
    "polygon_coordinates": polygonCoordinates!.toJson(),
    "shape_file": shapeFile,
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class PolygonCoordinates {
  PolygonCoordinates({
    this.features,
    this.name,
    this.type,
  });

  List<Feature>? features;
  String? name;
  String? type;

  factory PolygonCoordinates.fromJson(Map<String, dynamic> json) => PolygonCoordinates(
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "features": List<dynamic>.from(features!.map((x) => x.toJson())),
    "name": name,
    "type": type,
  };
}

class Feature {
  Feature({
    this.geometry,
    this.id,
    this.properties,
    this.type,
  });

  Geometry? geometry;
  String? id;
  Properties? properties;
  String? type;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    geometry: Geometry.fromJson(json["geometry"]),
    id: json["id"],
    properties: Properties.fromJson(json["properties"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "geometry": geometry!.toJson(),
    "id": id,
    "properties": properties!.toJson(),
    "type": type,
  };
}

class Geometry {
  Geometry({
    this.coordinates,
    this.type,
  });

  List<List<List<double>>>? coordinates;
  String? type;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: List<List<List<double>>>.from(json["coordinates"].map((x) => List<List<double>>.from(x.map((x) => List<double>.from(x.map((x) => x.toDouble())))))),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": List<dynamic>.from(coordinates!.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
    "type": type,
  };
}

class Properties {
  Properties({
    this.area,
    this.cropCode,
  });

  double? area;
  int? cropCode;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    area: json["area"].toDouble(),
    cropCode: json["crop_code"],
  );

  Map<String, dynamic> toJson() => {
    "area": area,
    "crop_code": cropCode,
  };
}
