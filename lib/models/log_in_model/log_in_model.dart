class LoginModel {
  late String message;
  DataUser? data;
  late bool status;
  late int code;



  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  DataUser.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

}

class DataUser {
  late String token;
  late String username;
  late String email;
  late String userType;

  DataUser.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    email = json['email'];
    userType = json['user_type'];
  }


}
