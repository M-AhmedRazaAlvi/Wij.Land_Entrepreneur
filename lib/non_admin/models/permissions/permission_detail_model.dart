class PermissionDetailModel {
  PermissionDetailData? data;
  String? message;
  int? status;

  PermissionDetailModel({this.data, this.message, this.status});

  PermissionDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new PermissionDetailData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class PermissionDetailData {
  int? id;
  PermissionDetailImage? image;
  String? insertedAt;
  PermissionDetailMetaInfo? metaInfo;
  PermissionDetailOrganization? organization;
  PermissionDetailProject? project;
  String? requestEndDate;
  List<RequestPropertiesInformation>? requestPropertiesInformation;
  String? requestStartDate;
  String? requestType;
  List<PermissionDetailSource>? source;
  List<Status>? status;
  String? title;
  String? updatedAt;

  PermissionDetailData(
      {this.id,
      this.image,
      this.insertedAt,
      this.metaInfo,
      this.organization,
      this.project,
      this.requestEndDate,
      this.requestPropertiesInformation,
      this.requestStartDate,
      this.requestType,
      this.source,
      this.status,
      this.title,
      this.updatedAt});

  PermissionDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] != null ? new PermissionDetailImage.fromJson(json['image']) : null;
    insertedAt = json['inserted_at'];

    metaInfo = json['meta_info'] != null ? new PermissionDetailMetaInfo.fromJson(json['meta_info']) : null;
    organization = json['organization'] != null ? new PermissionDetailOrganization.fromJson(json['organization']) : null;
    project = json['project'] != null ? new PermissionDetailProject.fromJson(json['project']) : null;
    requestEndDate = json['request_end_date'];
    if (json['request_properties_information'] != null) {
      requestPropertiesInformation = <RequestPropertiesInformation>[];
      json['request_properties_information'].forEach((v) {
        requestPropertiesInformation!.add(new RequestPropertiesInformation.fromJson(v));
      });
    }
    requestStartDate = json['request_start_date'];
    requestType = json['request_type'];
    if (json['source'] != null) {
      source = <PermissionDetailSource>[];
      json['source'].forEach((v) {
        source!.add(new PermissionDetailSource.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['inserted_at'] = this.insertedAt;
    if (this.metaInfo != null) {
      data['meta_info'] = this.metaInfo!.toJson();
    }
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['request_end_date'] = this.requestEndDate;
    if (this.requestPropertiesInformation != null) {
      data['request_properties_information'] = this.requestPropertiesInformation!.map((v) => v.toJson()).toList();
    }
    data['request_start_date'] = this.requestStartDate;
    data['request_type'] = this.requestType;
    if (this.source != null) {
      data['source'] = this.source!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Status {
  String? color;
  int? id;
  String? status;

  Status({this.color, this.id, this.status});

  Status.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}

class RequestPropertiesInformation {
  bool? approvalStatus;
  String? dataKey;
  dynamic? feedback;
  int? id;

  RequestPropertiesInformation({this.approvalStatus, this.dataKey, this.feedback, this.id});

  RequestPropertiesInformation.fromJson(Map<String, dynamic> json) {
    approvalStatus = json['approval_status'];
    dataKey = json['data_key'];
    feedback = json['feedback'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approval_status'] = this.approvalStatus;
    data['data_key'] = this.dataKey;
    data['feedback'] = this.feedback;
    data['id'] = this.id;
    return data;
  }
}

class PermissionDetailImage {
  dynamic? comments;
  String? date;
  String? description;
  dynamic? favourite;
  File? file;
  dynamic? fileType;
  int? id;
  String? insertedAt;
  String? mime;
  String? path;
  String? title;
  dynamic? type;
  String? updatedAt;

  PermissionDetailImage(
      {this.comments,
      this.date,
      this.description,
      this.favourite,
      this.file,
      this.fileType,
      this.id,
      this.insertedAt,
      this.mime,
      this.path,
      this.title,
      this.type,
      this.updatedAt});

  PermissionDetailImage.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    date = json['date'];
    description = json['description'];
    favourite = json['favourite'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    fileType = json['file_type'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    mime = json['mime'];
    path = json['path'];
    title = json['title'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['date'] = this.date;
    data['description'] = this.description;
    data['favourite'] = this.favourite;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['file_type'] = this.fileType;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['title'] = this.title;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class File {
  String? large;
  String? mini;
  String? original;
  String? thumb;

  File({this.large, this.mini, this.original, this.thumb});

  File.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    mini = json['mini'];
    original = json['original'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['mini'] = this.mini;
    data['original'] = this.original;
    data['thumb'] = this.thumb;
    return data;
  }
}

class PermissionDetailMetaInfo {
  String? acceptanceMessage;
  String? acceptanceMessageDescription;
  String? assurance;
  String? assuranceDescription;
  String? benefits;
  String? benefitsDescription;
  String? guideline;
  String? guidelineDescription;
  String? procedure;
  String? procedureDescription;
  String? purpose;
  String? purposeDescription;
  String? rejectionMessage;
  String? rejectionMessageDescription;
  String? researchDetails;
  String? researchDetailsDescription;
  String? safeguard;
  String? safeguardDescription;
  String? usage;
  String? usageDescription;

  PermissionDetailMetaInfo(
      {this.acceptanceMessage,
      this.acceptanceMessageDescription,
      this.assurance,
      this.assuranceDescription,
      this.benefits,
      this.benefitsDescription,
      this.guideline,
      this.guidelineDescription,
      this.procedure,
      this.procedureDescription,
      this.purpose,
      this.purposeDescription,
      this.rejectionMessage,
      this.rejectionMessageDescription,
      this.researchDetails,
      this.researchDetailsDescription,
      this.safeguard,
      this.safeguardDescription,
      this.usage,
      this.usageDescription});

  PermissionDetailMetaInfo.fromJson(Map<String, dynamic> json) {
    acceptanceMessage = json['acceptance_message'];
    acceptanceMessageDescription = json['acceptance_message_description'];
    assurance = json['assurance'];
    assuranceDescription = json['assurance_description'];
    benefits = json['benefits'];
    benefitsDescription = json['benefits_description'];
    guideline = json['guideline'];
    guidelineDescription = json['guideline_description'];
    procedure = json['procedure'];
    procedureDescription = json['procedure_description'];
    purpose = json['purpose'];
    purposeDescription = json['purpose_description'];
    rejectionMessage = json['rejection_message'];
    rejectionMessageDescription = json['rejection_message_description'];
    researchDetails = json['research_details'];
    researchDetailsDescription = json['research_details_description'];
    safeguard = json['safeguard'];
    safeguardDescription = json['safeguard_description'];
    usage = json['usage'];
    usageDescription = json['usage_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acceptance_message'] = this.acceptanceMessage;
    data['acceptance_message_description'] = this.acceptanceMessageDescription;
    data['assurance'] = this.assurance;
    data['assurance_description'] = this.assuranceDescription;
    data['benefits'] = this.benefits;
    data['benefits_description'] = this.benefitsDescription;
    data['guideline'] = this.guideline;
    data['guideline_description'] = this.guidelineDescription;
    data['procedure'] = this.procedure;
    data['procedure_description'] = this.procedureDescription;
    data['purpose'] = this.purpose;
    data['purpose_description'] = this.purposeDescription;
    data['rejection_message'] = this.rejectionMessage;
    data['rejection_message_description'] = this.rejectionMessageDescription;
    data['research_details'] = this.researchDetails;
    data['research_details_description'] = this.researchDetailsDescription;
    data['safeguard'] = this.safeguard;
    data['safeguard_description'] = this.safeguardDescription;
    data['usage'] = this.usage;
    data['usage_description'] = this.usageDescription;
    return data;
  }
}

class PermissionDetailOrganization {
  int? id;

  String? organizationName;

  PermissionDetailOrganization({
    this.id,
    this.organizationName,
  });

  PermissionDetailOrganization.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    organizationName = json['organization_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['organization_name'] = this.organizationName;

    return data;
  }
}

class PermissionDetailProject {
  int? projectId;
  String? projectName;

  PermissionDetailProject({this.projectId, this.projectName});

  PermissionDetailProject.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    return data;
  }
}

class PermissionDetailSource {
  String? collectionType;
  int? id;
  String? justification;
  String? property;

  PermissionDetailSource({this.collectionType, this.id, this.justification, this.property});

  PermissionDetailSource.fromJson(Map<String, dynamic> json) {
    collectionType = json['collection_type'];
    id = json['id'];
    justification = json['justification'];
    property = json['property'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collection_type'] = this.collectionType;
    data['id'] = this.id;
    data['justification'] = this.justification;
    data['property'] = this.property;
    return data;
  }
}
