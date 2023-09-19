class ErrorModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  ErrorModel({this.message, this.data, this.status, this.code});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

}

class Data {
  List<String>? employeeId;

  Data({this.employeeId});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'].cast<String>();
  }

}
