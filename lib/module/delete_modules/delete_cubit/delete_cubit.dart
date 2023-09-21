import 'package:agile/models/delete_depart_model/delete_depart_model.dart';
import 'package:agile/models/delete_tasks_model/delete_tasks_model.dart';
import 'package:agile/models/delete_user_model/delete_user_model.dart';
import 'package:agile/models/get_all_tasks_model/get_all_tasks_model.dart';
import 'package:agile/models/get_department_model/get_department_model.dart';
import 'package:agile/models/get_user_model/get_all_user_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitial());

  static DeleteCubit get(context) => BlocProvider.of(context);

   GetAllTasksModel? getAllTasksModel;
  GetAllUserModel? getAllUserModel;
  GetAllDepartmentModel? getAllDepartmentModel;
  DeleteUserModel? deleteUserModel;
  DeleteDepartModel? deleteDepartModel;
  DeleteTasksModel? deleteTasksModel;

  List<String> userId = ['Assigned Employee'];
  List<String> departId = ['Assigned Department'];
  List<String> taskId = ['Assigned Tasks'];
  String departChoose = 'Assigned Department';
  String userChoose = 'Assigned Employee';
  String taskChoose = 'Assigned Tasks';



  chooseUser(String value) {
    userChoose = value;
    emit(ChooseValueState());
  }

  chooseDepart(String value) {
    departChoose = value;
    emit(ChooseValueState());
  }
  chooseTask(String value) {
    taskChoose = value;
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
        if(getAllUserModel!.data![i].departmentId! == 0) {
          userId.add(getAllUserModel!.data![i].id!.toString());

        }
      }
      print(userId);
      emit(GetUserSuccessState(getAllUserModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }
  void deleteUsers({required String userId}) async {
    emit(DeleteUserLoadingState());

    DioHelper.deleteData(
      url: '$deleteUser$userId',
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {

      deleteUserModel = DeleteUserModel.fromJson(value.data);
      emit(DeleteUserSuccessState(deleteUserModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DeleteUserErrorState(error.toString()));
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
        if(getAllDepartmentModel!.data![i].employees!.isEmpty &&getAllDepartmentModel!.data![i].manager == null)
        {
          departId.add(getAllDepartmentModel!.data![i].id!.toString());
        }
      }
      print('====>user $departId');
      emit(GetDepartSuccessState(getAllDepartmentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetDepartErrorState(error.toString()));
    });
  }

  void deleteDeparts({required String departId}) async {
    emit(DeleteDepartLoadingState());
    DioHelper.deleteData(
      url: '$deleteDepart$departId',
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {

      deleteDepartModel = DeleteDepartModel.fromJson(value.data);
      emit(DeleteDepartSuccessState(deleteDepartModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DeleteDepartErrorState(error.toString()));
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
        taskId.add(getAllTasksModel!.data![i].id!.toString());
      }
      print('====>user $taskId');
      emit(GetTasksSuccessState(getAllTasksModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetTasksErrorState(error.toString()));
    });
  }

  void deleteTasks({required String tasksId}) async {
    emit(DeleteTasksLoadingState());
    DioHelper.deleteData(
      url: '$deleteTask$tasksId',
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {

      deleteTasksModel = DeleteTasksModel.fromJson(value.data);
      emit(DeleteTasksSuccessState(deleteTasksModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DeleteTasksErrorState(error.toString()));
    });
  }

}
