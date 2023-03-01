import 'dart:convert';

import '../response/localfile.dart';
import 'UploadParcelModel.dart';

PostFarmComputerParcelsRequest postFarmComputerParcelsRequestFromJson(
        String str) =>
    PostFarmComputerParcelsRequest.fromJson(json.decode(str));

String postFarmComputerParcelsRequestToJson(
        PostFarmComputerParcelsRequest data) =>
    json.encode(data.toJson());

class PostFarmComputerParcelsRequest {
  PostFarmComputerParcelsRequest({
    this.selectParcel,
    this.selectedParcel,
  });

  SelectParcel? selectParcel;
  UploadParcelModel? selectedParcel;

  factory PostFarmComputerParcelsRequest.fromJson(Map<String, dynamic> json) =>
      PostFarmComputerParcelsRequest(
        selectParcel: SelectParcel.fromJson(json["select_parcel"]),
        selectedParcel: UploadParcelModel.fromJson(json["selected_parcel"]),
      );

  Map<String, dynamic> toJson() => {
        "select_parcel": selectParcel!.toJson(),
        "selected_parcel": selectedParcel!.toJson(),
      };
}

class SelectParcel {
  SelectParcel({
    this.locationDescription,
    this.nameAuto,
    this.nameLocation,
    this.parcelPictureId,
    this.parcelPlant,
  });

  String? locationDescription;
  String? nameAuto;
  String? nameLocation;
  String? parcelPictureId;
  ParcelPlant? parcelPlant;

  factory SelectParcel.fromJson(Map<String, dynamic> json) => SelectParcel(
        locationDescription: json["location_description"],
        nameAuto: json["name_auto"],
        nameLocation: json["name_location"],
        parcelPictureId: json["parcel_picture_id"],
        parcelPlant: ParcelPlant.fromJson(json["parcel_plant"]),
      );

  Map<String, dynamic> toJson() => {
        "location_description": locationDescription,
        "name_auto": nameAuto,
        "name_location": nameLocation,
        "parcel_picture_id": parcelPictureId,
        "parcel_plant": parcelPlant!.toJson(),
      };
}

class ParcelPlant {
  ParcelPlant({
    this.managementType,
  });

  List<String>? managementType;

