class FarmComputerDierCategoryDataOverviewResponseModel {
  Animals? animals;
  int? id;
  Milk? milk;

  FarmComputerDierCategoryDataOverviewResponseModel(
      {this.animals, this.id, this.milk});

  FarmComputerDierCategoryDataOverviewResponseModel.fromJson(
      Map<String, dynamic> json) {
    animals =
    json['animals'] != null ? new Animals.fromJson(json['animals']) : null;
    id = json['id'];
    milk = json['milk'] != null ? new Milk.fromJson(json['milk']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animals != null) {
      data['animals'] = this.animals!.toJson();
    }
    data['id'] = this.id;
    if (this.milk != null) {
      data['milk'] = this.milk!.toJson();
    }
    return data;
  }
}

class Animals {
  dynamic? stallTypeComments;
  String? typestal1InsertedAt;
  String? typestal1;
  dynamic? gve;
  String? sheepInsertedAt;
  String? bkgProdVleesCattleInsertedAt;
  dynamic? gveHa;
  String? raceInsertedAt;
  dynamic? bkgProdVlees;
  dynamic? goats;
  String? youngCattleInsertedAt;
  String? milkCowsInsertedAt;
  String? stallTypeCommentsInsertedAt;
  dynamic? race;
  String? litterTypeInsertedAt;
  String? typestal2InsertedAt;
  String? melksysteem;
  dynamic? animalsComment;
  String? animalsCommentInsertedAt;
  String? goatsInsertedAt;
  String? gveInsertedAt;
  dynamic? additionsBox;
  dynamic? sheep;
  String? typestal2;
  dynamic? npinken;
  String? meatCowsInsertedAt;
  String? melksysteemInsertedAt;
  String? stallTypeInsertedAt;
  int? milkCows;
  String? gveHaInsertedAt;
  String? npinkenInsertedAt;
  String? additionsBoxInsertedAt;
  List<String>? litterType;
  dynamic? youngCattle;
  List<String>? stallType;
  int? meatCows;

  Animals(
      {this.stallTypeComments,
        this.typestal1InsertedAt,
        this.typestal1,
        this.gve,
        this.sheepInsertedAt,
        this.bkgProdVleesCattleInsertedAt,
        this.gveHa,
        this.raceInsertedAt,
        this.bkgProdVlees,
        this.goats,
        this.youngCattleInsertedAt,
        this.milkCowsInsertedAt,
        this.stallTypeCommentsInsertedAt,
        this.race,
        this.litterTypeInsertedAt,
        this.typestal2InsertedAt,
        this.melksysteem,
        this.animalsComment,
        this.animalsCommentInsertedAt,
        this.goatsInsertedAt,
        this.gveInsertedAt,
        this.additionsBox,
        this.sheep,
        this.typestal2,
        this.npinken,
        this.meatCowsInsertedAt,
        this.melksysteemInsertedAt,
        this.stallTypeInsertedAt,
        this.milkCows,
        this.gveHaInsertedAt,
        this.npinkenInsertedAt,
        this.additionsBoxInsertedAt,
        this.litterType,
        this.youngCattle,
        this.stallType,
        this.meatCows});

  Animals.fromJson(Map<String, dynamic> json) {
    stallTypeComments = json['stall_type_comments'];
    typestal1InsertedAt = json['typestal1_inserted_at'];
    typestal1 = json['typestal1'];
    gve = json['gve'];
    sheepInsertedAt = json['sheep_inserted_at'];
    bkgProdVleesCattleInsertedAt = json['bkg_prod_vlees_cattle_inserted_at'];
    gveHa = json['gve_ha'];
    raceInsertedAt = json['race_inserted_at'];
    bkgProdVlees = json['bkg_prod_vlees'];
    goats = json['goats'];
    youngCattleInsertedAt = json['young_cattle_inserted_at'];
    milkCowsInsertedAt = json['milk_cows_inserted_at'];
    stallTypeCommentsInsertedAt = json['stall_type_comments_inserted_at'];
    race = json['race'];
    litterTypeInsertedAt = json['litter_type_inserted_at'];
    typestal2InsertedAt = json['typestal2_inserted_at'];
    melksysteem = json['melksysteem'];
    animalsComment = json['animals_comment'];
    animalsCommentInsertedAt = json['animals_comment_inserted_at'];
    goatsInsertedAt = json['goats_inserted_at'];
    gveInsertedAt = json['gve_inserted_at'];
    additionsBox = json['additions_box'];
    sheep = json['sheep'];
    typestal2 = json['typestal2'];
    npinken = json['npinken'];
    meatCowsInsertedAt = json['meat_cows_inserted_at'];
    melksysteemInsertedAt = json['melksysteem_inserted_at'];
    stallTypeInsertedAt = json['stall_type_inserted_at'];
    milkCows = json['milk_cows'];
    gveHaInsertedAt = json['gve_ha_inserted_at'];
    npinkenInsertedAt = json['npinken_inserted_at'];
    additionsBoxInsertedAt = json['additions_box_inserted_at'];
    litterType = json['litter_type'].cast<String>();
    youngCattle = json['young_cattle'];
    stallType = json['stall_type'].cast<String>();
    meatCows = json['meat_cows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stall_type_comments'] = this.stallTypeComments;
    data['typestal1_inserted_at'] = this.typestal1InsertedAt;
    data['typestal1'] = this.typestal1;
    data['gve'] = this.gve;
    data['sheep_inserted_at'] = this.sheepInsertedAt;
    data['bkg_prod_vlees_cattle_inserted_at'] =
        this.bkgProdVleesCattleInsertedAt;
    data['gve_ha'] = this.gveHa;
    data['race_inserted_at'] = this.raceInsertedAt;
    data['bkg_prod_vlees'] = this.bkgProdVlees;
    data['goats'] = this.goats;
    data['young_cattle_inserted_at'] = this.youngCattleInsertedAt;
    data['milk_cows_inserted_at'] = this.milkCowsInsertedAt;
    data['stall_type_comments_inserted_at'] = this.stallTypeCommentsInsertedAt;
    data['race'] = this.race;
    data['litter_type_inserted_at'] = this.litterTypeInsertedAt;
    data['typestal2_inserted_at'] = this.typestal2InsertedAt;
    data['melksysteem'] = this.melksysteem;
    data['animals_comment'] = this.animalsComment;
    data['animals_comment_inserted_at'] = this.animalsCommentInsertedAt;
    data['goats_inserted_at'] = this.goatsInsertedAt;
    data['gve_inserted_at'] = this.gveInsertedAt;
    data['additions_box'] = this.additionsBox;
    data['sheep'] = this.sheep;
    data['typestal2'] = this.typestal2;
    data['npinken'] = this.npinken;
    data['meat_cows_inserted_at'] = this.meatCowsInsertedAt;
    data['melksysteem_inserted_at'] = this.melksysteemInsertedAt;
    data['stall_type_inserted_at'] = this.stallTypeInsertedAt;
    data['milk_cows'] = this.milkCows;
    data['gve_ha_inserted_at'] = this.gveHaInsertedAt;
    data['npinken_inserted_at'] = this.npinkenInsertedAt;
    data['additions_box_inserted_at'] = this.additionsBoxInsertedAt;
    data['litter_type'] = this.litterType;
    data['young_cattle'] = this.youngCattle;
    data['stall_type'] = this.stallType;
    data['meat_cows'] = this.meatCows;
    return data;
  }
}

