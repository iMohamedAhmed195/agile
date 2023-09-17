class LoginErrorModel {
  late String message;
  late bool status;
  late int code;

  LoginErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }

}
