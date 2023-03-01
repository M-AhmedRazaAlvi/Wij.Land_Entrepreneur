import '../../farm_computer_parcels/response/get_farm_computer_parcels_response.dart';

class GetFarmComputerActionDetailResponse {
  ActionDetailResponse? data;
  String? message;
  int? status;

  GetFarmComputerActionDetailResponse({this.data, this.message, this.status});

  GetFarmComputerActionDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ActionDetailResponse.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class ActionDetailResponse {
  String? actionName;
  dynamic? amendment;
  List<AnalysisResults>? analysisResults;
  BokashiHeap? bokashiHeap;
  String? comment;
  dynamic? conditionDescription;
  List<DoneBy>? doneBy;
  List<String>? doneInSession;
  dynamic? doneInYear;
  String? doneOnDate;
  dynamic? doneOnHaOfFarm;
  FarmOrOrganization? farmOrOrganization;
  List<Files>? files;
  dynamic? giftKgHa;
  int? id;
  String? insertedAt;
  dynamic? methodDescription;
  List<Parcels>? parcels;
  bool? pilotPlotAction;
  DoneBy? project;
  dynamic? recipeIngredients;
  String? samplingCodeAsSentToLab;
  String? samplingConditionPhKcl;
  String? samplingConditionSoilTemperature;
  String? sendDate;
  dynamic? stoneFlourType;
  List<SubParcels>? subParcels;
  String? updatedAt;
  List<MainParcelMapInformation>? listOfParcelData = [];

  ActionDetailResponse(
      {this.actionName,
      this.amendment,
      this.analysisResults,
      this.bokashiHeap,
      this.comment,
      this.conditionDescription,
      this.doneBy,
      this.doneInSession,
      this.doneInYear,
      this.doneOnDate,
      this.doneOnHaOfFarm,
      this.farmOrOrganization,
      this.files,
      this.giftKgHa,
      this.id,
      this.insertedAt,
      this.methodDescription,
      this.parcels,
      this.pilotPlotAction,
      this.project,
      this.recipeIngredients,
      this.samplingCodeAsSentToLab,
      this.samplingConditionPhKcl,
      this.samplingConditionSoilTemperature,
      this.sendDate,
      this.stoneFlourType,
      this.subParcels,
      this.updatedAt,
      this.listOfParcelData});

  ActionDetailResponse.fromJson(Map<String, dynamic> json) {
    actionName = json['action_name'];
    amendment = json['amendment'];
    if (json['analysis_results'] != null) {
      analysisResults = <AnalysisResults>[];
      json['analysis_results'].forEach((v) {
        analysisResults!.add(new AnalysisResults.fromJson(v));
      });
    }
    if (json['parcels'] != null) {
      json['parcels'].forEach((v) {
        listOfParcelData!.add(MainParcelMapInformation.fromJson(v));
      });
    }
    bokashiHeap = json['bokashi_heap'] != null ? new BokashiHeap.fromJson(json['bokashi_heap']) : null;
    comment = json['comment'];
    conditionDescription = json['condition_description'];
    if (json['done_by'] != null) {
      doneBy = <DoneBy>[];
      json['done_by'].forEach((v) {
        doneBy!.add(new DoneBy.fromJson(v));
      });
    }
    doneInSession = json['done_in_session'].cast<String>();
    doneInYear = json['done_in_year'];
    doneOnDate = json['done_on_date'];
    doneOnHaOfFarm = json['done_on_ha_of_farm'];
    farmOrOrganization = json['farm_or_organization'] != null ? new FarmOrOrganization.fromJson(json['farm_or_organization']) : null;
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    giftKgHa = json['gift_kg_ha'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    methodDescription = json['method_description'];
    if (json['parcels'] != null) {
      parcels = <Parcels>[];
      json['parcels'].forEach((v) {
        parcels!.add(new Parcels.fromJson(v));
      });
    }
    pilotPlotAction = json['pilot_plot_action'];
    project = json['project'] != null ? new DoneBy.fromJson(json['project']) : null;
    recipeIngredients = json['recipe_ingredients'].toString();
    samplingCodeAsSentToLab = json['sampling_code_as_sent_to_lab'];
    samplingConditionPhKcl = json['sampling_condition_ph_kcl'];
    samplingConditionSoilTemperature = json['sampling_condition_soil_temperature'];
    sendDate = json['send_date'];
    stoneFlourType = json['stone_flour_type'].toString();
    if (json['sub_parcels'] != null) {
      subParcels = <SubParcels>[];
      json['sub_parcels'].forEach((v) {
        subParcels!.add(new SubParcels.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action_name'] = this.actionName;
    data['amendment'] = this.amendment;
    if (this.analysisResults != null) {
      data['analysis_results'] = this.analysisResults!.map((v) => v.toJson()).toList();
    }
    if (this.bokashiHeap != null) {
      data['bokashi_heap'] = this.bokashiHeap!.toJson();
    }
    data['comment'] = this.comment;
    data['condition_description'] = this.conditionDescription;
    if (this.doneBy != null) {
      data['done_by'] = this.doneBy!.map((v) => v.toJson()).toList();
    }
    data['done_in_session'] = this.doneInSession;
    data['done_in_year'] = this.doneInYear;
    data['done_on_date'] = this.doneOnDate;
    data['done_on_ha_of_farm'] = this.doneOnHaOfFarm;
    if (this.farmOrOrganization != null) {
      data['farm_or_organization'] = this.farmOrOrganization!.toJson();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    data['gift_kg_ha'] = this.giftKgHa;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['method_description'] = this.methodDescription;
    if (this.parcels != null) {
      data['parcels'] = this.parcels!.map((v) => v.toJson()).toList();
    }
    data['pilot_plot_action'] = this.pilotPlotAction;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['recipe_ingredients'] = this.recipeIngredients;
    data['sampling_code_as_sent_to_lab'] = this.samplingCodeAsSentToLab;
    data['sampling_condition_ph_kcl'] = this.samplingConditionPhKcl;
    data['sampling_condition_soil_temperature'] = this.samplingConditionSoilTemperature;
    data['send_date'] = this.sendDate;
    data['stone_flour_type'] = this.stoneFlourType;
    if (this.subParcels != null) {
      data['sub_parcels'] = this.subParcels!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AnalysisResults {
  String? addedBy;
  String? dateAdded;
  FilePath? filePath;
  dynamic? id;
  String? insertedAt;
  String? updatedAt;

  AnalysisResults({this.addedBy, this.dateAdded, this.filePath, this.id, this.insertedAt, this.updatedAt});

  AnalysisResults.fromJson(Map<String, dynamic> json) {
    addedBy = json['added_by'];
    dateAdded = json['date_added'];
    filePath = json['file_path'] != null ? new FilePath.fromJson(json['file_path']) : null;
    id = json['id'];
    insertedAt = json['inserted_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['added_by'] = this.addedBy;
    data['date_added'] = this.dateAdded;
    if (this.filePath != null) {
      data['file_path'] = this.filePath!.toJson();
    }
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FilePath {
  String? date;
  String? description;
  File? file;
  dynamic? id;
  String? insertedAt;
  String? mime;
  String? path;
  String? title;
  String? updatedAt;

  FilePath({this.date, this.description, this.file, this.id, this.insertedAt, this.mime, this.path, this.title, this.updatedAt});

  FilePath.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    id = json['id'];
    insertedAt = json['inserted_at'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BokashiHeap {
  String? comment;
  int? id;
  String? insertedAt;
  Location? location;
  dynamic? tonsBokashi;
  String? updatedAt;

  BokashiHeap({this.comment, this.id, this.insertedAt, this.location, this.tonsBokashi, this.updatedAt});

  BokashiHeap.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    tonsBokashi = json['tons_bokashi'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['tons_bokashi'] = this.tonsBokashi;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Location {
  String? latitude;
  String? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class DoneBy {
  int? id;
  String? insertedAt;
  String? name;
  String? updatedAt;

  DoneBy({this.id, this.insertedAt, this.name, this.updatedAt});

  DoneBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FarmOrOrganization {
  String? farmName;
  int? id;
  String? insertedAt;
  String? updatedAt;

  FarmOrOrganization({this.farmName, this.id, this.insertedAt, this.updatedAt});

  FarmOrOrganization.fromJson(Map<String, dynamic> json) {
    farmName = json['farm_name'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farm_name'] = this.farmName;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Files {
  String? date;
  String? description;
  File? file;
  int? id;
  String? insertedAt;
  String? mime;
  String? path;
  String? title;
  String? updatedAt;

  Files({this.date, this.description, this.file, this.id, this.insertedAt, this.mime, this.path, this.title, this.updatedAt});

  Files.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    id = json['id'];
    insertedAt = json['inserted_at'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class File {
  String? large;
  String? mini;
  String? original;
  String? thumb;

  File({this.large, this.mini, this.original, this.thumb});

  File.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    mini = json['mini'];
    original = json['original'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['mini'] = this.mini;
    data['original'] = this.original;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Parcels {
  String? parcelName;
  int? id;
  String? insertedAt;
  String? updatedAt;

  Parcels({this.parcelName, this.id, this.insertedAt, this.updatedAt});

  Parcels.fromJson(Map<String, dynamic> json) {
    parcelName = json['Parcel_name'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Parcel_name'] = this.parcelName;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SubParcels {
  String? subParcelName;
  int? id;
  String? insertedAt;
  String? updatedAt;

  SubParcels({this.subParcelName, this.id, this.insertedAt, this.updatedAt});

  SubParcels.fromJson(Map<String, dynamic> json) {
    subParcelName = json['Sub_parcel_name'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sub_parcel_name'] = this.subParcelName;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
