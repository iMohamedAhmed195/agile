
import 'package:agile/models/get_managers_model/get_managers_model.dart';
import 'package:agile/models/update_user_model/update_user_model.dart';
import 'package:agile/shared/network/remote/end_points.dart';

import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());

  static UpdateUserCubit get(context) => BlocProvider.of(context);

  UpdateUserModel? updateUserModel ;



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



  void updateUser({required String name, required String email,required String phone,required String userStatus,required String departId }) async{
    emit(UpdateUserLoadingState());

    DioHelper.postData(
      url: updateUserDetails,
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
