class EntrepreneurDownloadCSVRequestModel {
  String? prefixEntity;
  Property? property;
  List<int>? selectedIds;

  EntrepreneurDownloadCSVRequestModel(
      {this.prefixEntity, this.property, this.selectedIds});

  EntrepreneurDownloadCSVRequestModel.fromJson(Map<String, dynamic> json) {
    prefixEntity = json['prefix_entity'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    selectedIds = json['selected_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prefix_entity'] = this.prefixEntity;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    data['selected_ids'] = this.selectedIds;
    return data;
  }
}

class Property {
  String? entrepreneurName;
  String? entrepreneurFocusArea;
  String? entrepreneurLegalStructure;
  String? entrepreneurFarms;
  String? entrepreneurSellingLocations;

  Property(
      {this.entrepreneurName,
        this.entrepreneurFocusArea,
        this.entrepreneurLegalStructure,
        this.entrepreneurFarms,
        this.entrepreneurSellingLocations});

  Property.fromJson(Map<String, dynamic> json) {
    entrepreneurName = json['entrepreneur_name'];
    entrepreneurFocusArea = json['entrepreneur_focus_area'];
    entrepreneurLegalStructure = json['entrepreneur_legal_structure'];
    entrepreneurFarms = json['entrepreneur_farms'];
    entrepreneurSellingLocations = json['entrepreneur_selling_locations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entrepreneur_name'] = this.entrepreneurName;
    data['entrepreneur_focus_area'] = this.entrepreneurFocusArea;
    data['entrepreneur_legal_structure'] = this.entrepreneurLegalStructure;
    data['entrepreneur_farms'] = this.entrepreneurFarms;
    data['entrepreneur_selling_locations'] = this.entrepreneurSellingLocations;
    return data;
  }
}