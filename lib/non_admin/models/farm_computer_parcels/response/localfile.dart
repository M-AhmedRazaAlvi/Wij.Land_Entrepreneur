import 'dart:convert';

import 'package:meta/meta.dart';

Parseddata parseddataFromJson(String str) => Parseddata.fromJson(json.decode(str));

String parseddataToJson(Parseddata data) => json.encode(data.toJson());

class Parseddata {
  Parseddata({
    @required this.type,
    @required this.name,
    @required this.crs,
    @required this.features,
  });

  String? type;
  String? name;
  Crs? crs;
  List<Feature>? features;

  factory Parseddata.fromJson(Map<String, dynamic> json) => Parseddata(
        type: json["type"],
        name: json["name"],
        crs: Crs.fromJson(json["crs"]),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "name": name,
      "crs": crs!.toJson(),
      "features": List<dynamic>.from(features!.map((x) => x.toJson())),
    };
  }
}

class Crs {
  Crs({
    @required this.type,
    @required this.properties,
  });

  String? type;
  CrsProperties? properties;

  factory Crs.fromJson(Map<String, dynamic> json) => Crs(
        type: json["type"],
        properties: CrsProperties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties!.toJson(),
      };
}

class CrsProperties {
  CrsProperties({
    @required this.name,
  });

  String? name;

  factory CrsProperties.fromJson(Map<String, dynamic> json) => CrsProperties(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Feature {
  Feature({
    @required this.type,
    @required this.properties,
    @required this.geometry,
  });

  String? type;
  FeatureProperties? properties;
  Geometry? geometry;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        properties: FeatureProperties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties!.toJson(),
        "geometry": geometry!.toJson(),
      };
}

class Geometry {
  Geometry({
    @required this.type,
    @required this.coordinates,
  });

  String? type;
  List<List<List<List<double>>>>? coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<List<List<List<double>>>>.from(json["coordinates"].map((x) =>
            List<List<List<double>>>.from(x.map((x) => List<List<double>>.from(x.map((x) => List<double>.from(x.map((x) => x.toDouble())))))))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(
            coordinates!.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => x)))))))),
      };
}

class FeatureProperties {
  FeatureProperties({
    @required this.fid,
    @required this.code,
    @required this.newCode,
    @required this.uitzondering,
  });

  int? fid;
  String? code;
  String? newCode;
  dynamic uitzondering;

  factory FeatureProperties.fromJson(Map<String, dynamic> json) => FeatureProperties(
        fid: json["fid"],
        code: json["code"],
        newCode: json["new_code"],
        uitzondering: json["uitzondering"],
      );

  Map<String, dynamic> toJson() => {
        "fid": fid,
        "code": code,
        "new_code": newCode,
        "uitzondering": uitzondering,
      };
}
