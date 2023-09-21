class DeleteTasksModel {
  String? message;
  bool? status;
  int? code;

  DeleteTasksModel({this.message, this.status, this.code});

  DeleteTasksModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }

}
