// class GetAllDepartmentModel {
//   late String message;
//   List<Data>? data;
//   late bool status;
//   late int code;
//
//   GetAllDepartmentModel({required this.message, this.data,required this.status,required this.code});
//
//   GetAllDepartmentModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     status = json['status'];
//     code = json['code'];
//   }
//
//
// }
//
// class Data {
//   int? id;
//   String? name;
//   Manager? manager;
//
//   Data({this.id, this.name, this.manager});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     manager =
//     json['manager'] != null ? Manager.fromJson(json['manager']) : null;
//   }
//
// }
//
// class Manager {
//   int? id;
//   String? userCode;
//   String? name;
//   String? email;
//   int? phone;
//   String? status;
//   String? userType;
//
//   Manager(
//       {this.id,
//         this.userCode,
//         this.name,
//         this.email,
//         this.phone,
//         this.status,
//         this.userType});
//
//   Manager.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userCode = json['user_code'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     status = json['status'];
//     userType = json['user_type'];
//   }
//
// }

class GetAllDepartmentModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  GetAllDepartmentModel({this.message, this.data, this.status, this.code});

  GetAllDepartmentModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  Manager? manager;
  List<Employees>? employees;

  Data({this.id, this.name, this.manager, this.employees});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager = json['manager'] != null ? Manager.fromJson(json['manager']) : null;
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
  }


}

class Manager {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Manager(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType,
        this.departmentId});

  Manager.fromJson(Map<String, dynamic> json) {
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

class Employees{
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Employees(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType,
        this.departmentId});

  Employees.fromJson(Map<String, dynamic> json) {
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
