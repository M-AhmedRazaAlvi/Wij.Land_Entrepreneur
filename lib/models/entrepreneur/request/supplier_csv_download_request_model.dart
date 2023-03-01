class SupplierCSVDownloadRequestModel {
  String? prefixEntity;
  Property? property;
  List<int>? selectedIds;

  SupplierCSVDownloadRequestModel(
      {this.prefixEntity, this.property, this.selectedIds});

  SupplierCSVDownloadRequestModel.fromJson(Map<String, dynamic> json) {
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
  String? supplierConnectSince;
  String? supplierFarmAutoName;
  String? supplierFarmRepresentativeName;
  String? supplierWiRelationType;

  Property(
      {this.supplierConnectSince,
        this.supplierFarmAutoName,
        this.supplierFarmRepresentativeName,
        this.supplierWiRelationType});

  Property.fromJson(Map<String, dynamic> json) {
    supplierConnectSince = json['supplier_connect_since'];
    supplierFarmAutoName = json['supplier_farm_auto_name'];
    supplierFarmRepresentativeName = json['supplier_farm_representative_name'];
    supplierWiRelationType = json['supplier_wi_relation_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplier_connect_since'] = this.supplierConnectSince;
    data['supplier_farm_auto_name'] = this.supplierFarmAutoName;
    data['supplier_farm_representative_name'] =
        this.supplierFarmRepresentativeName;
    data['supplier_wi_relation_type'] = this.supplierWiRelationType;
    return data;
  }
}