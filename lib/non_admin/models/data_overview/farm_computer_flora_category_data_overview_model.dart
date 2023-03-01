class FarmComputerFloraCategoryDataOverviewResponseModel {
  Erfinrichting? erfinrichting;
  int? id;
  Kruidenrijk? kruidenrijk;
  Landschapselementen? landschapselementen;
  Pesticides? pesticides;
  Weidevogels? weidevogels;

  FarmComputerFloraCategoryDataOverviewResponseModel(
      {this.erfinrichting,
        this.id,
        this.kruidenrijk,
        this.landschapselementen,
        this.pesticides,
        this.weidevogels});

  FarmComputerFloraCategoryDataOverviewResponseModel.fromJson(
      Map<String, dynamic> json) {
    erfinrichting = json['erfinrichting'] != null
        ? new Erfinrichting.fromJson(json['erfinrichting'])
        : null;
    id = json['id'];
    kruidenrijk = json['kruidenrijk'] != null
        ? new Kruidenrijk.fromJson(json['kruidenrijk'])
        : null;
    landschapselementen = json['landschapselementen'] != null
        ? new Landschapselementen.fromJson(json['landschapselementen'])
        : null;
    pesticides = json['pesticides'] != null
        ? new Pesticides.fromJson(json['pesticides'])
        : null;
    weidevogels = json['weidevogels'] != null
        ? new Weidevogels.fromJson(json['weidevogels'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.erfinrichting != null) {
      data['erfinrichting'] = this.erfinrichting!.toJson();
    }
    data['id'] = this.id;
    if (this.kruidenrijk != null) {
      data['kruidenrijk'] = this.kruidenrijk!.toJson();
    }
    if (this.landschapselementen != null) {
      data['landschapselementen'] = this.landschapselementen!.toJson();
    }
    if (this.pesticides != null) {
      data['pesticides'] = this.pesticides!.toJson();
    }
    if (this.weidevogels != null) {
      data['weidevogels'] = this.weidevogels!.toJson();
    }
    return data;
  }
}

class Erfinrichting {
  dynamic? amountTrees;
  dynamic? amountTreesDate;
  dynamic? insecthotelsAmount;
  dynamic? insecthotelsAmountDate;
  dynamic? nestboxesAmount;
  dynamic? nestboxesAmountDate;
  dynamic? propertyscanElements;
  dynamic? propertyscanElementsDate;
  dynamic? typesTrees;
  dynamic? typesTreesDate;
  dynamic? woodwallMeters;
  dynamic? woodwallMetersDate;

  Erfinrichting(
      {this.amountTrees,
        this.amountTreesDate,
        this.insecthotelsAmount,
        this.insecthotelsAmountDate,
        this.nestboxesAmount,
        this.nestboxesAmountDate,
        this.propertyscanElements,
        this.propertyscanElementsDate,
        this.typesTrees,
        this.typesTreesDate,
        this.woodwallMeters,
        this.woodwallMetersDate});

  Erfinrichting.fromJson(Map<String, dynamic> json) {
    amountTrees = json['amount_trees'];
    amountTreesDate = json['amount_trees_date'];
    insecthotelsAmount = json['insecthotels_amount'];
    insecthotelsAmountDate = json['insecthotels_amount_date'];
    nestboxesAmount = json['nestboxes_amount'];
    nestboxesAmountDate = json['nestboxes_amount_date'];
    propertyscanElements = json['propertyscan_elements'];
    propertyscanElementsDate = json['propertyscan_elements_date'];
    typesTrees = json['types_trees'];
    typesTreesDate = json['types_trees_date'];
    woodwallMeters = json['woodwall_meters'];
    woodwallMetersDate = json['woodwall_meters_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount_trees'] = this.amountTrees;
    data['amount_trees_date'] = this.amountTreesDate;
    data['insecthotels_amount'] = this.insecthotelsAmount;
    data['insecthotels_amount_date'] = this.insecthotelsAmountDate;
    data['nestboxes_amount'] = this.nestboxesAmount;
    data['nestboxes_amount_date'] = this.nestboxesAmountDate;
    data['propertyscan_elements'] = this.propertyscanElements;
    data['propertyscan_elements_date'] = this.propertyscanElementsDate;
    data['types_trees'] = this.typesTrees;
    data['types_trees_date'] = this.typesTreesDate;
    data['woodwall_meters'] = this.woodwallMeters;
    data['woodwall_meters_date'] = this.woodwallMetersDate;
    return data;
  }
}

class Kruidenrijk {
  dynamic? botanicalCompostion;
  String? botanicalCompostionDate;
  dynamic? herbRichness;
  String? herbRichnessDate;
  dynamic? unwantedPlants;
  String? unwantedPlantsDate;

  Kruidenrijk(
      {this.botanicalCompostion,
        this.botanicalCompostionDate,
        this.herbRichness,
        this.herbRichnessDate,
        this.unwantedPlants,
        this.unwantedPlantsDate});

  Kruidenrijk.fromJson(Map<String, dynamic> json) {
    botanicalCompostion = json['botanical_compostion'];
    botanicalCompostionDate = json['botanical_compostion_date'];
    herbRichness = json['herb_richness'];
    herbRichnessDate = json['herb_richness_date'];
    unwantedPlants = json['unwanted_plants'];
    unwantedPlantsDate = json['unwanted_plants_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['botanical_compostion'] = this.botanicalCompostion;
    data['botanical_compostion_date'] = this.botanicalCompostionDate;
    data['herb_richness'] = this.herbRichness;
    data['herb_richness_date'] = this.herbRichnessDate;
    data['unwanted_plants'] = this.unwantedPlants;
    data['unwanted_plants_date'] = this.unwantedPlantsDate;
    return data;
  }
}

class Landschapselementen {
  dynamic? percentBlueElements;
  dynamic? percentBlueElementsDate;
  dynamic? percentGreenElements;
  dynamic? percentGreenElementsDate;

  Landschapselementen(
      {this.percentBlueElements,
        this.percentBlueElementsDate,
        this.percentGreenElements,
        this.percentGreenElementsDate});

  Landschapselementen.fromJson(Map<String, dynamic> json) {
    percentBlueElements = json['percent_blue_elements'];
    percentBlueElementsDate = json['percent_blue_elements_date'];
    percentGreenElements = json['percent_green_elements'];
    percentGreenElementsDate = json['percent_green_elements_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percent_blue_elements'] = this.percentBlueElements;
    data['percent_blue_elements_date'] = this.percentBlueElementsDate;
    data['percent_green_elements'] = this.percentGreenElements;
    data['percent_green_elements_date'] = this.percentGreenElementsDate;
    return data;
  }
}

class Pesticides {
  dynamic? naturalPharmacy;
  dynamic? naturalPharmacyDate;
  List<String>? pesticidesCropland;
  String? pesticidesCroplandDate;
  List<String>? pesticidesGrassland;
  String? pesticidesGrasslandDate;
  dynamic? preventativeMedicine;
  dynamic? preventativeMedicineDate;

  Pesticides(
      {this.naturalPharmacy,
        this.naturalPharmacyDate,
        this.pesticidesCropland,
        this.pesticidesCroplandDate,
        this.pesticidesGrassland,
        this.pesticidesGrasslandDate,
        this.preventativeMedicine,
        this.preventativeMedicineDate});

  Pesticides.fromJson(Map<String, dynamic> json) {
    naturalPharmacy = json['natural_pharmacy'];
    naturalPharmacyDate = json['natural_pharmacy_date'];
    pesticidesCropland = json['pesticides_cropland'].cast<String>();
    pesticidesCroplandDate = json['pesticides_cropland_date'];
    pesticidesGrassland = json['pesticides_grassland'].cast<String>();
    pesticidesGrasslandDate = json['pesticides_grassland_date'];
    preventativeMedicine = json['preventative_medicine'];
    preventativeMedicineDate = json['preventative_medicine_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['natural_pharmacy'] = this.naturalPharmacy;
    data['natural_pharmacy_date'] = this.naturalPharmacyDate;
    data['pesticides_cropland'] = this.pesticidesCropland;
    data['pesticides_cropland_date'] = this.pesticidesCroplandDate;
    data['pesticides_grassland'] = this.pesticidesGrassland;
    data['pesticides_grassland_date'] = this.pesticidesGrasslandDate;
    data['preventative_medicine'] = this.preventativeMedicine;
    data['preventative_medicine_date'] = this.preventativeMedicineDate;
    return data;
  }
}

class Weidevogels {
  dynamic? ifYesWhichDate;
  String? ifYesWhichDateDate;
  dynamic? mowingManagement;
  dynamic? mowingManagementDate;
  dynamic? mowingMowingStairs;
  String? mowingMowingStairsDate;
  dynamic? nestProtection;
  dynamic? nestProtectionDate;

  Weidevogels(
      {this.ifYesWhichDate,
        this.ifYesWhichDateDate,
        this.mowingManagement,
        this.mowingManagementDate,
        this.mowingMowingStairs,
        this.mowingMowingStairsDate,
        this.nestProtection,
        this.nestProtectionDate});

  Weidevogels.fromJson(Map<String, dynamic> json) {
    ifYesWhichDate = json['if_yes_which_date'];
    ifYesWhichDateDate = json['if_yes_which_date_date'];
    mowingManagement = json['mowing_management'];
    mowingManagementDate = json['mowing_management_date'];
    mowingMowingStairs = json['mowing_mowing_stairs'];
    mowingMowingStairsDate = json['mowing_mowing_stairs_date'];
    nestProtection = json['nest_protection'];
    nestProtectionDate = json['nest_protection_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['if_yes_which_date'] = this.ifYesWhichDate;
    data['if_yes_which_date_date'] = this.ifYesWhichDateDate;
    data['mowing_management'] = this.mowingManagement;
    data['mowing_management_date'] = this.mowingManagementDate;
    data['mowing_mowing_stairs'] = this.mowingMowingStairs;
    data['mowing_mowing_stairs_date'] = this.mowingMowingStairsDate;
    data['nest_protection'] = this.nestProtection;
    data['nest_protection_date'] = this.nestProtectionDate;
    return data;
  }
}