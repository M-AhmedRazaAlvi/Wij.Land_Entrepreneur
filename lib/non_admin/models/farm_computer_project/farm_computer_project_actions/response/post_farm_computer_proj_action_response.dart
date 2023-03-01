class PostFarmComputerProjectActionsResponse {
  Data? data;
  String? message;
  int? status;

  PostFarmComputerProjectActionsResponse(
      {this.data, this.message, this.status});

  PostFarmComputerProjectActionsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<String>? actionName;
  String? amendment;
  List<String>? analysisResults;
  String? bokashiHeap;
  String? comment;
  String? conditionDescription;
  List<String>? doneBy;
  List<String>? doneInSession;
  String? doneInYear;
  String? doneOnDate;
  double? doneOnHaOfFarm;
  String? farmOrOrganization;
  List<String>? files;
  double? giftKgHa;
  int? id;
  String? insertedAt;
  String? methodDescription;
  List<String>? parcels;
  bool? pilotPlotAction;
  Project? project;
  String? recipeIngredients;
  String? samplingCodeAsSentToLab;
  double? samplingConditionPhKcl;
  int? samplingConditionSoilTemperature;
  String? sendDate;
  List<String>? stoneFlourType;
  List<String>? subParcels;
  String? updatedAt;

  Data(
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
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    actionName = json['action_name'].cast<String>();
    amendment = json['amendment'];
    analysisResults = json['analysis_results'].cast<String>();
    bokashiHeap = json['bokashi_heap'];
    comment = json['comment'];
    conditionDescription = json['condition_description'];
    doneBy = json['done_by'].cast<String>();
    doneInSession = json['done_in_session'].cast<String>();
    doneInYear = json['done_in_year'];
    doneOnDate = json['done_on_date'];
    doneOnHaOfFarm = json['done_on_ha_of_farm'];
    farmOrOrganization = json['farm_or_organization'];
    files = json['files'].cast<String>();
    giftKgHa = json['gift_kg_ha'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    methodDescription = json['method_description'];
    parcels = json['parcels'].cast<String>();
    pilotPlotAction = json['pilot_plot_action'];
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
    recipeIngredients = json['recipe_ingredients'];
    samplingCodeAsSentToLab = json['sampling_code_as_sent_to_lab'];
    samplingConditionPhKcl = json['sampling_condition_ph_kcl'];
    samplingConditionSoilTemperature =
        json['sampling_condition_soil_temperature'];
    sendDate = json['send_date'];
    stoneFlourType = json['stone_flour_type'].cast<String>();
    subParcels = json['sub_parcels'].cast<String>();
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action_name'] = this.actionName;
    data['amendment'] = this.amendment;
    data['analysis_results'] = this.analysisResults;
    data['bokashi_heap'] = this.bokashiHeap;
    data['comment'] = this.comment;
    data['condition_description'] = this.conditionDescription;
    data['done_by'] = this.doneBy;
    data['done_in_session'] = this.doneInSession;
    data['done_in_year'] = this.doneInYear;
    data['done_on_date'] = this.doneOnDate;
    data['done_on_ha_of_farm'] = this.doneOnHaOfFarm;
    data['farm_or_organization'] = this.farmOrOrganization;
    data['files'] = this.files;
    data['gift_kg_ha'] = this.giftKgHa;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['method_description'] = this.methodDescription;
    data['parcels'] = this.parcels;
    data['pilot_plot_action'] = this.pilotPlotAction;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['recipe_ingredients'] = this.recipeIngredients;
    data['sampling_code_as_sent_to_lab'] = this.samplingCodeAsSentToLab;
    data['sampling_condition_ph_kcl'] = this.samplingConditionPhKcl;
    data['sampling_condition_soil_temperature'] =
        this.samplingConditionSoilTemperature;
    data['send_date'] = this.sendDate;
    data['stone_flour_type'] = this.stoneFlourType;
    data['sub_parcels'] = this.subParcels;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Project {
  int? id;
  String? insertedAt;
  String? name;
  String? updatedAt;

  Project({this.id, this.insertedAt, this.name, this.updatedAt});

  Project.fromJson(Map<String, dynamic> json) {
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
