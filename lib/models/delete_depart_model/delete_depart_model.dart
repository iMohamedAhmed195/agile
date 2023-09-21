class DeleteDepartModel {
  String? message;
  bool? status;
  int? code;

  DeleteDepartModel({this.message, this.status, this.code});

  DeleteDepartModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }

}
