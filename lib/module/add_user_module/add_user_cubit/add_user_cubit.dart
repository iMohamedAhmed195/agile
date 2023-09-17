import 'package:agile/models/add_user_model/add_user_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserInitial());
  static AddUserCubit get(context) => BlocProvider.of(context);
  AddUserModel? addUserModel;

  void addedUser({required String name, required String email,required String phone,required String password , required String userType}) async{
    emit(AddUserLoadingState());

    DioHelper.postData(
        url: addUser,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
          'user_type': userType,
        },
        token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      if(value.statusCode == 401){
        addUserModel = AddUserModel.fromJson(value.data);
      }
      else{
        addUserModel = AddUserModel.fromJson(value.data);
        emit(AddUserSuccessState(addUserModel!));
      }
    })
        .catchError((error) {
      print(error.toString());
      emit(AddUserErrorState(error.toString()));
    });
  }
}