  factory ParcelPlant.fromJson(Map<String, dynamic> json) => ParcelPlant(
        managementType:
            List<String>.from(json["management_type"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "management_type": List<dynamic>.from(managementType!.map((x) => x)),
      };
}

class SelectedParcel {
  SelectedParcel({
    this.features,
    this.name,
    this.type,
  });

  List<FeatureList>? features;
  String? name;
  String? type;

  factory SelectedParcel.fromJson(Map<String, dynamic> json) => SelectedParcel(
        features: List<FeatureList>.from(
            json["features"].map((x) => FeatureList.fromJson(x))),
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "features": List<dynamic>.from(features!.map((x) => x.toJson())),
        "name": name,
        "type": type,
      };
}

class FeatureList {
  FeatureList({
    this.geometry,
    this.id,
    this.properties,
    this.type,
  });

  Geometryclass? geometry;
  String? id;
  Properties? properties;
  String? type;

  factory FeatureList.fromJson(Map<String, dynamic> json) => FeatureList(
        geometry: Geometryclass.fromJson(json["geometry"]),
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

class Geometryclass {
  Geometryclass({
    this.coordinates,
    this.type,
  });

  List<List<List<double>>>? coordinates;
  String? type;

  factory Geometryclass.fromJson(Map<String, dynamic> json) => Geometryclass(
        coordinates: List<List<List<double>>>.from(json["coordinates"].map(
            (x) => List<List<double>>.from(
                x.map((x) => List<double>.from(x.map((x) => x.toDouble())))))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates!.map((x) =>
            List<dynamic>.from(
                x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
        "type": type,
      };
}

class Properties {
  Properties({
    this.area,
  });

  double? area;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        area: json["area"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "area": area,
      };
}


// class PostFarmComputerParcelsRequest {
//   SelectParcel? selectParcel;
//   SelectedParcel? selectedParcel;

//   PostFarmComputerParcelsRequest({this.selectParcel, this.selectedParcel});

//   PostFarmComputerParcelsRequest.fromJson(Map<String, dynamic> json) {
//     selectParcel = json['select_parcel'] != null
//         ? new SelectParcel.fromJson(json['select_parcel'])
//         : null;
//     selectedParcel = json['selected_parcel'] != null
//         ? new SelectedParcel.fromJson(json['selected_parcel'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.selectParcel != null) {
//       data['select_parcel'] = this.selectParcel!.toJson();
//     }
//     if (this.selectedParcel != null) {
//       data['selected_parcel'] = this.selectedParcel!.toJson();
//     }
//     return data;
//   }
// }

// class SelectParcel {
//   String? locationDescription;
//   String? nameAuto;
//   String? nameLocation;
//   String? parcelPictureId;
//   ParcelPlant? parcelPlant;

//   SelectParcel(
//       {this.locationDescription,
//       this.nameAuto,
//       this.nameLocation,
//       this.parcelPictureId,
//       this.parcelPlant});

//   SelectParcel.fromJson(Map<String, dynamic> json) {
//     locationDescription = json['location_description'];
//     nameAuto = json['name_auto'];
//     nameLocation = json['name_location'];
//     parcelPictureId = json['parcel_picture_id'];
//     parcelPlant = json['parcel_plant'] != null
//         ? new ParcelPlant.fromJson(json['parcel_plant'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['location_description'] = this.locationDescription;
//     data['name_auto'] = this.nameAuto;
//     data['name_location'] = this.nameLocation;
//     data['parcel_picture_id'] = this.parcelPictureId;
//     if (this.parcelPlant != null) {
//       data['parcel_plant'] = this.parcelPlant!.toJson();
//     }
//     return data;
//   }
// }

// class ParcelPlant {
//   List<String>? managementType;

//   ParcelPlant({this.managementType});

//   ParcelPlant.fromJson(Map<String, dynamic> json) {
//     managementType = json['management_type'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['management_type'] = this.managementType;
//     return data;
//   }
// }

// class SelectedParcel {
//   List<Features>? features;
//   String? name;
//   String? type;

//   SelectedParcel({this.features, this.name, this.type});

//   SelectedParcel.fromJson(Map<String, dynamic> json) {
//     if (json['features'] != null) {
//       features = <Features>[];
//       json['features'].forEach((v) {
//         features!.add(new Features.fromJson(v));
//       });
//     }
//     name = json['name'];
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.features != null) {
//       data['features'] = this.features!.map((v) => v.toJson()).toList();
//     }
//     data['name'] = this.name;
//     data['type'] = this.type;
//     return data;
//   }
// }

// class Features {
//   String? id;
//   Properties? properties;
//   String? type;

//   Features({this.id, this.properties, this.type});

//   Features.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     properties = json['properties'] != null
//         ? new Properties.fromJson(json['properties'])
//         : null;
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.properties != null) {
//       data['properties'] = this.properties!.toJson();
//     }
//     data['type'] = this.type;
//     return data;
//   }
// }

// class Properties {
//   double? area;

//   Properties({this.area});

//   Properties.fromJson(Map<String, dynamic> json) {
//     area = json['area'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['area'] = this.area;
//     return data;
//   }
// }





// class PostFarmComputerParcelsRequest {
//   SelectParcel? selectParcel;
//   SelectedParcel? selectedParcel;

//   PostFarmComputerParcelsRequest({this.selectParcel, this.selectedParcel});

//   PostFarmComputerParcelsRequest.fromJson(Map<String, dynamic> json) {
//     selectParcel = json['select_parcel'] != null
//         ? new SelectParcel.fromJson(json['select_parcel'])
//         : null;
//     selectedParcel = json['selected_parcel'] != null
//         ? new SelectedParcel.fromJson(json['selected_parcel'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.selectParcel != null) {
//       data['select_parcel'] = this.selectParcel!.toJson();
//     }
//     if (this.selectedParcel != null) {
//       data['selected_parcel'] = this.selectedParcel!.toJson();
//     }
//     return data;
//   }
// }

// class SelectParcel {
//   String? locationDescription;
//   String? nameAuto;
//   String? nameLocation;
//   String? parcelPictureId;
//   ParcelPlant? parcelPlant;

//   SelectParcel(
//       {this.locationDescription,
//       this.nameAuto,
//       this.nameLocation,
//       this.parcelPictureId,
//       this.parcelPlant});

//   SelectParcel.fromJson(Map<String, dynamic> json) {
//     locationDescription = json['location_description'];
//     nameAuto = json['name_auto'];
//     nameLocation = json['name_location'];
//     parcelPictureId = json['parcel_picture_id'];
//     parcelPlant = json['parcel_plant'] != null
//         ? new ParcelPlant.fromJson(json['parcel_plant'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['location_description'] = this.locationDescription;
//     data['name_auto'] = this.nameAuto;
//     data['name_location'] = this.nameLocation;
//     data['parcel_picture_id'] = this.parcelPictureId;
//     if (this.parcelPlant != null) {
//       data['parcel_plant'] = this.parcelPlant!.toJson();
//     }
//     return data;
//   }
// }

// class ParcelPlant {
//   List<String>? managementType;

//   ParcelPlant({this.managementType});

//   ParcelPlant.fromJson(Map<String, dynamic> json) {
//     managementType = json['management_type'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['management_type'] = this.managementType;
//     return data;
//   }
// }

// class SelectedParcel {
//   String? name;
//   String? type;

//   SelectedParcel({this.name, this.type});

//   SelectedParcel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['type'] = this.type;
//     return data;
//   }
// }
