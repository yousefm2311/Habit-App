// ignore_for_file: non_constant_identifier_names

class LoginModel {
  String? access_token;

  LoginModel.fromJson(Map<String, dynamic> json) {
    access_token = json["access_token"];
  }
}
