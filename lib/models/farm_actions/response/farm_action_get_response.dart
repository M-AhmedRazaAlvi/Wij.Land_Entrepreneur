class GetActionsResponse {
  Data? data;
  String? message;
  int? status;

  GetActionsResponse({this.data, this.message, this.status});

  GetActionsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  List<String>? actionName;
  List<dynamic>? actionPictureIds;
  String? amendment;
  List<dynamic>? analysisResults;
  String? bokashiHeap;
  String? comment;
  String? conditionDescription;
  List<DoneBy>? doneBy;
  List<String>? doneInSession;
  String? doneInYear;
  String? doneOnDate;
  String? doneOnHaOfFarm;
  FarmOrOrganization? farmOrOrganization;
  String? giftKgHa;
  int? id;
  String? insertedAt;
  String? methodDescription;
  List<Parcels>? parcels;
  bool? pilotPlotAction;
  DoneBy? project;
  String? recipeIngredients;
  String? samplingCodeAsSentToLab;
  String? samplingConditionPhKcl;
  String? samplingConditionSoilTemperature;
  String? sendDate;
  String? stoneFlourType;
  List<SubParcels>? subParcels;
  String? updatedAt;

  Data(
      {this.actionName,
      this.actionPictureIds,
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
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    actionName = json['action_name'].cast<String>();
    if (json['action_picture_ids'] != null) {
      actionPictureIds = <String>[];
      json['action_picture_ids'].forEach((v) {
        actionPictureIds!.add(Data.fromJson(v).toString());
      });
    }
    amendment = json['amendment'];
    if (json['analysis_results'] != null) {
      analysisResults = <String>[];
      json['analysis_results'].forEach((v) {
        analysisResults!.add(Data.fromJson(json).toString());
      });
    }
    bokashiHeap = json['bokashi_heap'];
    comment = json['comment'];
    conditionDescription = json['condition_description'];
    if (json['done_by'] != null) {
      doneBy = <DoneBy>[];
      json['done_by'].forEach((v) {
        doneBy!.add(DoneBy.fromJson(v));
      });
    }
    doneInSession = json['done_in_session'].cast<String>();
    doneInYear = json['done_in_year'];
    doneOnDate = json['done_on_date'];
    doneOnHaOfFarm = json['done_on_ha_of_farm'];
    farmOrOrganization = json['farm_or_organization'] != null
        ? FarmOrOrganization.fromJson(json['farm_or_organization'])
        : null;
    giftKgHa = json['gift_kg_ha'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    methodDescription = json['method_description'];
    if (json['parcels'] != null) {
      parcels = <Parcels>[];
      json['parcels'].forEach((v) {
        parcels!.add(Parcels.fromJson(v));
      });
    }
    pilotPlotAction = json['pilot_plot_action'];
    project = json['project'] != null ? DoneBy.fromJson(json['project']) : null;
    recipeIngredients = json['recipe_ingredients'];
    samplingCodeAsSentToLab = json['sampling_code_as_sent_to_lab'];
    samplingConditionPhKcl = json['sampling_condition_ph_kcl'];
    samplingConditionSoilTemperature =
        json['sampling_condition_soil_temperature'];
    sendDate = json['send_date'];
    stoneFlourType = json['stone_flour_type'];
    if (json['sub_parcels'] != null) {
      subParcels = <SubParcels>[];
      json['sub_parcels'].forEach((v) {
        subParcels!.add(SubParcels.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['action_name'] = actionName;
    if (actionPictureIds != null) {
      data['action_picture_ids'] =
          actionPictureIds!.map((v) => v.toJson()).toString();
    }
    data['amendment'] = amendment;
    if (analysisResults != null) {
      data['analysis_results'] =
          analysisResults!.map((v) => v.toJson()).toList();
    }
    data['bokashi_heap'] = bokashiHeap;
    data['comment'] = comment;
    data['condition_description'] = conditionDescription;
    if (doneBy != null) {
      data['done_by'] = doneBy!.map((v) => v.toJson()).toList();
    }
    data['done_in_session'] = doneInSession;
    data['done_in_year'] = doneInYear;
    data['done_on_date'] = doneOnDate;
    data['done_on_ha_of_farm'] = doneOnHaOfFarm;
    if (farmOrOrganization != null) {
      data['farm_or_organization'] = farmOrOrganization!.toJson();
    }
    data['gift_kg_ha'] = giftKgHa;
    data['id'] = id;
    data['inserted_at'] = insertedAt;
    data['method_description'] = methodDescription;
    if (parcels != null) {
      data['parcels'] = parcels!.map((v) => v.toJson()).toList();
    }
    data['pilot_plot_action'] = pilotPlotAction;
    if (project != null) {
      data['project'] = project!.toJson();
    }
    data['recipe_ingredients'] = recipeIngredients;
    data['sampling_code_as_sent_to_lab'] = samplingCodeAsSentToLab;
    data['sampling_condition_ph_kcl'] = samplingConditionPhKcl;
    data['sampling_condition_soil_temperature'] =
        samplingConditionSoilTemperature;
    data['send_date'] = sendDate;
    data['stone_flour_type'] = stoneFlourType;
    if (subParcels != null) {
      data['sub_parcels'] = subParcels!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['inserted_at'] = insertedAt;
    data['name'] = name;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['farm_name'] = farmName;
    data['id'] = id;
    data['inserted_at'] = insertedAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Parcel_name'] = parcelName;
    data['id'] = id;
    data['inserted_at'] = insertedAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Sub_parcel_name'] = subParcelName;
    data['id'] = id;
    data['inserted_at'] = insertedAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
