class PostFarmComputerProjectActionsRequest {
  BokashiHeap? bokashiHeap;
  DbAction? dbAction;

  PostFarmComputerProjectActionsRequest({this.bokashiHeap, this.dbAction});

  PostFarmComputerProjectActionsRequest.fromJson(Map<String, dynamic> json) {
    bokashiHeap = json['bokashi_heap'] != null
        ? new BokashiHeap.fromJson(json['bokashi_heap'])
        : null;
    dbAction = json['db_action'] != null
        ? new DbAction.fromJson(json['db_action'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bokashiHeap != null) {
      data['bokashi_heap'] = this.bokashiHeap!.toJson();
    }
    if (this.dbAction != null) {
      data['db_action'] = this.dbAction!.toJson();
    }
    return data;
  }
}

class BokashiHeap {
  List<String>? bokashiPileStatus;
  String? comment;
  String? latitude;
  String? longitude;
  double? tonsBokashi;

  BokashiHeap(
      {this.bokashiPileStatus,
      this.comment,
      this.latitude,
      this.longitude,
      this.tonsBokashi});

  BokashiHeap.fromJson(Map<String, dynamic> json) {
    bokashiPileStatus = json['bokashi_pile_status'].cast<String>();
    comment = json['comment'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    tonsBokashi = json['tons_bokashi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bokashi_pile_status'] = this.bokashiPileStatus;
    data['comment'] = this.comment;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['tons_bokashi'] = this.tonsBokashi;
    return data;
  }
}

class DbAction {
  String? amendmentId;
  String? bokashiHeapId;
  String? comment;
  String? conditionDescription;
  List<String>? doneByIds;
  List<String>? doneInSession;
  String? doneInYear;
  String? doneOnDate;
  double? doneOnHaOfFarm;
  String? farmId;
  double? giftKgHa;
  String? methodDescription;
  List<String>? parcelIds;
  String? recipeIngredients;
  String? samplingCodeAsSentToLab;
  double? samplingConditionPhKcl;
  int? samplingConditionSoilTemperature;
  List<String>? stoneFlourType;
  List<String>? subParcelIds;

  DbAction(
      {this.amendmentId,
      this.bokashiHeapId,
      this.comment,
      this.conditionDescription,
      this.doneByIds,
      this.doneInSession,
      this.doneInYear,
      this.doneOnDate,
      this.doneOnHaOfFarm,
      this.farmId,
      this.giftKgHa,
      this.methodDescription,
      this.parcelIds,
      this.recipeIngredients,
      this.samplingCodeAsSentToLab,
      this.samplingConditionPhKcl,
      this.samplingConditionSoilTemperature,
      this.stoneFlourType,
      this.subParcelIds});

  DbAction.fromJson(Map<String, dynamic> json) {
    amendmentId = json['amendment_id'];
    bokashiHeapId = json['bokashi_heap_id'];
    comment = json['comment'];
    conditionDescription = json['condition_description'];
    doneByIds = json['done_by_ids'].cast<String>();
    doneInSession = json['done_in_session'].cast<String>();
    doneInYear = json['done_in_year'];
    doneOnDate = json['done_on_date'];
    doneOnHaOfFarm = json['done_on_ha_of_farm'];
    farmId = json['farm_id'];
    giftKgHa = json['gift_kg_ha'];
    methodDescription = json['method_description'];
    parcelIds = json['parcel_ids'].cast<String>();
    recipeIngredients = json['recipe_ingredients'];
    samplingCodeAsSentToLab = json['sampling_code_as_sent_to_lab'];
    samplingConditionPhKcl = json['sampling_condition_ph_kcl'];
    samplingConditionSoilTemperature =
        json['sampling_condition_soil_temperature'];
    stoneFlourType = json['stone_flour_type'].cast<String>();
    subParcelIds = json['sub_parcel_ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amendment_id'] = this.amendmentId;
    data['bokashi_heap_id'] = this.bokashiHeapId;
    data['comment'] = this.comment;
    data['condition_description'] = this.conditionDescription;
    data['done_by_ids'] = this.doneByIds;
    data['done_in_session'] = this.doneInSession;
    data['done_in_year'] = this.doneInYear;
    data['done_on_date'] = this.doneOnDate;
    data['done_on_ha_of_farm'] = this.doneOnHaOfFarm;
    data['farm_id'] = this.farmId;
    data['gift_kg_ha'] = this.giftKgHa;
    data['method_description'] = this.methodDescription;
    data['parcel_ids'] = this.parcelIds;
    data['recipe_ingredients'] = this.recipeIngredients;
    data['sampling_code_as_sent_to_lab'] = this.samplingCodeAsSentToLab;
    data['sampling_condition_ph_kcl'] = this.samplingConditionPhKcl;
    data['sampling_condition_soil_temperature'] =
        this.samplingConditionSoilTemperature;
    data['stone_flour_type'] = this.stoneFlourType;
    data['sub_parcel_ids'] = this.subParcelIds;
    return data;
  }
}
