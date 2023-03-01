import 'dart:convert';

class AnacdotsUserModel {
  Data? data;
  String? message;
  int? status;
  Error? error;

  AnacdotsUserModel({this.data, this.message, this.status, this.error});

  AnacdotsUserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (error != null) {
      data['errors'] = this.error!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  bool? active;
  bool? autoGeneratePass;
  String? deletedAt;
  String? email;
  int? id;
  String? insertedAt;
  String? name;
  bool? passwordSkip;
  Person? person;
  int? personId;
  String? token;
  String? updatedAt;

  Data(
      {this.active,
      this.autoGeneratePass,
      this.deletedAt,
      this.email,
      this.id,
      this.insertedAt,
      this.name,
      this.passwordSkip,
      this.person,
      this.personId,
      this.token,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    autoGeneratePass = json['auto_generate_pass'];
    deletedAt = json['deleted_at'];
    email = json['email'];
    id = json['id'];
    insertedAt = json['inserted_at'];
    name = json['name'];
    passwordSkip = json['password_skip'];
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    personId = json['person_id'];
    token = json['token'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['active'] = this.active;
    data['auto_generate_pass'] = this.autoGeneratePass;
    data['deleted_at'] = this.deletedAt;
    data['email'] = this.email;
    data['id'] = this.id;
    data['inserted_at'] = this.insertedAt;
    data['name'] = this.name;
    data['password_skip'] = this.passwordSkip;
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    data['person_id'] = this.personId;
    data['token'] = this.token;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Person {
  String? user;
  bool? checkMember;
  String? houseNumber;
  bool? checkLand;
  String? firstName;
  String? representativeDni;
  String? withLand;
  bool? checkAgriculture;
  bool? checkAlvelal;
  String? comment;
  String? activityDescription;
  String? website;
  String? deletedAt;
  int? personImageId;
  Birthday? birthday;
  String? zipCodeNumber;
  String? role;
  String? cif;
  String? generalComments;
  String? insertedAt;
  List<String>? files;
  double? lat;
  String? secondDescription;
  double? long;
  List<String>? requests;
  List<String>? dbActions;
  int? id;
  String? lastName;
  PersonImage? personImage;
  String? financial;
  String? memberType;
  String? city;
  String? gender;
  String? phoneNumberMobile;
  String? province;
  bool? checkWebsite;
  List<String>? pInOrganization;
  String? updatedAt;
  List<String>? mediaOutages;
  String? municipality;
  List<String>? organizations;
  String? emailAddress;
  String? connectedWithAlvelalSince;

  Person(
      {this.user,
      this.checkMember,
      this.houseNumber,
      this.checkLand,
      this.firstName,
      this.representativeDni,
      this.withLand,
      this.checkAgriculture,
      this.checkAlvelal,
      this.comment,
      this.activityDescription,
      this.website,
      this.deletedAt,
      this.personImageId,
      this.birthday,
      this.zipCodeNumber,
      this.role,
      this.cif,
      this.generalComments,
      this.insertedAt,
      this.files,
      this.lat,
      this.secondDescription,
      this.long,
      this.requests,
      this.dbActions,
      this.id,
      this.lastName,
      this.personImage,
      this.financial,
      this.memberType,
      this.city,
      this.gender,
      this.phoneNumberMobile,
      this.province,
      this.checkWebsite,
      this.pInOrganization,
      this.updatedAt,
      this.mediaOutages,
      this.municipality,
      this.organizations,
      this.emailAddress,
      this.connectedWithAlvelalSince});

  Person.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    checkMember = json['check_member'];
    houseNumber = json['house_number'];
    checkLand = json['check_land'];
    firstName = json['first_name'];
    representativeDni = json['representative_dni'];
    withLand = json['with_land'];
    checkAgriculture = json['check_agriculture'];
    checkAlvelal = json['check_alvelal'];
    comment = json['comment'];
    activityDescription = json['activity_description'];
    website = json['website'];
    deletedAt = json['deleted_at'];
    personImageId = json['person_image_id'];
    birthday =
        json['birthday'] != null ? Birthday.fromJson(json['birthday']) : null;
    zipCodeNumber = json['zip_code_number'];
    role = json['role'];
    cif = json['cif'];
    generalComments = json['general_comments'];
    insertedAt = json['inserted_at'];
    /* if (json['files'] != null) {
      files = <String>[];
      json['files'].forEach((v) {
        files!.add( String.fromJson(v));
      });
    }*/
    lat = json['lat'];
    secondDescription = json['second_description'];
    long = json['long'];
    /* if (json['requests'] != null) {
      requests = <String>[];
      json['requests'].forEach((v) {
        requests!.add( String.fromJson(v));
      });
    }*/
    /*if (json['db_actions'] != null) {
      dbActions = <String>[];
      json['db_actions'].forEach((v) {
        dbActions!.add( String.fromJson(v));
      });
    }*/
    id = json['id'];
    lastName = json['last_name'];
    personImage = json['person_image'] != null
        ? PersonImage.fromJson(json['person_image'])
        : null;
    financial = json['financial'];
    memberType = json['member_type'];
    city = json['city'];
    gender = json['gender'];
    phoneNumberMobile = json['phone_number_mobile'];
    province = json['province'];
    checkWebsite = json['check_website'];
    /* if (json['p_in_organization'] != null) {
      pInOrganization = <String>[];
      json['p_in_organization'].forEach((v) {
        pInOrganization!.add( String.fromJson(v));
      });
    }*/
    updatedAt = json['updated_at'];
    /*if (json['media_outages'] != null) {
      mediaOutages = <String>[];
      json['media_outages'].forEach((v) {
        mediaOutages!.add( File.fromJson(v));
      });
    }*/
    municipality = json['municipality'];
    /*  if (json['organizations'] != null) {
      organizations = <String>[];
      json['organizations'].forEach((v) {
        organizations!.add( String.fromJson(v));
      });
    }*/
    emailAddress = json['email_address'];
    connectedWithAlvelalSince = json['connected_with_alvelal_since'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = this.user;
    data['check_member'] = this.checkMember;
    data['house_number'] = this.houseNumber;
    data['check_land'] = this.checkLand;
    data['first_name'] = this.firstName;
    data['representative_dni'] = this.representativeDni;
    data['with_land'] = this.withLand;
    data['check_agriculture'] = this.checkAgriculture;
    data['check_alvelal'] = this.checkAlvelal;
    data['comment'] = this.comment;
    data['activity_description'] = this.activityDescription;
    data['website'] = this.website;
    data['deleted_at'] = this.deletedAt;
    data['person_image_id'] = this.personImageId;
    if (this.birthday != null) {
      data['birthday'] = this.birthday!.toJson();
    }
    data['zip_code_number'] = this.zipCodeNumber;
    data['role'] = this.role;
    data['cif'] = this.cif;
    data['general_comments'] = this.generalComments;
    data['inserted_at'] = this.insertedAt;
    /* if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }*/
    data['lat'] = this.lat;
    data['second_description'] = this.secondDescription;
    data['long'] = this.long;
    /*if (this.requests != null) {
      data['requests'] = this.requests!.map((v) => v.toJson()).toList();
    }
    if (this.dbActions != null) {
      data['db_actions'] = this.dbActions!.map((v) => v.toJson()).toList();
    }*/
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    if (this.personImage != null) {
      data['person_image'] = this.personImage!.toJson();
    }
    data['financial'] = this.financial;
    data['member_type'] = this.memberType;
    data['city'] = this.city;
    data['gender'] = this.gender;
    data['phone_number_mobile'] = this.phoneNumberMobile;
    data['province'] = this.province;
    data['check_website'] = this.checkWebsite;
    /*if (this.pInOrganization != null) {
      data['p_in_organization'] =
          this.pInOrganization!.map((v) => v.toJson()).toList();
    }*/
    data['updated_at'] = this.updatedAt;
    /*if (this.mediaOutages != null) {
      data['media_outages'] =
          this.mediaOutages!.map((v) => v.toJson()).toList();
    }*/
    data['municipality'] = this.municipality;
    /*if (this.organizations != null) {
      data['organizations'] =
          this.organizations!.map((v) => v.toJson()).toList();
    }*/
    data['email_address'] = this.emailAddress;
    data['connected_with_alvelal_since'] = this.connectedWithAlvelalSince;
    return data;
  }
}

class Birthday {
  String? calendar;
  int? day;
  int? month;
  int? year;

  Birthday({this.calendar, this.day, this.month, this.year});

  Birthday.fromJson(Map<String, dynamic> json) {
    calendar = json['calendar'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['calendar'] = this.calendar;
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    return data;
  }
}

class PersonImage {
  String? pgSubTask;
  String? dbAction;
  String? type;
  Birthday? date;
  String? pgSubTaskId;
  String? description;
  String? comments;
  String? pgTaskId;
  String? organization;
  String? baseEntity;
  String? pgTask;
  bool? isFavicon;
  String? mediaId;
  String? video;
  String? weeklyPlanning;
  String? comment;
  String? fileType;
  String? baseEntityId;
  String? anecdoteId;
  String? deletedAt;
  String? organizationId;
  String? title;
  String? addedById;
  String? commentId;
  bool? checkImage;
  String? dbActionId;
  String? event;
  bool? checkReport;
  String? parcel;
  String? postId;
  String? request;
  String? eventId;
  String? anecdote;
  String? image;
  String? media;
  String? weeklyPlanningId;
  String? meeting;
  String? insertedAt;
  String? addedBy;
  bool? checkVideo;
  String? post;
  String? mime;
  File? file;
  String? dbProject;
  String? requestId;
  int? id;
  bool? isLogo;
  String? dbProjectId;
  String? geeLayer;
  String? meetingId;
  String? path;
  String? updatedAt;
  String? person;
  List<String>? mediaOutages;
  String? report;
  String? geeLayerId;
  String? personId;

  PersonImage(
      {this.pgSubTask,
      this.dbAction,
      this.type,
      this.date,
      this.pgSubTaskId,
      this.description,
      this.comments,
      this.pgTaskId,
      this.organization,
      this.baseEntity,
      this.pgTask,
      this.isFavicon,
      this.mediaId,
      this.video,
      this.weeklyPlanning,
      this.comment,
      this.fileType,
      this.baseEntityId,
      this.anecdoteId,
      this.deletedAt,
      this.organizationId,
      this.title,
      this.addedById,
      this.commentId,
      this.checkImage,
      this.dbActionId,
      this.event,
      this.checkReport,
      this.parcel,
      this.postId,
      this.request,
      this.eventId,
      this.anecdote,
      this.image,
      this.media,
      this.weeklyPlanningId,
      this.meeting,
      this.insertedAt,
      this.addedBy,
      this.checkVideo,
      this.post,
      this.mime,
      this.file,
      this.dbProject,
      this.requestId,
      this.id,
      this.isLogo,
      this.dbProjectId,
      this.geeLayer,
      this.meetingId,
      this.path,
      this.updatedAt,
      this.person,
      this.mediaOutages,
      this.report,
      this.geeLayerId,
      this.personId});

  PersonImage.fromJson(Map<String, dynamic> json) {
    pgSubTask = json['pg_sub_task'];
    dbAction = json['db_action'];
    type = json['type'];
    date = json['date'] != null ? Birthday.fromJson(json['date']) : null;
    pgSubTaskId = json['pg_sub_task_id'];
    description = json['description'];
    comments = json['comments'];
    pgTaskId = json['pg_task_id'];
    organization = json['organization'];
    baseEntity = json['base_entity'];
    pgTask = json['pg_task'];
    isFavicon = json['is_favicon'];
    mediaId = json['media_id'];
    video = json['video'];
    weeklyPlanning = json['weekly_planning'];
    comment = json['comment'];
    fileType = json['file_type'];
    baseEntityId = json['base_entity_id'];
    anecdoteId = json['anecdote_id'];
    deletedAt = json['deleted_at'];
    organizationId = json['organization_id'];
    title = json['title'];
    addedById = json['added_by_id'];
    commentId = json['comment_id'];
    checkImage = json['check_image'];
    dbActionId = json['db_action_id'];
    event = json['event'];
    checkReport = json['check_report'];
    parcel = json['parcel'];
    postId = json['post_id'];
    request = json['request'];
    eventId = json['event_id'];
    anecdote = json['anecdote'];
    image = json['image'];
    media = json['media'];
    weeklyPlanningId = json['weekly_planning_id'];
    meeting = json['meeting'];
    insertedAt = json['inserted_at'];
    addedBy = json['added_by'];
    checkVideo = json['check_video'];
    post = json['post'];
    mime = json['mime'];
    file = json['file'] != null ? File.fromJson(json['file']) : null;
    dbProject = json['db_project'];
    requestId = json['request_id'];
    id = json['id'];
    isLogo = json['is_logo'];
    dbProjectId = json['db_project_id'];
    geeLayer = json['gee_layer'];
    meetingId = json['meeting_id'];
    path = json['path'];
    updatedAt = json['updated_at'];
    person = json['person'];
    /*if (json['media_outages'] != null) {
      mediaOutages = <String>[];
      json['media_outages'].forEach((v) {
        mediaOutages!.add( String.fromJson(v));
      });
    }*/
    report = json['report'];
    geeLayerId = json['gee_layer_id'];
    personId = json['person_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pg_sub_task'] = this.pgSubTask;
    data['db_action'] = this.dbAction;
    data['type'] = this.type;
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['pg_sub_task_id'] = this.pgSubTaskId;
    data['description'] = this.description;
    data['comments'] = this.comments;
    data['pg_task_id'] = this.pgTaskId;
    data['organization'] = this.organization;
    data['base_entity'] = this.baseEntity;
    data['pg_task'] = this.pgTask;
    data['is_favicon'] = this.isFavicon;
    data['media_id'] = this.mediaId;
    data['video'] = this.video;
    data['weekly_planning'] = this.weeklyPlanning;
    data['comment'] = this.comment;
    data['file_type'] = this.fileType;
    data['base_entity_id'] = this.baseEntityId;
    data['anecdote_id'] = this.anecdoteId;
    data['deleted_at'] = this.deletedAt;
    data['organization_id'] = this.organizationId;
    data['title'] = this.title;
    data['added_by_id'] = this.addedById;
    data['comment_id'] = this.commentId;
    data['check_image'] = this.checkImage;
    data['db_action_id'] = this.dbActionId;
    data['event'] = this.event;
    data['check_report'] = this.checkReport;
    data['parcel'] = this.parcel;
    data['post_id'] = this.postId;
    data['request'] = this.request;
    data['event_id'] = this.eventId;
    data['anecdote'] = this.anecdote;
    data['image'] = this.image;
    data['media'] = this.media;
    data['weekly_planning_id'] = this.weeklyPlanningId;
    data['meeting'] = this.meeting;
    data['inserted_at'] = this.insertedAt;
    data['added_by'] = this.addedBy;
    data['check_video'] = this.checkVideo;
    data['post'] = this.post;
    data['mime'] = this.mime;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['db_project'] = this.dbProject;
    data['request_id'] = this.requestId;
    data['id'] = this.id;
    data['is_logo'] = this.isLogo;
    data['db_project_id'] = this.dbProjectId;
    data['gee_layer'] = this.geeLayer;
    data['meeting_id'] = this.meetingId;
    data['path'] = this.path;
    data['updated_at'] = this.updatedAt;
    data['person'] = this.person;
    /* if (this.mediaOutages != null) {
      data['media_outages'] =
          this.mediaOutages!.map((v) => v?.toJson()).toList();
    }*/
    data['report'] = this.report;
    data['gee_layer_id'] = this.geeLayerId;
    data['person_id'] = this.personId;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['large'] = this.large;
    data['mini'] = this.mini;
    data['original'] = this.original;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Error {
  String? message;
  int? status;

  Error({this.message, this.status});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
