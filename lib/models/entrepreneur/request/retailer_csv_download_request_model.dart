class RetailsCSVDownloadRequestModel {
  String? prefixEntity;
  Property? property;
  List<int>? selectedIds;

  RetailsCSVDownloadRequestModel(
      {this.prefixEntity, this.property, this.selectedIds});

  RetailsCSVDownloadRequestModel.fromJson(Map<String, dynamic> json) {
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
  String? retailerRetailerName;
  String? retailerAddress;
  String? retailerPhoneNumber;
  String? retailerShop;
  String? retailerWebsite;

  Property(
      {this.retailerRetailerName,
        this.retailerAddress,
        this.retailerPhoneNumber,
        this.retailerShop,
        this.retailerWebsite});

  Property.fromJson(Map<String, dynamic> json) {
    retailerRetailerName = json['retailer_retailer_name'];
    retailerAddress = json['retailer_address'];
    retailerPhoneNumber = json['retailer_phone_number'];
    retailerShop = json['retailer_shop'];
    retailerWebsite = json['retailer_website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retailer_retailer_name'] = this.retailerRetailerName;
    data['retailer_address'] = this.retailerAddress;
    data['retailer_phone_number'] = this.retailerPhoneNumber;
    data['retailer_shop'] = this.retailerShop;
    data['retailer_website'] = this.retailerWebsite;
    return data;
  }
}