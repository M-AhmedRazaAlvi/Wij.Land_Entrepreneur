class GetFarmComputerActionResponse {
  List<Data>? data;
  String? message;
  int? status;

  GetFarmComputerActionResponse({this.data, this.message, this.status});

  GetFarmComputerActionResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  List<ActionDoneBy>? actionDoneBy;
  List<String>? actionType;
  String? doneOnDate;
  int? id;
  String? insertedAt;
  List<Parcels>? parcels;
  List<SubParcels>? subParcels;
  String? updatedAt;

  Data(
      {this.actionDoneBy,
      this.actionType,
      this.doneOnDate,
      this.id,
      this.insertedAt,
      this.parcels,
      this.subParcels,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['action_done_by'] != null) {
      actionDoneBy = <ActionDoneBy>[];
      json['action_done_by'].forEach((v) {
        actionDoneBy!.add(new ActionDoneBy.fromJson(v));
      });
    }
    actionType = json['action_type'].cast<String>();
    doneOnDate = json['done_on_date'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    if (json['parcels'] != null) {
      parcels = <Parcels>[];
      json['parcels'].forEach((v) {
        parcels!.add(new Parcels.fromJson(v));
      });
    }
    if (json['sub_parcels'] != null) {
      subParcels = <SubParcels>[];
      json['sub_parcels'].forEach((v) {
        subParcels!.add(new SubParcels.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.actionDoneBy != null) {
      data['action_done_by'] =
          this.actionDoneBy!.map((v) => v.toJson()).toList();
    }
    data['action_type'] = this.actionType;
    data['done_on_date'] = this.doneOnDate;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    if (this.parcels != null) {
      data['parcels'] = this.parcels!.map((v) => v.toJson()).toList();
    }
    if (this.subParcels != null) {
      data['sub_parcels'] = this.subParcels!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ActionDoneBy {
  int? id;
  String? insertedAt;
  String? name;
  String? updatedAt;

  ActionDoneBy({this.id, this.insertedAt, this.name, this.updatedAt});

  ActionDoneBy.fromJson(Map<String, dynamic> json) {
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

class Parcels {
  String? parcelName;
  int? id;
  String? insertedAt;
  String? updatedAt;

  Parcels({this.parcelName, this.id, this.insertedAt, this.updatedAt});

  Parcels.fromJson(Map<String, dynamic> json) {
    parcelName = json['Parcel_name'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Parcel_name'] = this.parcelName;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SubParcels {
  String? subParcelName;
  int? id;
  String? insertedAt;
  String? updatedAt;

  SubParcels({this.subParcelName, this.id, this.insertedAt, this.updatedAt});

  SubParcels.fromJson(Map<String, dynamic> json) {
    subParcelName = json['Sub_parcel_name'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sub_parcel_name'] = this.subParcelName;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
