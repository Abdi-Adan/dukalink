class SignUpCheckRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? password;

  SignUpCheckRequest(
      {this.firstName, this.lastName, this.email, this.mobile, this.password});

  SignUpCheckRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile_no'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_no'] = mobile;
    data['password'] = password;
    data['email'] = email;
    data['user_type'] = "Client";
    data['profile_pic_url'] =
        "https://firebasestorage.googleapis.com/v0/b/dukalink.appspot.com/o/images%2Favatars%2Flaunch_icon.png?alt=media&token=19fccc59-56c0-44c4-9335-e6d3b0202129";
    return data;
  }
}
