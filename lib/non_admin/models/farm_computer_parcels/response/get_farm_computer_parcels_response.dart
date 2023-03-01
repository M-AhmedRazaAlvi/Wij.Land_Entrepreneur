import 'package:latlong2/latlong.dart' as latLng;
import 'package:http/http.dart' as http;
class GetFarmComputerParcelsResponse {
  List<ParcelData>? data;
  String? message;
  int? status;
  Error? error;

  GetFarmComputerParcelsResponse(
      {this.data, this.message, this.status, this.error});
  GetFarmComputerParcelsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ParcelData>[];
      json['data'].forEach((v) {
        data!.add(new ParcelData.fromJson(v));
      });
    }
    message = json['message'].toString();
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class ParcelData {
  String? area;
  List<Files>? files;
  String? id;
  String? ifLeasedFromWho;
  String? insertedAt;
  String? landFunction;
  String? landManagement;
  String? locationDescription;
  bool? organic;
  String? ownership;
  List<ParcelActions>? parcelActions;
  String? parcelName;
  List<Projects>? projects;
  String? purpose;
  String? updatedAt;
  ParcelMapInformation? parcelMapInformation;
  dynamic parcelencodeinformation;
  ParcelData(
      {this.area,
      this.files,
      this.id,
      this.ifLeasedFromWho,
      this.insertedAt,
      this.landFunction,
      this.landManagement,
      this.locationDescription,
      this.organic,
      this.ownership,
      this.parcelActions,
      this.parcelName,
      this.projects,
      this.purpose,
      this.updatedAt,
      this.parcelencodeinformation,
      this.parcelMapInformation});
  ParcelData.fromJson(Map<String, dynamic> json) {
    area = json['area'].toString();
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    id = json['id'].toString();
    ifLeasedFromWho = json['if_leased_from_who'].toString();
    insertedAt = json['inserted_at'].toString();
    landFunction = json['land_function'].toString();
    landManagement = json['land_management'].toString();
    locationDescription = json['location_description'].toString();
    organic = json['organic'];
    ownership = json['ownership'].toString();
    if (json['parcel_actions'] != null) {
      parcelActions = <ParcelActions>[];
      json['parcel_actions'].forEach((v) {
        parcelActions!.add(new ParcelActions.fromJson(v));
      });
    }
    parcelName = json['parcel_name'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
    purpose = json['purpose'].toString();
    updatedAt = json['updated_at'].toString();
    if (json['parcel_map'] != null) {
      parcelMapInformation = ParcelMapInformation.fromJson(json['parcel_map']);
    }
    if (json['parcel_map'] != null) {
      parcelencodeinformation = json['parcel_map'];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['if_leased_from_who'] = this.ifLeasedFromWho;
    data['inserted_at'] = this.insertedAt;
    data['land_function'] = this.landFunction;
    data['land_management'] = this.landManagement;
    data['location_description'] = this.locationDescription;
    data['organic'] = this.organic;
    data['ownership'] = this.ownership;
    if (this.parcelActions != null) {
      data['parcel_actions'] =
          this.parcelActions!.map((v) => v.toJson()).toList();
    }
    data['parcel_name'] = this.parcelName;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    data['purpose'] = this.purpose;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Files {
  String? addedBy;
  String? date;
  String? id;
  String? insertedAt;
  String? mime;
  String? path;
  String? title;
  String? updatedAt;
  Files(
      {this.addedBy,
      this.date,
      this.id,
      this.insertedAt,
      this.mime,
      this.path,
      this.title,
      this.updatedAt});
  Files.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'].toString();
    date = json['date'].toString();
    id = json['id'].toString();
    insertedAt = json['inserted_at'].toString();
    mime = json['mime'].toString();
    path = json['path'].toString();
    title = json['title'].toString();
    updatedAt = json['updated_at'].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['date'] = this.date;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ParcelActions {
  List<dynamic>? actionName;
  List<DoneBy>? doneBy;
  String? doneOnDate;
  String? id;
  String? insertedAt;
  String? updatedAt;
  ParcelActions(
      {this.actionName,
      this.doneBy,
      this.doneOnDate,
      this.id,
      this.insertedAt,
      this.updatedAt});
  ParcelActions.fromJson(Map<String, dynamic> json) {
    actionName = json['action_name'];

    if (json['done_by'] != null) {
      doneBy = <DoneBy>[];
      json['done_by'].forEach((v) {
        doneBy!.add(new DoneBy.fromJson(v));
      });
    }
    doneOnDate = json['done_on_date'].toString();
    id = json['id'].toString();
    insertedAt = json['inserted_at'].toString();
    updatedAt = json['updated_at'].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action_name'] = this.actionName;
    if (this.doneBy != null) {
      data['done_by'] = this.doneBy!.map((v) => v.toJson()).toList();
    }
    data['done_on_date'] = this.doneOnDate;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DoneBy {
  String? id;
  String? name;
  DoneBy({this.id, this.name});
  DoneBy.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

// class ActionName {
//   List<String>? actionName;

//   ActionName({this.actionName});

//   ActionName.fromJson(Map<String, dynamic> json) {
//     actionName = json['action_name'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['action_name'] = this.actionName;
//     return data;
//   }
// }

class Projects {
  String? id;
  String? projectName;
  Projects({this.id, this.projectName});
  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    projectName = json['project_name'].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    return data;
  }
}

class ParcelMapInformation {
  String? area;
  String? farmId;
  String? farmName;
  List<latLng.LatLng> listOfLatLng = [];
  ParcelMapInformation({this.area, this.farmId, this.farmName});
  ParcelMapInformation.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('area')) {
      area = json['area'].toString();
    }
    if (json.containsKey('farm_id')) {
      farmId = json['farm_id'].toString();
    }
    if (json.containsKey('farm_name')) {
      farmName = json['farm_name'].toString();
    }
    if (json['geometry'] != null) {
      Map map = json['geometry'];
      List cor = map['coordinates'];
      List coordinatesList = cor[0];
      for (var i in coordinatesList) {
        List list = i;
        listOfLatLng.add(latLng.LatLng(list[1], list[0]));
      }
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['farm_id'] = this.farmId;
    data['farm_name'] = this.farmName;
    return data;
  }
}

class MainParcelMapInformation {
  String? farmName;
  String? shapeFile;
  List<latLng.LatLng> listOfLatLng = [];
  MainParcelMapInformation({this.farmName,this.shapeFile});
  MainParcelMapInformation.fromJson(Map<String, dynamic> json) {
    farmName = json['Parcel_name'].toString();
    shapeFile = json['shape_file'].toString();
    if (json['polygon_coordinates'] != null) {
      Map map = json['polygon_coordinates'];
      Map map2;
      if(map.containsKey('features')){
        map2=map['features'][0]['geometry'];
      }else{
        map2=map['geometry'];
      }

      List cor = map2['coordinates'];
      List coordinatesList = cor[0];

      for (var i in coordinatesList) {

        List list = i;
        listOfLatLng.add(latLng.LatLng(list[1], list[0]));
      }
    }
    else{
      http.get(Uri.parse(shapeFile.toString())).then((value) => print('value of shape file ${value}'));

    }

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farm_name'] = this.farmName;
    return data;
  }
}

class Error {
  String? message;
  int? status;

  Error({this.message, this.status});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
