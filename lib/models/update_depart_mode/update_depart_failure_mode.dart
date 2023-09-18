class UpdateDepartFailureModel {
  late String message;
  Data? data;
  late bool status;
  late int code;

  UpdateDepartFailureModel(
      {required this.message, this.data, required this.status, required this.code});

  UpdateDepartFailureModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

}

class Data {
  List<String>? managerId;
  Data({this.managerId});

  Data.fromJson(Map<String, dynamic> json) {
    managerId = json['manager_id'].cast<String>();
  }

}
