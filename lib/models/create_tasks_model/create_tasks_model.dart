class CreateTaskModel {
  late String message;
  Data? data;
  late bool status;
  late int code;

  CreateTaskModel({ required this.message, this.data,required this.status,required this.code});

  CreateTaskModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

}

class Data {
  int? id;
  String? name;
  String? description;
  String? photo;
  String? status;
  String? startDate;
  String? endDate;
  Creator? creator;
  Department? department;
  Creator? employee;

  Data(
      {this.id,
        this.name,
        this.description,
        this.photo,
        this.status,
        this.startDate,
        this.endDate,
        this.creator,
        this.department,
        this.employee});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
    status = json['status'];
    startDate = json['start date'];
    endDate = json['end date'];
    creator =
    json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    employee = json['employee'] != null
        ? Creator.fromJson(json['employee'])
        : null;
  }


}

class Creator {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Creator(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType,
        this.departmentId});

  Creator.fromJson(Map<String, dynamic> json) {
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

class Department {
  int? id;
  String? name;
  Creator? manager;

  Department({this.id, this.name, this.manager});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager =
    json['manager'] != null ? Creator.fromJson(json['manager']) : null;
  }

}
