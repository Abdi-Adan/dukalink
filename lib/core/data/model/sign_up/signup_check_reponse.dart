class SignUpCheckResponse {
  bool? status;
  SignUpCheckResponseData? data;

  SignUpCheckResponse({this.status, this.data});

  SignUpCheckResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? SignUpCheckResponseData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SignUpCheckResponseData {
  bool? status;
  String? reason;

  SignUpCheckResponseData({this.status, this.reason});

  SignUpCheckResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['reason'] = reason;
    return data;
  }
}
