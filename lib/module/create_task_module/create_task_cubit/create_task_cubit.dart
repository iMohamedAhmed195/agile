import 'package:agile/models/create_tasks_model/create_tasks_model.dart';
import 'package:agile/models/create_tasks_model/error_tasks.dart';
import 'package:agile/models/get_employee_model/get_employee_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit() : super(CreateTaskInitial());

  static CreateTaskCubit get(context) => BlocProvider.of(context);

  CreateTaskModel? createTaskModel;
  GetEmployeeModel? getEmployeeModel;
  ErrorModel? errorModel ;
  List<String> employeeId = [''];
  String valueChoose = '';
  DateTime? startDate ;
  DateTime? endDate ;

   getEmployee()async{
    emit(GetEmployeeLoadingState());
    DioHelper.getData(
      url: getAllEmployee,
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      getEmployeeModel = GetEmployeeModel.fromJson(value.data);
      for(int i = 0 ; i<getEmployeeModel!.data!.length;i++){
        employeeId.add(getEmployeeModel!.data![i].id!.toString());
      }
      print(employeeId);
      print("mostafa");
      emit(GetEmployeeSuccessState(getEmployeeModel!));

    })
        .catchError((error) {
      print(error.toString());
      emit(GetEmployeeErrorState(error.toString(),errorModel!));
    });
  }
  void createTask({required String title, required String description,required String employeeId,required String startDate,required String endDate}) async{
    emit(CreateTaskLoadingState());
    DioHelper.postData(
      url: createTasks,
      data: {
        'name': title,
        'description': description,
        'employee_id': employeeId,
        'start_date': startDate,
        'end_date':  endDate ,
      },
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      createTaskModel = CreateTaskModel.fromJson(value.data);
      emit(CreateTaskSuccessState(createTaskModel!));
    })
        .catchError((error) {

      print(error.toString());
      emit(CreateTaskErrorState(error.toString()));
    });
  }
}
