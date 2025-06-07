class SignupRequestModel {
  String? name;
  String? mobile;
  String? email;
  String? password;
  String? c_password;
  // String? onesignal_id;

  SignupRequestModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.password,
    required this.c_password,
    // required this.onesignal_id,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password,
      'c_password': c_password,
      // 'onesignal_id': onesignal_id,
    };
  }
}
