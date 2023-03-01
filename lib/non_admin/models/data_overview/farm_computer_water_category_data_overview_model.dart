class FarmComputerWaterCategoryDataOverviewResponseModel {
  dynamic? ditchCleanApproach;
  dynamic? ditchCleanApproachDate;
  dynamic? ditchWaterLevel;
  dynamic? ditchWaterLevelDate;
  dynamic? dreger;
  String? dregerDate;
  dynamic? ecofriendlyBanks;
  dynamic? ecofriendlyBanksDate;
  dynamic? grazedDitchEdge;
  dynamic? grazedDitchEdgeDate;
  dynamic? helofytenfilter;
  dynamic? helofytenfilterDate;
  int? id;
  dynamic? manureFreeDitch;
  dynamic? manureFreeDitchBuffer;
  dynamic? manureFreeDitchBufferDate;
  dynamic? manureFreeDitchDate;

  FarmComputerWaterCategoryDataOverviewResponseModel(
      {this.ditchCleanApproach,
        this.ditchCleanApproachDate,
        this.ditchWaterLevel,
        this.ditchWaterLevelDate,
        this.dreger,
        this.dregerDate,
        this.ecofriendlyBanks,
        this.ecofriendlyBanksDate,
        this.grazedDitchEdge,
        this.grazedDitchEdgeDate,
        this.helofytenfilter,
        this.helofytenfilterDate,
        this.id,
        this.manureFreeDitch,
        this.manureFreeDitchBuffer,
        this.manureFreeDitchBufferDate,
        this.manureFreeDitchDate});

  FarmComputerWaterCategoryDataOverviewResponseModel.fromJson(
      Map<String, dynamic> json) {
    ditchCleanApproach = json['ditch_clean_approach'];
    ditchCleanApproachDate = json['ditch_clean_approach_date'];
    ditchWaterLevel = json['ditch_water_level'];
    ditchWaterLevelDate = json['ditch_water_level_date'];
    dreger = json['dreger'];
    dregerDate = json['dreger_date'];
    ecofriendlyBanks = json['ecofriendly_banks'];
    ecofriendlyBanksDate = json['ecofriendly_banks_date'];
    grazedDitchEdge = json['grazed_ditch_edge'];
    grazedDitchEdgeDate = json['grazed_ditch_edge_date'];
    helofytenfilter = json['helofytenfilter'];
    helofytenfilterDate = json['helofytenfilter_date'];
    id = json['id'];
    manureFreeDitch = json['manure_free_ditch'];
    manureFreeDitchBuffer = json['manure_free_ditch_buffer'];
    manureFreeDitchBufferDate = json['manure_free_ditch_buffer_date'];
    manureFreeDitchDate = json['manure_free_ditch_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ditch_clean_approach'] = this.ditchCleanApproach;
    data['ditch_clean_approach_date'] = this.ditchCleanApproachDate;
    data['ditch_water_level'] = this.ditchWaterLevel;
    data['ditch_water_level_date'] = this.ditchWaterLevelDate;
    data['dreger'] = this.dreger;
    data['dreger_date'] = this.dregerDate;
    data['ecofriendly_banks'] = this.ecofriendlyBanks;
    data['ecofriendly_banks_date'] = this.ecofriendlyBanksDate;
    data['grazed_ditch_edge'] = this.grazedDitchEdge;
    data['grazed_ditch_edge_date'] = this.grazedDitchEdgeDate;
    data['helofytenfilter'] = this.helofytenfilter;
    data['helofytenfilter_date'] = this.helofytenfilterDate;
    data['id'] = this.id;
    data['manure_free_ditch'] = this.manureFreeDitch;
    data['manure_free_ditch_buffer'] = this.manureFreeDitchBuffer;
    data['manure_free_ditch_buffer_date'] = this.manureFreeDitchBufferDate;
    data['manure_free_ditch_date'] = this.manureFreeDitchDate;
    return data;
  }
}