class AddDepartFailureModel {
  late String message;

  late bool status;
  late int code;

  AddDepartFailureModel({required this.message,required this.status,required this.code});

  AddDepartFailureModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    status = json['status'];
    code = json['code'];
  }


}
