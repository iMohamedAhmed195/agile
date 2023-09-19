import 'package:agile/models/get_all_tasks_model/get_all_tasks_model.dart';
import 'package:agile/models/get_department_model/get_department_model.dart';
import 'package:agile/models/get_user_model/get_all_user_model.dart';
import 'package:agile/models/update_Tasks_model/update_tasks_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_tasks_state.dart';

class UpdateTasksCubit extends Cubit<UpdateTasksState> {
  UpdateTasksCubit() : super(UpdateTasksInitial());

  static UpdateTasksCubit get(context) => BlocProvider.of(context);

  UpdateTasksModel? updateTasksModel;
  GetAllTasksModel? getAllTasksModel;
  GetAllUserModel? getAllUserModel;
  GetAllDepartmentModel? getAllDepartmentModel;

  List<String> userId = [''];
  List<String> departId = [''];
  List<String> tasksId = [''];
  String departChoose = '';
  String userChoose = '';
  String tasksChoose = '';


  chooseUser(String value) {
    userChoose = value;
    emit(ChooseValueState());
  }

  chooseDepart(String value) {
    departChoose = value;
    emit(ChooseValueState());
  }

  getUsers() async {
    emit(GetUserLoadingState());
    DioHelper.getData(
      url: getAllUser,
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {
      getAllUserModel = GetAllUserModel.fromJson(value.data);
      for (int i = 0; i < getAllUserModel!.data!.length; i++) {
        userId.add(getAllUserModel!.data![i].id!.toString());
      }

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

      emit(GetDepartSuccessState(getAllDepartmentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetDepartErrorState(error.toString()));
    });
  }

  getTasks() async {
    emit(GetTasksLoadingState());
    DioHelper.getData(
      url: getAllTasks,
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {
      getAllTasksModel = GetAllTasksModel.fromJson(value.data);
      for (int i = 0; i < getAllTasksModel!.data!.length; i++) {
        tasksId.add(getAllTasksModel!.data![i].id!.toString());
      }
      print('====> tasks $tasksId');
      emit(GetTasksSuccessState(getAllTasksModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetTasksErrorState(error.toString()));
    });
  }

  void updateUser(
      {required String name,
      required String description,
               String? photo,
      required String status,
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
        'status': status,
        'department_id': departId,
        'employee_id': userId,
        'start_date': userId,
        'end_date': userId,
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
}
