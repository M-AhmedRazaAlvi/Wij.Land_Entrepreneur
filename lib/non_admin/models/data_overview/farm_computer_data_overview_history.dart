class DataOverviewFarmHistory {
  List<DataOverViewHistoryData>? data;
  String? message;
  int? status;

  DataOverviewFarmHistory({this.data, this.message, this.status});

  DataOverviewFarmHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataOverViewHistoryData>[];
      json['data'].forEach((v) {
        data!.add(new DataOverViewHistoryData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class DataOverViewHistoryData {
  String? dateChanged;
  String? property;
  String? editor;
  String? value;

  DataOverViewHistoryData({this.dateChanged, this.property, this.value, this.editor});

  DataOverViewHistoryData.fromJson(Map<String, dynamic> json) {
    dateChanged = json['date_changed'];
    property = json['property'];
    editor = json['editor'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_changed'] = this.dateChanged;
    data['property'] = this.property;
    data['editor'] = this.editor;
    data['value'] = this.value;
    return data;
  }
}
