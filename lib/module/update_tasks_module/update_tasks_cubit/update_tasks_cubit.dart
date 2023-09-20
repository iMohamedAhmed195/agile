import 'dart:io';

import 'package:agile/models/get_all_tasks_model/get_all_tasks_model.dart';
import 'package:agile/models/get_department_model/get_department_model.dart';
import 'package:agile/models/get_user_model/get_all_user_model.dart';
import 'package:agile/models/update_Tasks_model/update_tasks_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'update_tasks_state.dart';

class UpdateTasksCubit extends Cubit<UpdateTasksState> {
  UpdateTasksCubit() : super(UpdateTasksInitial());

  static UpdateTasksCubit get(context) => BlocProvider.of(context);

  UpdateTasksModel? updateTasksModel;
  // GetAllTasksModel? getAllTasksModel;
  GetAllUserModel? getAllUserModel;
  GetAllDepartmentModel? getAllDepartmentModel;

  List<String> userId = ['Assigned Employee'];
  List<String> departId = ['Assigned Department'];
  // List<String> tasksId = [''];
  String departChoose = 'Assigned Department';
  String userChoose = 'Assigned Employee';
  String tasksChoose = '';


  getUsers() async {
    emit(GetUserLoadingState());
    DioHelper.getData(
      url: getAllUser,
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {
      getAllUserModel = GetAllUserModel.fromJson(value.data);
      for (int i = 0; i < getAllUserModel!.data!.length; i++) {
        if(getAllUserModel!.data![i].userType == 'employee') {
          userId.add(getAllUserModel!.data![i].id!.toString());
        }
      }
      print('====>user $userId');
      emit(GetUserSuccessState(getAllUserModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }

  getDepart() async {
    emit(GetDepartLoadingState());
    DioHelper.getData(
      url: getAllDepart,
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {
      getAllDepartmentModel = GetAllDepartmentModel.fromJson(value.data);
      for (int i = 0; i < getAllDepartmentModel!.data!.length; i++) {
        departId.add(getAllDepartmentModel!.data![i].id!.toString());
      }
      print('====>user $departId');
      emit(GetDepartSuccessState(getAllDepartmentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetDepartErrorState(error.toString()));
    });
  }

  // getTasks() async {
  //   emit(GetTasksLoadingState());
  //   DioHelper.getData(
  //     url: getAllTasks,
  //     token: await Secure().secureGetData(key: 'token'),
  //   ).then((value) {
  //     getAllTasksModel = GetAllTasksModel.fromJson(value.data);
  //     for (int i = 0; i < getAllTasksModel!.data!.length; i++) {
  //       tasksId.add(getAllTasksModel!.data![i].id!.toString());
  //     }
  //     print('====> tasks $tasksId');
  //     emit(GetTasksSuccessState(getAllTasksModel!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetTasksErrorState(error.toString()));
  //   });
  // }

  int index = 0;
  String selectValue ='admin';

  void changeRadio(String y){
    if(y == 'NEW'){
      index =0;
      selectValue = y;
      emit(AddUserChange());
    }
    else if(y == 'PROCESSING'){
      index = 1;
      selectValue = y;
      emit(AddUserChange());

    }
    else if (y == 'CANCELLED'){
      index = 2;
      selectValue = y;
      emit(AddUserChange());

    }
    else if(y == 'COMPLETED'){
      index = 3;
      selectValue = y;
      emit(AddUserChange());

    }
    else if (y == 'NOT COMPLETED'){
      index = 4;
      selectValue = y;
      emit(AddUserChange());

    }
    else if (y == 'EXPIRED'){
      index = 5;
      selectValue = y;
      emit(AddUserChange());

    }

  }

  chooseUser(String value) {
    userChoose = value;
    emit(ChooseValueState());
  }

  chooseDepart(String value) {
    departChoose = value;
    emit(ChooseValueState());
  }


  final ImagePicker picker = ImagePicker();

  File? profileImage;
  XFile? pickedFile;

  Future<void> getImageProfileFromGallery() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }


  void updateUser(
      {required String name,
      required String description,
               String? photo,
      required String departId,
      required String taskId,
      required String userId,
      required String startDate,
      required String endDate,
      }) async {
    emit(UpdateTasksLoadingState());

    DioHelper.postData(
      url: '$updateTasks$taskId',
      data: {
        'name': name,
        'description': description,
        'photo': photo,
        'status': index,
        'department_id': departId,
        'employee_id': userId,
        'start_date': startDate,
        'end_date': endDate,
      },
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {

      updateTasksModel = UpdateTasksModel.fromJson(value.data);
      emit(UpdateTasksSuccessState(updateTasksModel!));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateTasksErrorState(error.toString()));
    });
  }




  bool readOnly = true ;

  changeTitleInTask(bool read){
    if(read == true){
      readOnly = false ;
      emit(ChangeReadOnlyState());
    }else if(read == false){
      readOnly = true ;
      emit(ChangeReadOnlyState());
    }
  }



  DateTime? firstDate;
  DateTime? lastDate;
  String? splitStartDate;
  String? splitEndDate;
  Future<void> selectStartDate(BuildContext context) async {
    DateTime? selectedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selectedStartDate != null) {
      if (firstDate == null) {
        firstDate = selectedStartDate;
        splitStartDate = '${firstDate?.year}/${firstDate?.month}/${firstDate?.day}';
        emit(DateChange());
        print(splitStartDate);
      }
      else{
        firstDate = selectedStartDate;
        splitStartDate = '${firstDate?.year}/${firstDate?.month}/${firstDate?.day}';
        print(splitStartDate);
      }
    }


  }
  Future<void> selectEndDate(BuildContext context) async {
    DateTime? selectedEndDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selectedEndDate != null) {
      if (lastDate == null) {
        lastDate = selectedEndDate;
        splitEndDate = '${lastDate?.year}/${lastDate?.month}/${lastDate?.day}';
        emit(DateChange());
        print(splitStartDate);
      }else{
        lastDate = selectedEndDate;
        splitEndDate = '${lastDate?.year}/${lastDate?.month}/${lastDate?.day}';
        emit(DateChange());
        print(splitStartDate);
      }

    }


  }
}
