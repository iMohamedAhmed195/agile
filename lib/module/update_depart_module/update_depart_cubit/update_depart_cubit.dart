
import 'package:agile/models/get_managers_model/get_managers_model.dart';
import 'package:agile/models/get_user_model/get_all_user_model.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/models/update_depart_mode/update_depart_failure_mode.dart';
import 'package:agile/models/update_depart_mode/update_depart_success_mode.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_depart_state.dart';

class UpdateDepartCubit extends Cubit<UpdateDepartState> {
  UpdateDepartCubit() : super(UpdateDepartInitial());
  static UpdateDepartCubit get(context) => BlocProvider.of(context);

  UpdateDepartSuccessModel? updateDepartSuccessModel;
  UpdateDepartFailureModel? updateDepartFailureModel;
  GetAllManagersModel? getAllManagersModel;
  GetAllUserModel? getAllUserModel;
  List<String> userId = ['Assigning employee'];
  List<String> managersId= ['Assigning manager'];
  String managerChoose ='Assigning manager' ;
  String userChoose ='Assigning employee';



  chooseManager(String value){
    managerChoose = value ;
    emit(ChooseValueState());
  }

  chooseUser(String value){
    userChoose = value ;
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


  void getManagers()async{
    emit(GetManagerLoadingState());

    DioHelper.getData(
      url: getAllManagers,
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      getAllManagersModel = GetAllManagersModel.fromJson(value.data);
      for(int i = 0 ; i<getAllManagersModel!.data!.length;i++){
        managersId.add(getAllManagersModel!.data![i].id.toString());
      }

      emit(GetManagerSuccessState(getAllManagersModel!));
    })
        .catchError((error) {
      print(error.toString());
      emit(GetManagerErrorState(error.toString()));
    });
  }


  void updateDepartment({required String nameDepart , required String managerId ,required String userId}) async{
    emit(UpdateDepartLoadingState());

    DioHelper.postData(
      url: "$updateDepart$userId",
      data: {
        'name': nameDepart,
        'manager_id': managerId
      },
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      updateDepartSuccessModel = UpdateDepartSuccessModel.fromJson(value.data);
      emit(UpdateDepartSuccessState(updateDepartSuccessModel!));
    })
        .catchError((error) {
      print(error.toString());
      emit(UpdateDepartErrorState(error.toString()));
    });
  }
}
