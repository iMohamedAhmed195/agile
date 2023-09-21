

import 'package:agile/models/log_in_model/log_in_error_model.dart';
import 'package:agile/models/log_in_model/log_in_success_model.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  LoginErrorModel? loginErrorModel;



  void loginApp({required String email, required String password}) {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: logIn,
        data: {'email': email, 'password': password})
        .then((value) {
         loginModel = LoginModel.fromJson(value.data);
         emit(LoginSuccessState(loginModel!));
    })
        .catchError((error) {


      print(error.toString());
      emit(LoginErrorState(error:error.toString(),));
    });
  }
}
