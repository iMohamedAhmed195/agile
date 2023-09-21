class DeleteUserModel {
  String? message;
  bool? status;
  int? code;

  DeleteUserModel({this.message, this.status, this.code});

  DeleteUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }

}
