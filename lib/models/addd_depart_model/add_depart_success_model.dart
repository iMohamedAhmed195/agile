class AddDepartModel {
  late String message;
  Data? data;
  late bool status;
  late int code;

  AddDepartModel({required this.message, this.data,required this.status,required this.code});

  AddDepartModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

}

class Data {
  int? id;
  String? name;
  dynamic manager;

  Data({this.id, this.name, this.manager});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager = json['manager'];
  }


}
