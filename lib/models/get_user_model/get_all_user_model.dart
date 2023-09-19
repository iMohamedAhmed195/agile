class GetAllUserModel {
  late String message;
  List<Data>? data;
  late  bool status;
  late int code;

  GetAllUserModel({ required this.message, this.data,required this.status,required this.code});

  GetAllUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }


}

class Data {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Data(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType,
        this.departmentId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
    departmentId = json['department_id'];
  }

}
