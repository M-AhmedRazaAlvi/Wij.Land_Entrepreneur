class FarmComputerKlimateCategoryDataOverviewResponseModel {
  Broeikasgassen? broeikasgassen;
  Energie? energie;
  int? id;

  FarmComputerKlimateCategoryDataOverviewResponseModel(
      {this.broeikasgassen, this.energie, this.id});

  FarmComputerKlimateCategoryDataOverviewResponseModel.fromJson(
      Map<String, dynamic> json) {
    broeikasgassen = json['broeikasgassen'] != null
        ? new Broeikasgassen.fromJson(json['broeikasgassen'])
        : null;
    energie =
    json['energie'] != null ? new Energie.fromJson(json['energie']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.broeikasgassen != null) {
      data['broeikasgassen'] = this.broeikasgassen!.toJson();
    }
    if (this.energie != null) {
      data['energie'] = this.energie!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Broeikasgassen {
  C02? c02;
  GreenhouseGases? greenhouseGases;

  Broeikasgassen({this.c02, this.greenhouseGases});

  Broeikasgassen.fromJson(Map<String, dynamic> json) {
    c02 = json['C02'] != null ? new C02.fromJson(json['C02']) : null;
    greenhouseGases = json['greenhouse_gases'] != null
        ? new GreenhouseGases.fromJson(json['greenhouse_gases'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.c02 != null) {
      data['C02'] = this.c02!.toJson();
    }
    if (this.greenhouseGases != null) {
      data['greenhouse_gases'] = this.greenhouseGases!.toJson();
    }
    return data;
  }
}

class C02 {
  String? co2MestopslGemWaardeDate;
  dynamic? co2EnergieRefWaarde;
  String? co2MestopslRefWaardeDate;
  dynamic? co2AanvoerGemWaarde;
  dynamic? co2MelkprodGemWaarde;
  dynamic? co2PensfermRefWaarde;
  String? co2AanvoerBedWaarde0Date;
  dynamic? co2PensfermGemWaarde;
  dynamic? co2MestopslGemWaarde;
  dynamic? co2AanvoerRefWaarde;
  dynamic? co2MestopslBedWaarde0;
  dynamic? co2EnergieBedWaarde0;
  String? co2AanvoerRefWaardeDate;
  dynamic? co2MelkprodBedWaarde0;
  String? co2EnergieGemWaardeDate;
  String? co2VoerprodRefWaardeDate;
  dynamic? co2MelkprodRefWaarde;
  String? co2EnergieBedWaarde0Date;
  String? co2AanvoerGemWaardeDate;
  dynamic? co2AanvoerBedWaarde0;
  String? co2EnergieRefWaardeDate;
  String? co2PensfermBedWaarde0Date;
  String? co2VoerprodGemWaardeDate;
  dynamic? co2VoerprodRefWaarde;
  String? co2MelkprodBedWaarde0Date;
  dynamic? co2PensfermBedWaarde0;
  String? co2MelkprodRefWaardeDate;
  dynamic? co2VoerprodGemWaarde;
  String? co2PensfermGemWaardeDate;
  String? co2PensfermRefWaardeDate;
  dynamic? co2VoerprodBedWaarde0;
  dynamic? co2EnergieGemWaarde;
  dynamic? co2MestopslRefWaarde;
  String? co2MelkprodGemWaardeDate;
  String? co2MestopslBedWaarde0Date;
  String? co2VoerprodBedWaarde0Date;

  C02(
      {this.co2MestopslGemWaardeDate,
        this.co2EnergieRefWaarde,
        this.co2MestopslRefWaardeDate,
        this.co2AanvoerGemWaarde,
        this.co2MelkprodGemWaarde,
        this.co2PensfermRefWaarde,
        this.co2AanvoerBedWaarde0Date,
        this.co2PensfermGemWaarde,
        this.co2MestopslGemWaarde,
        this.co2AanvoerRefWaarde,
        this.co2MestopslBedWaarde0,
        this.co2EnergieBedWaarde0,
        this.co2AanvoerRefWaardeDate,
        this.co2MelkprodBedWaarde0,
        this.co2EnergieGemWaardeDate,
        this.co2VoerprodRefWaardeDate,
        this.co2MelkprodRefWaarde,
        this.co2EnergieBedWaarde0Date,
        this.co2AanvoerGemWaardeDate,
        this.co2AanvoerBedWaarde0,
        this.co2EnergieRefWaardeDate,
        this.co2PensfermBedWaarde0Date,
        this.co2VoerprodGemWaardeDate,
        this.co2VoerprodRefWaarde,
        this.co2MelkprodBedWaarde0Date,
        this.co2PensfermBedWaarde0,
        this.co2MelkprodRefWaardeDate,
        this.co2VoerprodGemWaarde,
        this.co2PensfermGemWaardeDate,
        this.co2PensfermRefWaardeDate,
        this.co2VoerprodBedWaarde0,
        this.co2EnergieGemWaarde,
        this.co2MestopslRefWaarde,
        this.co2MelkprodGemWaardeDate,
        this.co2MestopslBedWaarde0Date,
        this.co2VoerprodBedWaarde0Date});

  C02.fromJson(Map<String, dynamic> json) {
    co2MestopslGemWaardeDate = json['co2_mestopsl_gem_waarde_date'];
    co2EnergieRefWaarde = json['co2_energie_ref_waarde'];
    co2MestopslRefWaardeDate = json['co2_mestopsl_ref_waarde_date'];
    co2AanvoerGemWaarde = json['co2_aanvoer_gem_waarde'];
    co2MelkprodGemWaarde = json['co2_melkprod_gem_waarde'];
    co2PensfermRefWaarde = json['co2_pensferm_ref_waarde'];
    co2AanvoerBedWaarde0Date = json['co2_aanvoer_bed_waarde0_date'];
    co2PensfermGemWaarde = json['co2_pensferm_gem_waarde'];
    co2MestopslGemWaarde = json['co2_mestopsl_gem_waarde'];
    co2AanvoerRefWaarde = json['co2_aanvoer_ref_waarde'];
    co2MestopslBedWaarde0 = json['co2_mestopsl_bed_waarde0'];
    co2EnergieBedWaarde0 = json['co2_energie_bed_waarde0'];
    co2AanvoerRefWaardeDate = json['co2_aanvoer_ref_waarde_date'];
    co2MelkprodBedWaarde0 = json['co2_melkprod_bed_waarde0'];
    co2EnergieGemWaardeDate = json['co2_energie_gem_waarde_date'];
    co2VoerprodRefWaardeDate = json['co2_voerprod_ref_waarde_date'];
    co2MelkprodRefWaarde = json['co2_melkprod_ref_waarde'];
    co2EnergieBedWaarde0Date = json['co2_energie_bed_waarde0_date'];
    co2AanvoerGemWaardeDate = json['co2_aanvoer_gem_waarde_date'];
    co2AanvoerBedWaarde0 = json['co2_aanvoer_bed_waarde0'];
    co2EnergieRefWaardeDate = json['co2_energie_ref_waarde_date'];
    co2PensfermBedWaarde0Date = json['co2_pensferm_bed_waarde0_date'];
    co2VoerprodGemWaardeDate = json['co2_voerprod_gem_waarde_date'];
    co2VoerprodRefWaarde = json['co2_voerprod_ref_waarde'];
    co2MelkprodBedWaarde0Date = json['co2_melkprod_bed_waarde0_date'];
    co2PensfermBedWaarde0 = json['co2_pensferm_bed_waarde0'];
    co2MelkprodRefWaardeDate = json['co2_melkprod_ref_waarde_date'];
    co2VoerprodGemWaarde = json['co2_voerprod_gem_waarde'];
    co2PensfermGemWaardeDate = json['co2_pensferm_gem_waarde_date'];
    co2PensfermRefWaardeDate = json['co2_pensferm_ref_waarde_date'];
    co2VoerprodBedWaarde0 = json['co2_voerprod_bed_waarde0'];
    co2EnergieGemWaarde = json['co2_energie_gem_waarde'];
    co2MestopslRefWaarde = json['co2_mestopsl_ref_waarde'];
    co2MelkprodGemWaardeDate = json['co2_melkprod_gem_waarde_date'];
    co2MestopslBedWaarde0Date = json['co2_mestopsl_bed_waarde0_date'];
    co2VoerprodBedWaarde0Date = json['co2_voerprod_bed_waarde0_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co2_mestopsl_gem_waarde_date'] = this.co2MestopslGemWaardeDate;
    data['co2_energie_ref_waarde'] = this.co2EnergieRefWaarde;
    data['co2_mestopsl_ref_waarde_date'] = this.co2MestopslRefWaardeDate;
    data['co2_aanvoer_gem_waarde'] = this.co2AanvoerGemWaarde;
    data['co2_melkprod_gem_waarde'] = this.co2MelkprodGemWaarde;
    data['co2_pensferm_ref_waarde'] = this.co2PensfermRefWaarde;
    data['co2_aanvoer_bed_waarde0_date'] = this.co2AanvoerBedWaarde0Date;
    data['co2_pensferm_gem_waarde'] = this.co2PensfermGemWaarde;
    data['co2_mestopsl_gem_waarde'] = this.co2MestopslGemWaarde;
    data['co2_aanvoer_ref_waarde'] = this.co2AanvoerRefWaarde;
    data['co2_mestopsl_bed_waarde0'] = this.co2MestopslBedWaarde0;
    data['co2_energie_bed_waarde0'] = this.co2EnergieBedWaarde0;
    data['co2_aanvoer_ref_waarde_date'] = this.co2AanvoerRefWaardeDate;
    data['co2_melkprod_bed_waarde0'] = this.co2MelkprodBedWaarde0;
    data['co2_energie_gem_waarde_date'] = this.co2EnergieGemWaardeDate;
    data['co2_voerprod_ref_waarde_date'] = this.co2VoerprodRefWaardeDate;
    data['co2_melkprod_ref_waarde'] = this.co2MelkprodRefWaarde;
    data['co2_energie_bed_waarde0_date'] = this.co2EnergieBedWaarde0Date;
    data['co2_aanvoer_gem_waarde_date'] = this.co2AanvoerGemWaardeDate;
    data['co2_aanvoer_bed_waarde0'] = this.co2AanvoerBedWaarde0;
    data['co2_energie_ref_waarde_date'] = this.co2EnergieRefWaardeDate;
    data['co2_pensferm_bed_waarde0_date'] = this.co2PensfermBedWaarde0Date;
    data['co2_voerprod_gem_waarde_date'] = this.co2VoerprodGemWaardeDate;
    data['co2_voerprod_ref_waarde'] = this.co2VoerprodRefWaarde;
    data['co2_melkprod_bed_waarde0_date'] = this.co2MelkprodBedWaarde0Date;
    data['co2_pensferm_bed_waarde0'] = this.co2PensfermBedWaarde0;
    data['co2_melkprod_ref_waarde_date'] = this.co2MelkprodRefWaardeDate;
    data['co2_voerprod_gem_waarde'] = this.co2VoerprodGemWaarde;
    data['co2_pensferm_gem_waarde_date'] = this.co2PensfermGemWaardeDate;
    data['co2_pensferm_ref_waarde_date'] = this.co2PensfermRefWaardeDate;
    data['co2_voerprod_bed_waarde0'] = this.co2VoerprodBedWaarde0;
    data['co2_energie_gem_waarde'] = this.co2EnergieGemWaarde;
    data['co2_mestopsl_ref_waarde'] = this.co2MestopslRefWaarde;
    data['co2_melkprod_gem_waarde_date'] = this.co2MelkprodGemWaardeDate;
    data['co2_mestopsl_bed_waarde0_date'] = this.co2MestopslBedWaarde0Date;
    data['co2_voerprod_bed_waarde0_date'] = this.co2VoerprodBedWaarde0Date;
    return data;
  }
}

class GreenhouseGases {
  dynamic? bkgAanvEne1;
  String? bkgAanvEne1Date;
  dynamic? co2Melkprod;
  String? co2MelkprodDate;
  dynamic? dzhCo2Melkvee;
  String? dzhCo2MelkveeDate;

  GreenhouseGases(
      {this.bkgAanvEne1,
        this.bkgAanvEne1Date,
        this.co2Melkprod,
        this.co2MelkprodDate,
        this.dzhCo2Melkvee,
        this.dzhCo2MelkveeDate});

  GreenhouseGases.fromJson(Map<String, dynamic> json) {
    bkgAanvEne1 = json['bkg_aanv_ene1'];
    bkgAanvEne1Date = json['bkg_aanv_ene1_date'];
    co2Melkprod = json['co2_melkprod'];
    co2MelkprodDate = json['co2_melkprod_date'];
    dzhCo2Melkvee = json['dzh_co2_melkvee'];
    dzhCo2MelkveeDate = json['dzh_co2_melkvee_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bkg_aanv_ene1'] = this.bkgAanvEne1;
    data['bkg_aanv_ene1_date'] = this.bkgAanvEne1Date;
    data['co2_melkprod'] = this.co2Melkprod;
    data['co2_melkprod_date'] = this.co2MelkprodDate;
    data['dzh_co2_melkvee'] = this.dzhCo2Melkvee;
    data['dzh_co2_melkvee_date'] = this.dzhCo2MelkveeDate;
    return data;
  }
}

class Energie {
  Consumption? consumption;
  Production? production;
  Sustainability? sustainability;

  Energie({this.consumption, this.production, this.sustainability});

  Energie.fromJson(Map<String, dynamic> json) {
    consumption = json['consumption'] != null
        ? new Consumption.fromJson(json['consumption'])
        : null;
    production = json['production'] != null
        ? new Production.fromJson(json['production'])
        : null;
    sustainability = json['sustainability'] != null
        ? new Sustainability.fromJson(json['sustainability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consumption != null) {
      data['consumption'] = this.consumption!.toJson();
    }
    if (this.production != null) {
      data['production'] = this.production!.toJson();
    }
    if (this.sustainability != null) {
      data['sustainability'] = this.sustainability!.toJson();
    }
    return data;
  }
}

class Consumption {
  dynamic? gasUseTotal;
  String? gasUseTotalDate;

  Consumption({this.gasUseTotal, this.gasUseTotalDate});

  Consumption.fromJson(Map<String, dynamic> json) {
    gasUseTotal = json['gas_use_total'];
    gasUseTotalDate = json['gas_use_total_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gas_use_total'] = this.gasUseTotal;
    data['gas_use_total_date'] = this.gasUseTotalDate;
    return data;
  }
}

class Production {
  dynamic? elekProdKwh;
  String? elekProdKwhDate;
  dynamic? elekProdPcbio;
  String? elekProdPcbioDate;
  dynamic? elekProdPcgvo;
  String? elekProdPcgvoDate;
  dynamic? elekProdPcove;
  String? elekProdPcoveDate;
  dynamic? elekProdPcwin;
  String? elekProdPcwinDate;
  dynamic? elekProdPczon;
  String? elekProdPczonDate;
  dynamic? elekTerugKwh;
  String? elekTerugKwhDate;

  Production(
      {this.elekProdKwh,
        this.elekProdKwhDate,
        this.elekProdPcbio,
        this.elekProdPcbioDate,
        this.elekProdPcgvo,
        this.elekProdPcgvoDate,
        this.elekProdPcove,
        this.elekProdPcoveDate,
        this.elekProdPcwin,
        this.elekProdPcwinDate,
        this.elekProdPczon,
        this.elekProdPczonDate,
        this.elekTerugKwh,
        this.elekTerugKwhDate});

  Production.fromJson(Map<String, dynamic> json) {
    elekProdKwh = json['elek_prod_kwh'];
    elekProdKwhDate = json['elek_prod_kwh_date'];
    elekProdPcbio = json['elek_prod_pcbio'];
    elekProdPcbioDate = json['elek_prod_pcbio_date'];
    elekProdPcgvo = json['elek_prod_pcgvo'];
    elekProdPcgvoDate = json['elek_prod_pcgvo_date'];
    elekProdPcove = json['elek_prod_pcove'];
    elekProdPcoveDate = json['elek_prod_pcove_date'];
    elekProdPcwin = json['elek_prod_pcwin'];
    elekProdPcwinDate = json['elek_prod_pcwin_date'];
    elekProdPczon = json['elek_prod_pczon'];
    elekProdPczonDate = json['elek_prod_pczon_date'];
    elekTerugKwh = json['elek_terug_kwh'];
    elekTerugKwhDate = json['elek_terug_kwh_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elek_prod_kwh'] = this.elekProdKwh;
    data['elek_prod_kwh_date'] = this.elekProdKwhDate;
    data['elek_prod_pcbio'] = this.elekProdPcbio;
    data['elek_prod_pcbio_date'] = this.elekProdPcbioDate;
    data['elek_prod_pcgvo'] = this.elekProdPcgvo;
    data['elek_prod_pcgvo_date'] = this.elekProdPcgvoDate;
    data['elek_prod_pcove'] = this.elekProdPcove;
    data['elek_prod_pcove_date'] = this.elekProdPcoveDate;
    data['elek_prod_pcwin'] = this.elekProdPcwin;
    data['elek_prod_pcwin_date'] = this.elekProdPcwinDate;
    data['elek_prod_pczon'] = this.elekProdPczon;
    data['elek_prod_pczon_date'] = this.elekProdPczonDate;
    data['elek_terug_kwh'] = this.elekTerugKwh;
    data['elek_terug_kwh_date'] = this.elekTerugKwhDate;
    return data;
  }
}

class Sustainability {
  dynamic? electrificationMachinery;
  dynamic? electrificationMachineryDate;
  dynamic? eneGasPcbio;
  String? eneGasPcbioDate;
  dynamic? heatRecovery;
  dynamic? heatRecoveryDate;
  dynamic? percentSolarWind;
  dynamic? percentSolarWindDate;

  Sustainability(
      {this.electrificationMachinery,
        this.electrificationMachineryDate,
        this.eneGasPcbio,
        this.eneGasPcbioDate,
        this.heatRecovery,
        this.heatRecoveryDate,
        this.percentSolarWind,
        this.percentSolarWindDate});

  Sustainability.fromJson(Map<String, dynamic> json) {
    electrificationMachinery = json['electrification_machinery'];
    electrificationMachineryDate = json['electrification_machinery_date'];
    eneGasPcbio = json['ene_gas_pcbio'];
    eneGasPcbioDate = json['ene_gas_pcbio_date'];
    heatRecovery = json['heat_recovery'];
    heatRecoveryDate = json['heat_recovery_date'];
    percentSolarWind = json['percent_solar_wind'];
    percentSolarWindDate = json['percent_solar_wind_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['electrification_machinery'] = this.electrificationMachinery;
    data['electrification_machinery_date'] = this.electrificationMachineryDate;
    data['ene_gas_pcbio'] = this.eneGasPcbio;
    data['ene_gas_pcbio_date'] = this.eneGasPcbioDate;
    data['heat_recovery'] = this.heatRecovery;
    data['heat_recovery_date'] = this.heatRecoveryDate;
    data['percent_solar_wind'] = this.percentSolarWind;
    data['percent_solar_wind_date'] = this.percentSolarWindDate;
    return data;
  }
}