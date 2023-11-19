import 'package:agile/models/get_all_tasks_model/get_all_tasks_model.dart';
import 'package:agile/models/get_department_model/get_department_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_admin_state.dart';

class HomeAdminCubit extends Cubit<HomeAdminState> {
  HomeAdminCubit() : super(HomeAdminInitial());

  static HomeAdminCubit get(context) => BlocProvider.of(context);

  GetAllDepartmentModel? getAllDepartmentModel;

  getDepart() async {
    emit(GetDepartLoadingState());
    DioHelper.getData(
      url: getAllDepart,
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {
      getAllDepartmentModel = GetAllDepartmentModel.fromJson(value.data);
      emit(GetDepartSuccessState(getAllDepartmentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetDepartErrorState(error.toString()));
    });
  }

  GetAllTasksModel? getAllTasksModel;

  getTasks() async {
    emit(GetTasksLoadingState());
    DioHelper.getData(
      url: getAllTasks,
      token: await Secure().secureGetData(key: 'token'),
    ).then((value) {

      getAllTasksModel = GetAllTasksModel.fromJson(value.data);
      emit(GetTasksSuccessState(getAllTasksModel!));
    }).catchError((error) {
      if(error is DioException){
        print(error);
      }
      print(error.message);
      emit(GetTasksErrorState(error.toString()));
    });
  }
}
