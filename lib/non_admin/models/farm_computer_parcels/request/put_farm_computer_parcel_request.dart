import 'UploadParcelModel.dart';

class PutFarmComputerParcelsRequest {
  Parcel? parcel;

  PutFarmComputerParcelsRequest({this.parcel});

  PutFarmComputerParcelsRequest.fromJson(Map<String, dynamic> json) {
    parcel =
        json['parcel'] != null ? new Parcel.fromJson(json['parcel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parcel != null) {
      data['parcel'] = this.parcel!.toJson();
    }
    return data;
  }
}

class Parcel {
  String? agricultureOrNature;
  String? hectares;
  String? homeOrFieldParcel;
  String? ifLeasedFromWho;
  String? locationDescription;
  String? managementType;
  String? nameLocation;
  String? organizationId;
  String? ownedOrLeased;
  String? parcelPictureId;
  dynamic parcelModel;
  Parcel(
      {this.agricultureOrNature,
      this.hectares,
      this.homeOrFieldParcel,
      this.ifLeasedFromWho,
      this.locationDescription,
      this.managementType,
      this.nameLocation,
      this.organizationId,
      this.ownedOrLeased,
      this.parcelModel,
      this.parcelPictureId});

  Parcel.fromJson(Map<String, dynamic> json) {
    agricultureOrNature = json['agriculture_or_nature'];
    hectares = json['hectares'];
    homeOrFieldParcel = json['home_or_field_parcel'];
    ifLeasedFromWho = json['if_leased_from_who'];
    locationDescription = json['location_description'];
    managementType = json['management_type'];
    nameLocation = json['name_location'];
    organizationId = json['organization_id'];
    ownedOrLeased = json['owned_or_leased'];
    parcelPictureId = json['parcel_picture_id'];
    parcelModel = json['polygon_coordinates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agriculture_or_nature'] = this.agricultureOrNature;
    data['hectares'] = this.hectares;
    data['home_or_field_parcel'] = this.homeOrFieldParcel;
    data['if_leased_from_who'] = this.ifLeasedFromWho;
    data['location_description'] = this.locationDescription;
    data['management_type'] = this.managementType;
    data['name_location'] = this.nameLocation;
    data['organization_id'] = this.organizationId;
    data['owned_or_leased'] = this.ownedOrLeased;
    data['parcel_picture_id'] = this.parcelPictureId;
    data['polygon_coordinates'] = this.parcelModel;
    // if (data['parcel_picture_id'] != null) {

    // }
    // if (parcelModel != null) {

    // }
    print("parcel model picture ID ---${data.toString()}");
    return data;
  }
}
// class PutFarmComputerParcelsRequest {
// 	Parcel? parcel;

// 	PutFarmComputerParcelsRequest({this.parcel});

// 	PutFarmComputerParcelsRequest.fromJson(Map<String, dynamic> json) {
// 		parcel = json['parcel'] != null ? new Parcel.fromJson(json['parcel']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.parcel != null) {
//       data['parcel'] = this.parcel!.toJson();
//     }
// 		return data;
// 	}
// }

// class Parcel {
// 	String? agricultureOrNature;
// 	String? hectares;
// 	String? homeOrFieldParcel;
// 	String? ifLeasedFromWho;
// 	String? locationDescription;
// 	String? managementType;
// 	String? nameLocation;
// 	String? organizationId;
// 	String? ownedOrLeased;
// 	String? parcelPictureId;
// 	PolygonCoordinates? polygonCoordinates;
// 	String? shapeFileId;

// 	Parcel({this.agricultureOrNature, this.hectares, this.homeOrFieldParcel, this.ifLeasedFromWho, this.locationDescription, this.managementType, this.nameLocation, this.organizationId, this.ownedOrLeased, this.parcelPictureId, this.polygonCoordinates, this.shapeFileId});

// 	Parcel.fromJson(Map<String, dynamic> json) {
// 		agricultureOrNature = json['agriculture_or_nature'];
// 		hectares = json['hectares'];
// 		homeOrFieldParcel = json['home_or_field_parcel'];
// 		ifLeasedFromWho = json['if_leased_from_who'];
// 		locationDescription = json['location_description'];
// 		managementType = json['management_type'];
// 		nameLocation = json['name_location'];
// 		organizationId = json['organization_id'];
// 		ownedOrLeased = json['owned_or_leased'];
// 		parcelPictureId = json['parcel_picture_id'];
// 		polygonCoordinates = json['polygon_coordinates'] != null ? new PolygonCoordinates.fromJson(json['polygon_coordinates']) : null;
// 		shapeFileId = json['shape_file_id'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['agriculture_or_nature'] = this.agricultureOrNature;
// 		data['hectares'] = this.hectares;
// 		data['home_or_field_parcel'] = this.homeOrFieldParcel;
// 		data['if_leased_from_who'] = this.ifLeasedFromWho;
// 		data['location_description'] = this.locationDescription;
// 		data['management_type'] = this.managementType;
// 		data['name_location'] = this.nameLocation;
// 		data['organization_id'] = this.organizationId;
// 		data['owned_or_leased'] = this.ownedOrLeased;
// 		data['parcel_picture_id'] = this.parcelPictureId;
// 		if (this.polygonCoordinates != null) {
//       data['polygon_coordinates'] = this.polygonCoordinates!.toJson();
//     }
// 		data['shape_file_id'] = this.shapeFileId;
// 		return data;
// 	}
// }

// class PolygonCoordinates {
// 	List<Features>? features;
// 	String? name;
// 	String? type;

// 	PolygonCoordinates({this.features, this.name, this.type});

// 	PolygonCoordinates.fromJson(Map<String, dynamic> json) {
// 		if (json['features'] != null) {
// 			features = <Features>[];
// 			json['features'].forEach((v) { features!.add(new Features.fromJson(v)); });
// 		}
// 		name = json['name'];
// 		type = json['type'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.features != null) {
//       data['features'] = this.features!.map((v) => v.toJson()).toList();
//     }
// 		data['name'] = this.name;
// 		data['type'] = this.type;
// 		return data;
// 	}
// }

// class Features {
// 	Geometry? geometry;
// 	String? id;
// 	Properties? properties;
// 	String? type;

// 	Features({this.geometry, this.id, this.properties, this.type});

// 	Features.fromJson(Map<String, dynamic> json) {
// 		geometry = json['geometry'] != null ? new Geometry.fromJson(json['geometry']) : null;
// 		id = json['id'];
// 		properties = json['properties'] != null ? new Properties.fromJson(json['properties']) : null;
// 		type = json['type'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.geometry != null) {
//       data['geometry'] = this.geometry!.toJson();
//     }
// 		data['id'] = this.id;
// 		if (this.properties != null) {
//       data['properties'] = this.properties!.toJson();
//     }
// 		data['type'] = this.type;
// 		return data;
// 	}
// }

// class Geometry {
// 	List<List>? coordinates;
// 	String? type;

// 	Geometry({this.coordinates, this.type});

// 	Geometry.fromJson(Map<String, dynamic> json) {
// 		if (json['coordinates'] != null) {
// 			coordinates = <List>[];
// 			json['coordinates'].forEach((v) { coordinates!.add(new List.fromJson(v)); });
// 		}
// 		type = json['type'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.coordinates != null) {
//       data['coordinates'] = this.coordinates!.map((v) => v.toJson()).toList();
//     }
// 		data['type'] = this.type;
// 		return data;
// 	}
// }

// class Coordinates {


// 	Coordinates();

// 	Coordinates.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }

// class Properties {
// 	double? area;

// 	Properties({this.area});

// 	Properties.fromJson(Map<String, dynamic> json) {
// 		area = json['area'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['area'] = this.area;
// 		return data;
// 	}
// }
