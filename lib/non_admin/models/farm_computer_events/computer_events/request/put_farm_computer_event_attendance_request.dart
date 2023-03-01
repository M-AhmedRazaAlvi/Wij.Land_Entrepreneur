class PutFarmComputerEventAttendanceUpdateRequest {
  String? attendedMode;
  String? response;

  PutFarmComputerEventAttendanceUpdateRequest(
      {this.attendedMode, this.response});

  PutFarmComputerEventAttendanceUpdateRequest.fromJson(
      Map<String, dynamic> json) {
    attendedMode = json['attended_mode'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attended_mode'] = this.attendedMode;
    data['response'] = this.response;
    return data;
  }
}
