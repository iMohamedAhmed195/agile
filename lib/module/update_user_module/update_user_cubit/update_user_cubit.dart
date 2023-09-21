
import 'package:agile/models/create_tasks_model/error_tasks.dart';
import 'package:agile/models/get_department_model/get_department_model.dart';
import 'package:agile/models/get_user_model/get_all_user_model.dart';
import 'package:agile/models/update_user_model/update_user_model.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());

  static UpdateUserCubit get(context) => BlocProvider.of(context);
  List<String> userId = ['Assigning User'];
  List<String> departId = ['Assigning Depart'];
  UpdateUserModel? updateUserModel ;
  GetAllUserModel? getAllUserModel;
  GetAllDepartmentModel? getAllDepartmentModel;
  ErrorModel? errorModel ;
  String departChoose = 'Assigning Depart';
  String userChoose = 'Assigning User';


  int index = 0;
  String selectValue ='admin';
  void changeRadio(String y){
    if(y == 'admin'){
      index =0;
      selectValue = y;
      emit(UpdateUserChange());
    }else if(y == 'manager'){
      index = 1;
      selectValue = y;
      emit(UpdateUserChange());

    }else if (y == 'user'){
      index = 2;
      selectValue = y;
      emit(UpdateUserChange());

    }

  }


   chooseUser(String value){
    userChoose = value ;
    emit(ChooseValueState());
  }
   chooseDepart(String value){
        departChoose = value ;
    emit(ChooseValueState());
  }

  getUsers()async{
    emit(GetUserLoadingState());
    DioHelper.getData(
      url: getAllUser,
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      getAllUserModel = GetAllUserModel.fromJson(value.data);
      for(int i = 0 ; i<getAllUserModel!.data!.length;i++){
        userId.add(getAllUserModel!.data![i].id!.toString());
      }

      emit(GetUserSuccessState(getAllUserModel!));

    })
        .catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }

  getDepart()async{
    emit(GetDepartLoadingState());
    DioHelper.getData(
      url: getAllDepart,
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      getAllDepartmentModel = GetAllDepartmentModel.fromJson(value.data);
      for(int i = 0 ; i<getAllDepartmentModel!.data!.length;i++){
        departId.add(getAllDepartmentModel!.data![i].id!.toString());
      }

      emit(GetDepartSuccessState(getAllDepartmentModel!));

    })
        .catchError((error) {
      print(error.toString());
      emit(GetDepartErrorState(error.toString()));
    });
  }


  void updateUser({required String name, required String email,required String phone,required String userStatus,required String departId ,required String userId }) async{
    emit(UpdateUserLoadingState());

    DioHelper.postData(
      url: '$updateUserDetails$userId',
      data: {
        'email': email,
        'name': name,
        'phone': phone,
        'user_type': index ,
        'user_status': userStatus ,
        'department_id':departId
      },
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {

      updateUserModel = UpdateUserModel.fromJson(value.data);
      emit(UpdateUserSuccessState(updateUserModel!));
    })
        .catchError((error) {
      print(error.toString());
      emit(UpdateUserErrorState(error.toString()));
    });
  }

}