class Milk {
  dynamic? bkgProdFpcm;
  String? bkgProdFpcmInsertedAt;
  dynamic? co2AllocmelkBedWaarde0;
  String? co2AllocmelkBedWaarde0InsertedAt;
  String? fatInsertedAt;
  dynamic? melkBedr;
  String? melkBedrInsertedAt;
  dynamic? melkEiwit;
  String? melkEiwitInsertedAt;
  dynamic? melkFosfor;
  String? melkFosforInsertedAt;
  dynamic? melkVet;
  int? milkProduction;
  String? milkProductionInsertedAt;
  dynamic? ureumNumber;
  String? ureumNumberInsertedAt;

  Milk(
      {this.bkgProdFpcm,
        this.bkgProdFpcmInsertedAt,
        this.co2AllocmelkBedWaarde0,
        this.co2AllocmelkBedWaarde0InsertedAt,
        this.fatInsertedAt,
        this.melkBedr,
        this.melkBedrInsertedAt,
        this.melkEiwit,
        this.melkEiwitInsertedAt,
        this.melkFosfor,
        this.melkFosforInsertedAt,
        this.melkVet,
        this.milkProduction,
        this.milkProductionInsertedAt,
        this.ureumNumber,
        this.ureumNumberInsertedAt});

  Milk.fromJson(Map<String, dynamic> json) {
    bkgProdFpcm = json['bkg_prod_fpcm'];
    bkgProdFpcmInsertedAt = json['bkg_prod_fpcm_inserted_at'];
    co2AllocmelkBedWaarde0 = json['co2_allocmelk_bed_waarde0'];
    co2AllocmelkBedWaarde0InsertedAt =
    json['co2_allocmelk_bed_waarde0_inserted_at'];
    fatInsertedAt = json['fat_inserted_at'];
    melkBedr = json['melk_bedr'];
    melkBedrInsertedAt = json['melk_bedr_inserted_at'];
    melkEiwit = json['melk_eiwit'];
    melkEiwitInsertedAt = json['melk_eiwit_inserted_at'];
    melkFosfor = json['melk_fosfor'];
    melkFosforInsertedAt = json['melk_fosfor_inserted_at'];
    melkVet = json['melk_vet'];
    milkProduction = json['milk_production'];
    milkProductionInsertedAt = json['milk_production_inserted_at'];
    ureumNumber = json['ureum_number'];
    ureumNumberInsertedAt = json['ureum_number_inserted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bkg_prod_fpcm'] = this.bkgProdFpcm;
    data['bkg_prod_fpcm_inserted_at'] = this.bkgProdFpcmInsertedAt;
    data['co2_allocmelk_bed_waarde0'] = this.co2AllocmelkBedWaarde0;
    data['co2_allocmelk_bed_waarde0_inserted_at'] =
        this.co2AllocmelkBedWaarde0InsertedAt;
    data['fat_inserted_at'] = this.fatInsertedAt;
    data['melk_bedr'] = this.melkBedr;
    data['melk_bedr_inserted_at'] = this.melkBedrInsertedAt;
    data['melk_eiwit'] = this.melkEiwit;
    data['melk_eiwit_inserted_at'] = this.melkEiwitInsertedAt;
    data['melk_fosfor'] = this.melkFosfor;
    data['melk_fosfor_inserted_at'] = this.melkFosforInsertedAt;
    data['melk_vet'] = this.melkVet;
    data['milk_production'] = this.milkProduction;
    data['milk_production_inserted_at'] = this.milkProductionInsertedAt;
    data['ureum_number'] = this.ureumNumber;
    data['ureum_number_inserted_at'] = this.ureumNumberInsertedAt;
    return data;
  }
}