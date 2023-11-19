class AddUserModel {
  late String message;
  DataUser? data;
  late bool status;
  late int code;

  AddUserModel({required this.message, this.data,required this.status,required this.code});

  AddUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  DataUser.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
}

class DataUser {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;

  DataUser(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
  }

}
